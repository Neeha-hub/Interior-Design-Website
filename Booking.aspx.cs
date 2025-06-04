using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InteriorDesign
{
    public partial class Booking : System.Web.UI.Page
    {
        string connectionString = @"Data Source=NEEHA\MSSQLSERVER02;Initial Catalog=userDB;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Generate and set booking ID
                txtBookingId.Text = GenerateBookingId();

                // Check if user is logged in
                if (Session["user_id"] == null)
                {
                    Response.Redirect("Loginpage.aspx");
                }

            }
        }
            private string GenerateBookingId()
        {
            // Generate a unique booking ID combining "BK-" and timestamp
            return "BK-" + DateTime.Now.ToString("yyyyMMddHHmmss");
        }

        protected void ValidateBookingDate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            if (DateTime.TryParse(args.Value, out DateTime selectedDate))
            {
                args.IsValid = selectedDate.Date >= DateTime.Now.Date;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void btnBook_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    SaveBooking();
                    lblMessage.CssClass = "alert alert-success";
                    lblMessage.Text = "Booking submitted successfully! We will contact you shortly.";
                    ClearForm();
                }
                catch (Exception ex)
                {
                    lblMessage.CssClass = "alert alert-danger";
                    lblMessage.Text = "Error creating booking: " + ex.Message;
                }
            }
        }

        private void SaveBooking()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["UserDBConnection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = @"INSERT INTO Bookings 
                        (booking_id, service_name, booking_date, status, user_id, created_date) 
                        VALUES 
                        (@booking_id, @service_name, @booking_date, @status, @user_id, @created_date)";

                    cmd.Parameters.AddWithValue("@booking_id", txtBookingId.Text);
                    cmd.Parameters.AddWithValue("@service_name", rblServices.SelectedValue);
                    cmd.Parameters.AddWithValue("@booking_date", DateTime.Parse(txtBookingDate.Text));
                    cmd.Parameters.AddWithValue("@status", "Pending");
                    cmd.Parameters.AddWithValue("@user_id", Session["user_id"]);
                    cmd.Parameters.AddWithValue("@created_date", DateTime.Now);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        private void ClearForm()
        {
            txtBookingId.Text = GenerateBookingId();
            rblServices.SelectedIndex = -1;
            txtBookingDate.Text = string.Empty;
        }
    }
}
    