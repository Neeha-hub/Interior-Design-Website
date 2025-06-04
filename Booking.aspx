<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="InteriorDesign.Booking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Book Interior Design Service</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <style>
        body {
            background: linear-gradient(135deg, #f6f9fc 0%, #edf2f7 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .booking-card {
            border: none;
            border-radius: 20px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.08);
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            overflow: hidden;
        }

        .booking-header {
            background: linear-gradient(135deg, #663399 0%, #4B0082 100%); /* Changed to purple */
            color: white;
            padding: 1.5rem;
            position: relative;
        }

        /* Modified header after element to ensure it doesn't overlap content */
        .booking-header::after {
            content: '';
            position: absolute;
            bottom: -5px; /* Reduced overlap */
            left: 0;
            right: 0;
            height: 20px; /* Shorter wave */
            background: inherit;
            transform: skewY(-1.5deg); /* Less steep angle */
            transform-origin: 100%;
            z-index: 0;
        }

        .booking-header h2 {
            font-weight: 300;
            margin: 0;
            font-size: 24px;
            position: relative;
            z-index: 1;
        }

        .form-section {
            background-color: #ffffff;
            border-radius: 15px;
            padding: 25px;
            margin-bottom: 20px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.03);
            position: relative; /* Added for proper z-index stacking */
            z-index: 1; /* Ensure content appears above the header wave */
        }

        .form-control {
            border-radius: 10px;
            border: 2px solid #e2e8f0;
            padding: 12px;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: #663399; /* Changed to purple */
            box-shadow: 0 0 0 3px rgba(102, 51, 153, 0.1); /* Changed to purple */
        }

        .form-label {
            font-weight: 500;
            color: #2d3748;
            margin-bottom: 8px;
        }

        .btn-book {
            background: linear-gradient(135deg, #663399 0%, #4B0082 100%); /* Changed to purple */
            color: white;
            border: none;
            padding: 12px 35px;
            border-radius: 10px;
            font-weight: 500;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
        }

        .btn-book:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(102, 51, 153, 0.2); /* Changed to purple */
            color: white;
        }

        .service-option {
            border: 2px solid #e2e8f0;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 10px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .service-option:hover {
            border-color: #663399; /* Changed to purple */
            background-color: #f8fafc;
        }

        .service-option.selected {
            border-color: #663399; /* Changed to purple */
            background-color: #f8fafc;
        }

        .booking-id {
            background: #f8fafc;
            border-radius: 8px;
            padding: 10px;
            font-family: monospace;
            letter-spacing: 1px;
        }

        .status-pending {
            background: #fff3dc;
            color: #946c00;
            padding: 8px 15px;
            border-radius: 20px;
            font-size: 14px;
            display: inline-block;
        }

        .decorative-element {
            position: absolute;
            border-radius: 50%;
            opacity: 0.1;
            z-index: 0;
        }

        .element-1 {
            width: 200px;
            height: 200px;
            top: -100px;
            right: -50px;
            background: linear-gradient(45deg, #663399, #9370DB); /* Changed to purple */
        }

        .element-2 {
            width: 150px;
            height: 150px;
            bottom: -50px;
            left: -50px;
            background: linear-gradient(45deg, #4B0082, #663399); /* Changed to purple */
        }

        /* Added padding to card body to ensure content is below the wave */
        .card-body {
            padding-top: 30px !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container py-5">
            <div class="booking-card position-relative">
                <div class="decorative-element element-1"></div>
                <div class="decorative-element element-2"></div>
                
                <div class="booking-header">
                    <h2><i class="fas fa-calendar-check me-3"></i>Book Your Interior Design Service</h2>
                </div>
                
                <div class="card-body p-4">
                    <div class="form-section">
                        <div class="row mb-4">
                            <div class="col-md-6">
                                <label class="form-label">
                                    <i class="fas fa-hashtag me-2"></i>Booking ID
                                </label>
                                <asp:TextBox ID="txtBookingId" runat="server" CssClass="form-control booking-id" 
                                    Enabled="false"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">
                                    <i class="fas fa-info-circle me-2"></i>Status
                                </label>
                                <div class="status-pending">
                                    <i class="fas fa-clock me-2"></i>Pending Approval
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-section">
                        <label class="form-label">
                            <i class="fas fa-concierge-bell me-2"></i>Select Service
                        </label>
                        <asp:RadioButtonList ID="rblServices" runat="server" CssClass="list-unstyled">
                            <asp:ListItem Text="Complete Home Interior Design" Value="complete_home" />
                            <asp:ListItem Text="Single Room Makeover" Value="single_room" />
                            <asp:ListItem Text="Color Consultation" Value="color_consultation" />
                            <asp:ListItem Text="Furniture Selection & Placement" Value="furniture" />
                            <asp:ListItem Text="Kitchen & Bath Design" Value="kitchen_bath" />
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="rfvService" runat="server" 
                            ControlToValidate="rblServices"
                            ErrorMessage="Please select a service" 
                            CssClass="text-danger d-block mt-2">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-section">
                        <div class="row">
                            <div class="col-md-6">
                                <label class="form-label">
                                    <i class="fas fa-calendar-alt me-2"></i>Preferred Date
                                </label>
                                <asp:TextBox ID="txtBookingDate" runat="server" TextMode="Date" 
                                    CssClass="form-control" required="required"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvDate" runat="server" 
                                    ControlToValidate="txtBookingDate"
                                    ErrorMessage="Please select a date" 
                                    CssClass="text-danger">
                                </asp:RequiredFieldValidator>
                                <asp:CustomValidator ID="cvDate" runat="server" 
                                    ControlToValidate="txtBookingDate"
                                    OnServerValidate="ValidateBookingDate" 
                                    ErrorMessage="Please select a future date"
                                    CssClass="text-danger">
                                </asp:CustomValidator>
                            </div>
                        </div>
                    </div>

                    <div class="text-center mt-4">
                        <asp:Button ID="btnBook" runat="server" Text="Book Consultation" 
                            CssClass="btn btn-book btn-lg" OnClick="btnBook_Click" />
                    </div>

                    <asp:Label ID="lblMessage" runat="server" CssClass="mt-4 d-block text-center"></asp:Label>
                </div>
            </div>
        </div>
    </form>
</body>
</html>