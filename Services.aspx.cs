using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Drawing;
using System.Data.SqlClient;
using System.Data;

namespace InteriorDesign
{
    public partial class Services : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadServiceImages();
                ClearForm();
            }
        }

        private void LoadServiceImages()
        {
            imgLEDMirrors.ImageUrl = "https://www.glazonoid.com/cdn/shop/products/Sophire-1.jpg?v=1711610738&width=1946";
            imgGlassPartitions.ImageUrl = "https://shopps.in/wp-content/uploads/2023/10/H495e2d11d7eb47c4bc4780a3d395263a9.jpg_960x960.webp";
            imgGlassRailings.ImageUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFNnEm81cSMVEHstkf1-k-kX6sC204OxxkFQ&s";
            imgUPVC.ImageUrl = "https://geegroups.com/wp-content/uploads/2024/05/all-you-need-to-know-about-upvc-windows.jpg";
            imgPergola.ImageUrl = "https://hips.hearstapps.com/hmg-prod/images/livvyland-blog-olivia-watson-before-after-outside-patio-renovation-reveal-furniture-austin-texas-lifestyle-blogger-13-1545405942.jpg?crop=0.968xw:0.971xh";
            imgGlassTables.ImageUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQECqsFl2jZdzCLPpjTYdm374ZhWKyV9XVASQ&s";
            imgEtchedGlass.ImageUrl = "https://cpimg.tistatic.com/04178395/b/6/Etched-Glass.jpg";
            imgGlassSigns.ImageUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3trqye1--HnnyEepQ2HC3xveyWXxV0Z07FA&s";
            imgShowerCubicle.ImageUrl = "https://5.imimg.com/data5/SELLER/Default/2023/12/366647406/QD/MV/LL/37454717/shower-cubicle-250x250.jpg";
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (ValidateForm())
            {
                try
                {
                    LogConsultationRequest();

                    lblMessage.Text = "Thank you for your interest! We'll contact you within 24 hours.";
                    lblMessage.ForeColor = Color.Green;

                    ClearForm();
                }
                catch (Exception ex)
                {
                    // Log the specific error for debugging
                    System.Diagnostics.Debug.WriteLine("Database Error: " + ex.Message);

                    lblMessage.Text = "We're sorry, there was an error processing your request. Please try again later.";
                    lblMessage.ForeColor = Color.Red;
                }
            }
        }

        private bool ValidateForm()
        {
            List<string> errors = new List<string>();

            if (string.IsNullOrWhiteSpace(txtName.Text))
                errors.Add("Please enter your name.");

            if (string.IsNullOrWhiteSpace(txtEmail.Text))
                errors.Add("Please enter a valid email address.");

            if (string.IsNullOrWhiteSpace(txtPhone.Text))
                errors.Add("Please enter your phone number.");

            if (ddlService.SelectedIndex == 0)
                errors.Add("Please select a service.");

            if (errors.Count > 0)
            {
                lblMessage.Text = string.Join("<br/>", errors);
                lblMessage.ForeColor = Color.Red;
                return false;
            }

            return true;
        }

        private void LogConsultationRequest()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["UserDBConnection"].ConnectionString;
            string query = @"INSERT INTO [dbo].[ConsultationRequests] 
                           (Name, Email, Phone, Service, Message, RequestDate, Contacted, Status) 
                           VALUES (@Name, @Email, @Phone, @Service, @Message, @RequestDate, @Contacted, @Status)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.Add("@Name", SqlDbType.NVarChar, 100).Value = txtName.Text;
                command.Parameters.Add("@Email", SqlDbType.NVarChar, 100).Value = txtEmail.Text;
                command.Parameters.Add("@Phone", SqlDbType.NVarChar, 50).Value = txtPhone.Text;
                command.Parameters.Add("@Service", SqlDbType.NVarChar, 100).Value = ddlService.SelectedValue;
                command.Parameters.Add("@Message", SqlDbType.NVarChar).Value = txtMessage.Text;
                command.Parameters.Add("@RequestDate", SqlDbType.DateTime).Value = DateTime.Now;
                command.Parameters.Add("@Contacted", SqlDbType.Bit).Value = false; // Default value
                command.Parameters.Add("@Status", SqlDbType.NVarChar, 50).Value = "New"; // Default value

                connection.Open();
                command.ExecuteNonQuery();
            }
        }

        private void ClearForm()
        {
            txtName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtMessage.Text = "";
            ddlService.SelectedIndex = 0;
        }
    }
}