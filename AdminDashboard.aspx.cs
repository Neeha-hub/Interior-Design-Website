using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InteriorDesign
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        private string connectionString = "Data Source=NEEHA\\MSSQLSERVER02;Initial Catalog=UserDB;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if user is logged in and is admin
                if (Session["AdminID"] == null)
                {
                    Response.Redirect("AdminLogin.aspx");
                    return;
                }

                // Load admin name
                litAdminName.Text = Session["AdminName"].ToString();

                // Load dashboard data
                LoadDashboardStats();
                LoadPendingApprovals();
            }
        }

        private void LoadDashboardStats()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // Get total projects count
                SqlCommand cmdProjects = new SqlCommand("SELECT COUNT(*) FROM Projects", conn);
                litTotalProjects.Text = cmdProjects.ExecuteScalar().ToString();

                // Get total clients count (assuming you have a Clients table)
                SqlCommand cmdClients = new SqlCommand("SELECT COUNT(*) FROM Users", conn);
                litTotalClients.Text = cmdClients.ExecuteScalar().ToString();

                // Get upcoming appointments count
                SqlCommand cmdAppointments = new SqlCommand("SELECT COUNT(*) FROM Bookings WHERE booking_date > GETDATE() AND status = 'Approved'", conn);
                litAppointments.Text = cmdAppointments.ExecuteScalar().ToString();

                // Get new consultation requests count
                SqlCommand cmdMessages = new SqlCommand("SELECT COUNT(*) FROM ConsultationRequests WHERE Contacted = 0", conn);
                litMessages.Text = cmdMessages.ExecuteScalar().ToString();
            }
        }

        private void LoadPendingApprovals()
        {
            LoadProjects();
            LoadConsultationRequests();
            LoadBookings();
        }

        // Projects GridView handling
        private void LoadProjects()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Projects ORDER BY created_date DESC", conn);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                conn.Open();
                adapter.Fill(dt);

                gvProjects.DataSource = dt;
                gvProjects.DataBind();
            }
        }

        protected void gvProjects_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int projectId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "ApproveProject")
            {
                UpdateProjectStatus(projectId, "Approved");
                LoadProjects();
            }
            else if (e.CommandName == "RejectProject")
            {
                UpdateProjectStatus(projectId, "Rejected");
                LoadProjects();
            }
            else if (e.CommandName == "ViewProject")
            {
                // Redirect to project details page
                Response.Redirect($"ProjectDetails.aspx?id={projectId}");
            }
        }

        private void UpdateProjectStatus(int projectId, string status)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("UPDATE Projects SET status = @Status WHERE id = @ProjectId", conn);
                cmd.Parameters.AddWithValue("@Status", status);
                cmd.Parameters.AddWithValue("@ProjectId", projectId);

                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        // Consultation Requests GridView handling
        private void LoadConsultationRequests()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM ConsultationRequests ORDER BY RequestDate DESC", conn);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                conn.Open();
                adapter.Fill(dt);

                gvConsultationRequests.DataSource = dt;
                gvConsultationRequests.DataBind();
            }
        }

        protected void gvConsultationRequests_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int requestId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "MarkContacted")
            {
                UpdateConsultationStatus(requestId);
                LoadConsultationRequests();
            }
            else if (e.CommandName == "ViewDetails")
            {
                LoadConsultationDetails(requestId);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "$('#consultationModal').modal('show');", true);
            }
        }

        private void UpdateConsultationStatus(int requestId)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                // Get admin name from session
                string adminName = Session["AdminName"].ToString();

                SqlCommand cmd = new SqlCommand(
                    "UPDATE ConsultationRequests SET Contacted = 1, ContactedBy = @AdminName, ContactDate = GETDATE(), Status = 'Contacted' WHERE RequestID = @RequestId",
                    conn);
                cmd.Parameters.AddWithValue("@AdminName", adminName);
                cmd.Parameters.AddWithValue("@RequestId", requestId);

                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        private void LoadConsultationDetails(int requestId)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM ConsultationRequests WHERE RequestID = @RequestId", conn);
                cmd.Parameters.AddWithValue("@RequestId", requestId);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    hdnRequestID.Value = requestId.ToString();
                    txtName.Text = reader["Name"].ToString();
                    txtEmail.Text = reader["Email"].ToString();
                    txtPhone.Text = reader["Phone"].ToString();
                    txtService.Text = reader["Service"].ToString();

                    // Additional fields can be populated here
                }

                reader.Close();
            }
        }

        protected void btnUpdateConsultation_Click(object sender, EventArgs e)
        {
            int requestId = Convert.ToInt32(hdnRequestID.Value);
            string notes = txtNotes.Text;
            string status = ddlStatus.SelectedValue;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string adminName = Session["AdminName"].ToString();

                SqlCommand cmd = new SqlCommand(
                    "UPDATE ConsultationRequests SET Contacted = 1, ContactedBy = @AdminName, ContactDate = GETDATE(), Status = @Status, Notes = @Notes WHERE RequestID = @RequestId",
                    conn);
                cmd.Parameters.AddWithValue("@AdminName", adminName);
                cmd.Parameters.AddWithValue("@Status", status);
                cmd.Parameters.AddWithValue("@Notes", notes);
                cmd.Parameters.AddWithValue("@RequestId", requestId);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            LoadConsultationRequests();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "$('#consultationModal').modal('hide');", true);
        }

        // Bookings GridView handling
        private void LoadBookings()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Bookings ORDER BY created_date DESC", conn);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                conn.Open();
                adapter.Fill(dt);

                gvBookings.DataSource = dt;
                gvBookings.DataBind();
            }
        }

        protected void gvBookings_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int bookingId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "ApproveBooking")
            {
                UpdateBookingStatus(bookingId, "Approved");
                LoadBookings();
            }
            else if (e.CommandName == "RejectBooking")
            {
                UpdateBookingStatus(bookingId, "Rejected");
                LoadBookings();
            }
            else if (e.CommandName == "ViewBooking")
            {
                // Redirect to booking details page
                Response.Redirect($"BookingDetails.aspx?id={bookingId}");
            }
        }

        private void UpdateBookingStatus(int bookingId, string status)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("UPDATE Bookings SET status = @Status WHERE id = @BookingId", conn);
                cmd.Parameters.AddWithValue("@Status", status);
                cmd.Parameters.AddWithValue("@BookingId", bookingId);

                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        // Helper methods for CSS classes
        protected string GetStatusBadgeClass(string status)
        {
            switch (status.ToLower())
            {
                case "approved":
                    return "badge bg-success";
                case "pending":
                    return "badge bg-warning";
                case "rejected":
                    return "badge bg-danger";
                case "in progress":
                    return "badge bg-primary";
                case "completed":
                    return "badge bg-info";
                default:
                    return "badge bg-secondary";
            }
        }

        protected string GetContactStatusBadgeClass(string contacted)
        {
            return Convert.ToBoolean(contacted) ? "badge bg-success" : "badge bg-warning";
        }

        protected string GetBookingStatusBadgeClass(string status)
        {
            switch (status.ToLower())
            {
                case "approved":
                    return "badge bg-success";
                case "pending":
                    return "badge bg-warning";
                case "rejected":
                    return "badge bg-danger";
                default:
                    return "badge bg-secondary";
            }
        }

        protected bool NeedsApproval(string status)
        {
            return status.ToLower() == "pending";
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Clear session and redirect to login
            Session.Clear();
            Response.Redirect("WebForm1.aspx");
        }
    }
}