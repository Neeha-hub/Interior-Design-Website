<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="InteriorDesign.AdminDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard - Interior Designer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css"/>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
        }
        
        .sidebar {
            height: 100vh;
            background-color: #333;
            color: white;
            position: fixed;
            width: 250px;
            z-index: 1000;
        }
        
        .sidebar-header {
            padding: 20px;
            border-bottom: 1px solid #444;
        }
        
        .sidebar-header img {
            height: 40px;
        }
        
        .sidebar-brand {
            font-weight: 700;
            color: white;
            text-decoration: none;
            font-size: 18px;
            display: block;
            margin-top: 10px;
        }
        
        .nav-link {
            color: rgba(255,255,255,0.8);
            padding: 12px 20px;
            margin: 2px 0;
            border-radius: 4px;
            transition: all 0.3s;
        }
        
        .nav-link:hover, .nav-link.active {
            background-color: #444;
            color: white;
        }
        
        .nav-link i {
            margin-right: 10px;
        }
        
        .content {
            margin-left: 250px;
            padding: 30px;
        }
        
        .page-title {
            font-weight: 600;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 1px solid #dee2e6;
        }
        
        .card {
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);
            margin-bottom: 20px;
        }
        
        .card-header {
            background-color: white;
            border-bottom: 1px solid #eee;
            font-weight: 600;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .stat-card {
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
        }
        
        .stat-card i {
            font-size: 32px;
            margin-bottom: 15px;
        }
        
        .stat-card .stat-value {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 5px;
        }
        
        .stat-card .stat-label {
            font-size: 14px;
            color: #6c757d;
        }
        
        .bg-purple {
            background-color: #5e42a6;
            color: white;
        }
        
        .user-info {
            padding: 15px 20px;
            margin-top: auto;
            background-color: #444;
        }
        
        .user-name {
            font-weight: 600;
            font-size: 16px;
        }
        
        .user-role {
            font-size: 12px;
            opacity: 0.7;
        }
        
        .sidebar-nav {
            padding: 20px 0;
            flex-grow: 1;
        }
        
        .sidebar-container {
            display: flex;
            flex-direction: column;
            height: 100%;
        }
        
        .logout-btn {
            display: block;
            text-align: center;
            padding: 10px;
            background-color: #dc3545;
            color: white;
            text-decoration: none;
            margin: 10px 20px;
            border-radius: 5px;
        }
        
        .logout-btn:hover {
            background-color: #c82333;
            color: white;
        }
        
        .tab-content {
            padding-top: 20px;
        }
        
        .action-buttons .btn {
            margin-right: 5px;
        }
        
        .modal-header {
            background-color: #5e42a6;
            color: white;
        }
        
        .badge-waiting {
            background-color: #ffc107;
        }
        
        .badge-approved {
            background-color: #28a745;
        }
        
        .badge-rejected {
            background-color: #dc3545;
        }
        
        .nav-tabs .nav-link.active {
            font-weight: 600;
            color: #5e42a6;
            border-bottom: 2px solid #5e42a6;
        }
        
        .nav-tabs .nav-link {
            color: #495057;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="sidebar-container">
                <div class="sidebar-header">
                    <img src="https://www.akgroup.fr/wp-content/uploads/2023/06/AKGroup-logo.png" alt="Interior Design"/>
                    <a href="#" class="sidebar-brand">INTERIOR DESIGNER</a>
                </div>
                
                <div class="sidebar-nav">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link active" href="#">
                                <i class="bi bi-speedometer2"></i> Dashboard
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" id="approvalLink">
                                <i class="bi bi-check2-square"></i> Approvals
                                <span class="badge bg-danger rounded-pill">8</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <i class="bi bi-images"></i> Projects
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <i class="bi bi-people"></i> Clients
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <i class="bi bi-bag"></i> Services
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <i class="bi bi-chat-left-text"></i> Messages
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <i class="bi bi-calendar2-event"></i> Appointments
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <i class="bi bi-gear"></i> Settings
                            </a>
                        </li>
                        <li class="nav-item">
            <a class="nav-link" href="CrystalReport1.aspx">
                <i class="bi bi-file-earmark-text"></i> Crystal Report 1
            </a>
        </li>
    </ul>
                </div>
                
                <div class="user-info">
                    <div class="user-name"><asp:Literal ID="litAdminName" runat="server"></asp:Literal></div>
                    <div class="user-role">Administrator</div>
                </div>
                
                <asp:LinkButton ID="btnLogout" runat="server" CssClass="logout-btn" OnClick="btnLogout_Click">
                    <i class="bi bi-box-arrow-right"></i> Logout
                </asp:LinkButton>
            </div>
        </div>
        
        <!-- Main Content -->
        <div class="content">
            <div id="dashboard-section">
                <h1 class="page-title">Admin Dashboard</h1>
                
                <!-- Dashboard Statistics -->
                <div class="row">
                    <div class="col-md-3">
                        <div class="stat-card bg-purple">
                            <i class="bi bi-briefcase"></i>
                            <div class="stat-value"><asp:Literal ID="litTotalProjects" runat="server">42</asp:Literal></div>
                            <div class="stat-label">Total Projects</div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stat-card bg-info">
                            <i class="bi bi-people"></i>
                            <div class="stat-value"><asp:Literal ID="litTotalClients" runat="server">87</asp:Literal></div>
                            <div class="stat-label">Total Clients</div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stat-card bg-success">
                            <i class="bi bi-calendar-check"></i>
                            <div class="stat-value"><asp:Literal ID="litAppointments" runat="server">12</asp:Literal></div>
                            <div class="stat-label">Upcoming Appointments</div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stat-card bg-warning">
                            <i class="bi bi-envelope"></i>
                            <div class="stat-value"><asp:Literal ID="litMessages" runat="server">24</asp:Literal></div>
                            <div class="stat-label">New Messages</div>
                        </div>
                    </div>
                </div>
                
                <!-- Items Pending Approval -->
                <div class="row mt-4">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                Items Pending Approval
                                <a href="#" id="viewAllLink" class="btn btn-sm btn-outline-primary">View All</a>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>Type</th>
                                                <th>Name/ID</th>
                                                <th>Date</th>
                                                <th>Status</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td><span class="badge bg-primary">Project</span></td>
                                                <td>Modern Apartment Redesign</td>
                                                <td>02/20/2025</td>
                                                <td><span class="badge bg-warning">Pending</span></td>
                                                <td>
                                                    <div class="action-buttons">
                                                        <button type="button" class="btn btn-sm btn-success">Approve</button>
                                                        <button type="button" class="btn btn-sm btn-danger">Reject</button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><span class="badge bg-info">Consultation</span></td>
                                                <td>Emma Wilson</td>
                                                <td>02/22/2025</td>
                                                <td><span class="badge bg-warning">Pending</span></td>
                                                <td>
                                                    <div class="action-buttons">
                                                        <button type="button" class="btn btn-sm btn-success">Approve</button>
                                                        <button type="button" class="btn btn-sm btn-danger">Reject</button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><span class="badge bg-secondary">Booking</span></td>
                                                <td>Color Consultation</td>
                                                <td>02/24/2025</td>
                                                <td><span class="badge bg-warning">Pending</span></td>
                                                <td>
                                                    <div class="action-buttons">
                                                        <button type="button" class="btn btn-sm btn-success">Approve</button>
                                                        <button type="button" class="btn btn-sm btn-danger">Reject</button>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Recent Activities -->
                <div class="row mt-4">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                Recent Projects
                            </div>
                            <div class="card-body">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Project Name</th>
                                            <th>Client</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Modern Apartment Redesign</td>
                                            <td>John Smith</td>
                                            <td><span class="badge bg-success">Completed</span></td>
                                        </tr>
                                        <tr>
                                            <td>Villa Renovation</td>
                                            <td>Sarah Johnson</td>
                                            <td><span class="badge bg-primary">In Progress</span></td>
                                        </tr>
                                        <tr>
                                            <td>Office Space Design</td>
                                            <td>Tech Solutions Inc</td>
                                            <td><span class="badge bg-warning">Planning</span></td>
                                        </tr>
                                        <tr>
                                            <td>Café Interior</td>
                                            <td>Beans & Brews</td>
                                            <td><span class="badge bg-primary">In Progress</span></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                Recent Messages
                            </div>
                            <div class="card-body">
                                <div class="list-group">
                                    <a href="#" class="list-group-item list-group-item-action">
                                        <div class="d-flex w-100 justify-content-between">
                                            <h6 class="mb-1">Project Inquiry</h6>
                                            <small>3 days ago</small>
                                        </div>
                                        <p class="mb-1">I'm interested in redesigning my living room...</p>
                                        <small>From: Jane Cooper</small>
                                    </a>
                                    <a href="#" class="list-group-item list-group-item-action">
                                        <div class="d-flex w-100 justify-content-between">
                                            <h6 class="mb-1">Consultation Request</h6>
                                            <small>5 days ago</small>
                                        </div>
                                        <p class="mb-1">We're looking to renovate our office space...</p>
                                        <small>From: Acme Corporation</small>
                                    </a>
                                    <a href="#" class="list-group-item list-group-item-action">
                                        <div class="d-flex w-100 justify-content-between">
                                            <h6 class="mb-1">Feedback on Design</h6>
                                            <small>1 week ago</small>
                                        </div>
                                        <p class="mb-1">Thank you for the designs. I really like the concept...</p>
                                        <small>From: Michael Brown</small>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Approvals Section -->
            <div id="approvals-section" style="display: none;">
                <h1 class="page-title">Approvals Management</h1>
                
                <ul class="nav nav-tabs" id="approvalTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="projects-tab" data-bs-toggle="tab" data-bs-target="#projects" type="button" role="tab" aria-controls="projects" aria-selected="true">
                            Projects <span class="badge bg-danger rounded-pill">3</span>
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="consultations-tab" data-bs-toggle="tab" data-bs-target="#consultations" type="button" role="tab" aria-controls="consultations" aria-selected="false">
                            Consultation Requests <span class="badge bg-danger rounded-pill">4</span>
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="bookings-tab" data-bs-toggle="tab" data-bs-target="#bookings" type="button" role="tab" aria-controls="bookings" aria-selected="false">
                            Bookings <span class="badge bg-danger rounded-pill">1</span>
                        </button>
                    </li>
                </ul>
                
                <div class="tab-content" id="approvalTabsContent">
                    <!-- Projects Tab -->
                    <div class="tab-pane fade show active" id="projects" role="tabpanel" aria-labelledby="projects-tab">
                        <div class="card">
                            <div class="card-header">
                                Projects Pending Approval
                                <div>
                                    <button type="button" class="btn btn-sm btn-success">Approve All</button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary">View Archive</button>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <asp:GridView ID="gvProjects" runat="server" AutoGenerateColumns="false" CssClass="table table-hover"
                                        DataKeyNames="id" OnRowCommand="gvProjects_RowCommand">
                                        <Columns>
                                            <asp:BoundField DataField="id" HeaderText="ID" />
                                            <asp:BoundField DataField="project_name" HeaderText="Project Name" />
                                            <asp:BoundField DataField="project_design" HeaderText="Design Type" />
                                            <asp:BoundField DataField="start_date" HeaderText="Start Date" DataFormatString="{0:MM/dd/yyyy}" />
                                            <asp:BoundField DataField="end_date" HeaderText="End Date" DataFormatString="{0:MM/dd/yyyy}" />
                                            <asp:TemplateField HeaderText="Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblStatus" runat="server" CssClass='<%# GetStatusBadgeClass(Eval("status").ToString()) %>' 
                                                        Text='<%# Eval("status") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Actions">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="btnApprove" runat="server" CommandName="ApproveProject" CommandArgument='<%# Eval("id") %>'
                                                        CssClass="btn btn-sm btn-success" Visible='<%# NeedsApproval(Eval("status").ToString()) %>'>
                                                        <i class="bi bi-check-lg"></i> Approve
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="btnReject" runat="server" CommandName="RejectProject" CommandArgument='<%# Eval("id") %>'
                                                        CssClass="btn btn-sm btn-danger" Visible='<%# NeedsApproval(Eval("status").ToString()) %>'>
                                                        <i class="bi bi-x-lg"></i> Reject
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="btnView" runat="server" CommandName="ViewProject" CommandArgument='<%# Eval("id") %>'
                                                        CssClass="btn btn-sm btn-primary">
                                                        <i class="bi bi-eye"></i> View
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <a href="CrystalReport2.aspx" class="admin-login-link">
                                     Crystal Report2
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Consultation Requests Tab -->
                    <div class="tab-pane fade" id="consultations" role="tabpanel" aria-labelledby="consultations-tab">
                        <div class="card">
                            <div class="card-header">
                                Consultation Requests
                                <div>
                                    <button type="button" class="btn btn-sm btn-success">Mark All as Contacted</button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary">View Archive</button>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <asp:GridView ID="gvConsultationRequests" runat="server" AutoGenerateColumns="false" CssClass="table table-hover"
                                        DataKeyNames="RequestID" OnRowCommand="gvConsultationRequests_RowCommand">
                                        <Columns>
                                            <asp:BoundField DataField="RequestID" HeaderText="ID" />
                                            <asp:BoundField DataField="Name" HeaderText="Name" />
                                            <asp:BoundField DataField="Email" HeaderText="Email" />
                                            <asp:BoundField DataField="Phone" HeaderText="Phone" />
                                            <asp:BoundField DataField="Service" HeaderText="Service" />
                                            <asp:BoundField DataField="RequestDate" HeaderText="Date" DataFormatString="{0:MM/dd/yyyy}" />
                                            <asp:TemplateField HeaderText="Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblContactStatus" runat="server" CssClass='<%# GetContactStatusBadgeClass(Eval("Contacted").ToString()) %>' 
                                                        Text='<%# Convert.ToBoolean(Eval("Contacted")) ? "Contacted" : "Pending" %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Actions">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="btnMarkContacted" runat="server" CommandName="MarkContacted" CommandArgument='<%# Eval("RequestID") %>'
                                                        CssClass="btn btn-sm btn-success" Visible='<%# !Convert.ToBoolean(Eval("Contacted")) %>'>
                                                        <i class="bi bi-check-lg"></i> Mark Contacted
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="btnViewDetails" runat="server" CommandName="ViewDetails" CommandArgument='<%# Eval("RequestID") %>'
                                                        CssClass="btn btn-sm btn-info" data-bs-toggle="modal" data-bs-target="#consultationModal">
                                                        <i class="bi bi-info-circle"></i> Details
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Bookings Tab -->
                    <div class="tab-pane fade" id="bookings" role="tabpanel" aria-labelledby="bookings-tab">
                        <div class="card">
                            <div class="card-header">
                                Service Bookings
                                <div>
                                    <button type="button" class="btn btn-sm btn-success">Approve All</button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary">View Archive</button>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <asp:GridView ID="gvBookings" runat="server" AutoGenerateColumns="false" CssClass="table table-hover"
                                        DataKeyNames="id" OnRowCommand="gvBookings_RowCommand">
                                        <Columns>
                                            <asp:BoundField DataField="id" HeaderText="ID" />
                                            <asp:BoundField DataField="booking_id" HeaderText="Booking ID" />
                                            <asp:BoundField DataField="service_name" HeaderText="Service" />
                                            <asp:BoundField DataField="booking_date" HeaderText="Date" DataFormatString="{0:MM/dd/yyyy hh:mm tt}" />
                                            <asp:TemplateField HeaderText="Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblBookingStatus" runat="server" CssClass='<%# GetBookingStatusBadgeClass(Eval("status").ToString()) %>' 
                                                        Text='<%# Eval("status") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Actions">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="btnApproveBooking" runat="server" CommandName="ApproveBooking" CommandArgument='<%# Eval("id") %>'
                                                        CssClass="btn btn-sm btn-success" Visible='<%# NeedsApproval(Eval("status").ToString()) %>'>
                                                        <i class="bi bi-check-lg"></i> Approve
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="btnRejectBooking" runat="server" CommandName="RejectBooking" CommandArgument='<%# Eval("id") %>'
                                                        CssClass="btn btn-sm btn-danger" Visible='<%# NeedsApproval(Eval("status").ToString()) %>'>
                                                        <i class="bi bi-x-lg"></i> Reject
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="btnViewBooking" runat="server" CommandName="ViewBooking" CommandArgument='<%# Eval("id") %>'
                                                        CssClass="btn btn-sm btn-primary">
                                                        <i class="bi bi-eye"></i> View
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Consultation Details Modal -->
        <div class="modal fade" id="consultationModal" tabindex="-1" aria-labelledby="consultationModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="consultationModalLabel">Consultation Request Details</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:HiddenField ID="hdnRequestID" runat="server" />
                                
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="form-label">Name</label>
                                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="form-label">Email</label>
                                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="form-label">Phone</label>
                                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="form-label">Service</label>
                                            <asp:TextBox ID="txtService" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <!-- Continuation of the Consultation Modal -->
<div class="row mb-3">
    <div class="col-12">
        <div class="form-group">
            <label class="form-label">Message from Client</label>
            <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" ReadOnly="true"></asp:TextBox>
        </div>
    </div>
</div>

<hr />

<div class="row mb-3">
    <div class="col-md-6">
        <div class="form-group">
            <label class="form-label">Status</label>
            <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-select">
                <asp:ListItem Text="Pending" Value="Pending" />
                <asp:ListItem Text="Contacted" Value="Contacted" />
                <asp:ListItem Text="Appointment Scheduled" Value="Appointment Scheduled" />
                <asp:ListItem Text="Completed" Value="Completed" />
                <asp:ListItem Text="Canceled" Value="Canceled" />
            </asp:DropDownList>
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <label class="form-label">Contact Notes</label>
            <asp:TextBox ID="txtNotes" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
        </div>
    </div>
</div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <asp:Button ID="btnUpdateConsultation" runat="server" Text="Update & Mark as Contacted" 
                            CssClass="btn btn-primary" OnClick="btnUpdateConsultation_Click" />
                    </div>
                </div>
            </div>
        </div>

        <!-- JavaScript for Tab Navigation -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                // Dashboard and Approvals section toggle
                const approvalLink = document.getElementById('approvalLink');
                const viewAllLink = document.getElementById('viewAllLink');
                const dashboardSection = document.getElementById('dashboard-section');
                const approvalsSection = document.getElementById('approvals-section');
                
                approvalLink.addEventListener('click', function(e) {
                    e.preventDefault();
                    dashboardSection.style.display = 'none';
                    approvalsSection.style.display = 'block';
                });
                
                viewAllLink.addEventListener('click', function(e) {
                    e.preventDefault();
                    dashboardSection.style.display = 'none';
                    approvalsSection.style.display = 'block';
                });
                
                // Back to dashboard functionality
                const dashboardItems = document.querySelectorAll('.nav-link');
                dashboardItems.forEach(item => {
                    if (item.textContent.trim().includes('Dashboard')) {
                        item.addEventListener('click', function(e) {
                            e.preventDefault();
                            dashboardSection.style.display = 'block';
                            approvalsSection.style.display = 'none';
                        });
                    }
                });
            });
        </script>
    </form>
</body>
</html>