using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InteriorDesign
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblError.Visible = false;

            // If user is already authenticated, redirect to admin dashboard
            if (User.Identity.IsAuthenticated && Session["IsAdmin"] != null && (bool)Session["IsAdmin"])
            {
                Response.Redirect("AdminDashboard.aspx");
            }
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text;

            // Validate input
            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                ShowError("Please enter both username and password.");
                return;
            }

            try
            {
                // Get connection string from web.config
                string connectionString = ConfigurationManager.ConnectionStrings["UserDBConnection"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    // Using parameters to prevent SQL injection
                    SqlCommand cmd = new SqlCommand("SELECT AdminID, Username, Password, FullName, Email FROM Admins WHERE Username = @Username AND Password = @Password", conn);
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password);

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        // Login successful
                        int adminId = Convert.ToInt32(reader["AdminID"]);
                        string fullName = reader["FullName"].ToString();

                        // Create authentication ticket
                        FormsAuthentication.SetAuthCookie(username, chkRememberMe.Checked);

                        // Store admin information in session
                        Session["AdminID"] = adminId;
                        Session["AdminName"] = fullName;
                        Session["IsAdmin"] = true;

                        // Redirect to admin dashboard
                        Response.Redirect("AdminDashboard.aspx");
                    }
                    else
                    {
                        ShowError("Invalid username or password.");
                    }
                }
            }
            catch (Exception ex)
            {
                ShowError("An error occurred: " + ex.Message);
                // Log the exception
                System.Diagnostics.Debug.WriteLine("Login error: " + ex.ToString());
            }
        }

        private void ShowError(string message)
        {
            lblError.Text = message;
            lblError.Visible = true;
        }
    }
}