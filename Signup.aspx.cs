using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace InteriorDesign
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Clear any existing form data
                txtName.Text = string.Empty;
                txtEmail.Text = string.Empty;
                txtPhone.Text = string.Empty;
                txtAddress.Text = string.Empty;
                txtPassword.Text = string.Empty;
            }
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["UserDBConnection"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("InsertUser", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@full_name", txtName.Text.Trim());
                        cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
                        cmd.Parameters.AddWithValue("@phone", txtPhone.Text.Trim());
                        cmd.Parameters.AddWithValue("@address", txtAddress.Text.Trim());
                        cmd.Parameters.AddWithValue("@password", txtPassword.Text);

                        conn.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                int userId = Convert.ToInt32(reader["user_id"]);
                                Session["user_id"] = userId;
                                Session["user_name"] = txtName.Text.Trim();
                                Response.Redirect("WebForm1.aspx");
                            }
                        }
                    }
                }
            }
            catch (SqlException sqlEx)
            {
                if (sqlEx.Number == 2627) // Unique constraint error number
                {
                    lblMessage.Text = "This email is already registered. Please use a different email.";
                }
                else
                {
                    lblMessage.Text = "A database error occurred. Please try again later.";
                    // Log the error for debugging
                    System.Diagnostics.Debug.WriteLine(sqlEx.Message);
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "An error occurred during registration. Please try again.";
                // Log the error for debugging
                System.Diagnostics.Debug.WriteLine(ex.Message);
            }
        }
    }
}