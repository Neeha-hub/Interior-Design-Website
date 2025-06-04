using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace InteriorDesign
{
    public partial class ContactUs : System.Web.UI.Page
    {
        private string connectionString = @"Data Source=NEEHA\MSSQLSERVER02;Initial Catalog=UserDB;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            // Page initialization
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    // Test database connection first
                    TestDatabaseConnection();

                    // If connection successful, save the data
                    SaveToDatabase();

                    // Only try to send email if database save was successful
                    SendEmail();

                    // Show success message and clear form
                    SuccessPanel.Visible = true;
                    ClearForm();
                }
                catch (SqlException ex)
                {
                    string errorMessage = "Database Error: ";
                    switch (ex.Number)
                    {
                        case 4060: // Invalid Database
                            errorMessage += "Cannot open database. Please verify the database name.";
                            break;
                        case 18456: // Login Failed
                            errorMessage += "Authentication failed. Please check database credentials.";
                            break;
                        case 2627: // Unique constraint error
                            errorMessage += "This record already exists.";
                            break;
                        default:
                            errorMessage += "Database connection error. Error code: " + ex.Number;
                            break;
                    }
                    ScriptManager.RegisterStartupScript(this, GetType(), "showError",
                        $"alert('{errorMessage}');", true);
                }
                catch (Exception ex)
                {
                    string errorMessage = "Error: " + ex.Message.Replace("'", "\"");
                    ScriptManager.RegisterStartupScript(this, GetType(), "showError",
                        $"alert('{errorMessage}');", true);
                }
            }
        }

        private void TestDatabaseConnection()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open(); // This will throw an exception if connection fails
            }
        }

        private void SaveToDatabase()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE name = 'ContactSubmissions')
                               CREATE TABLE ContactSubmissions (
                                   ID INT IDENTITY(1,1) PRIMARY KEY,
                                   FullName NVARCHAR(100) NOT NULL,
                                   Email NVARCHAR(100) NOT NULL,
                                   Phone NVARCHAR(20),
                                   Subject NVARCHAR(100) NOT NULL,
                                   Message NTEXT NOT NULL,
                                   SubmissionDate DATETIME DEFAULT GETDATE()
                               );
                               
                               INSERT INTO ContactSubmissions (FullName, Email, Phone, Subject, Message) 
                               VALUES (@FullName, @Email, @Phone, @Subject, @Message)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@FullName", txtName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Phone", txtPhone.Text.Trim());
                    cmd.Parameters.AddWithValue("@Subject", ddlSubject.SelectedValue);
                    cmd.Parameters.AddWithValue("@Message", txtMessage.Text.Trim());

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        private void SendEmail()
        {
            // For now, let's skip email sending to isolate database issues
            return;

            // Email sending code here...
        }

        private void ClearForm()
        {
            txtName.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtPhone.Text = string.Empty;
            ddlSubject.SelectedIndex = 0;
            txtMessage.Text = string.Empty;
        }
    }
}