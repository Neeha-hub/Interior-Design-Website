using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InteriorDesign
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Clear any existing form data
                txtEmail.Text = string.Empty;
                txtPhone.Text = string.Empty;
                txtPassword.Text = string.Empty;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                lblMessage.Text = "Attempting login...";

                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["UserDBConnection"].ConnectionString))
                {
                    string query = @"SELECT user_id, full_name, email FROM Users 
                           WHERE email = @email 
                           AND phone = @phone 
                           AND password = @password";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
                        cmd.Parameters.AddWithValue("@phone", txtPhone.Text.Trim());
                        cmd.Parameters.AddWithValue("@password", txtPassword.Text);

                        conn.Open();

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                // Store user info in session
                                Session["user_id"] = reader["user_id"].ToString();
                                Session["user_name"] = reader["full_name"].ToString();
                                Session["user_email"] = reader["email"].ToString();

                                // Redirect to dashboard or home page
                                Response.Redirect("UserDashboard.aspx");
                            }
                            else
                            {
                                lblMessage.Text = "Invalid email, phone number, or password. Please check your credentials and try again.";
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                System.Diagnostics.Debug.WriteLine(ex.Message);
            }
        }
    }
}
