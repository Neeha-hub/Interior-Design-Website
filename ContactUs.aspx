<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="InteriorDesign.ContactUs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact Us - AK GROUP Interior Designs</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-image: url('data:image/jpeg;base64,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');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: #333;
        }
        
        .overlay {
            background-color: rgba(255, 255, 255, 0.85);
            min-height: 100vh;
            padding: 20px;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px;
        }
        
        .header {
            text-align: center;
            margin-bottom: 50px;
        }
        
        h1 {
            color: #4a4a4a;
            font-size: 2.5em;
            margin-bottom: 10px;
        }
        
        .contact-wrapper {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }
        
        .contact-form {
            flex: 1;
            min-width: 300px;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            margin-right: 30px;
            margin-bottom: 30px;
        }
        
        .map-section {
            flex: 1;
            min-width: 300px;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
        }
        
        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1em;
        }
        
        .btn-submit {
            background-color: #4a8db7;
            color: white;
            border: none;
            padding: 12px 24px;
            font-size: 1em;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        
        .btn-submit:hover {
            background-color: #3a7ca5;
        }
        
        .validation-message {
            color: #d9534f;
            font-size: 0.9em;
            margin-top: 5px;
        }
        
        .success-message {
            background-color: #dff0d8;
            color: #3c763d;
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 20px;
            display: none;
        }
        
        .contact-info {
            margin-top: 30px;
        }
        
        .contact-info h3 {
            margin-bottom: 15px;
            color: #4a4a4a;
        }
        
        .contact-info p {
            margin-bottom: 10px;
            line-height: 1.6;
        }
        
        .map-container {
            height: 350px;
            margin-top: 20px;
            border-radius: 4px;
            overflow: hidden;
        }
        
        @media (max-width: 768px) {
            .contact-form {
                margin-right: 0;
            }
            
            .contact-wrapper {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <div class="overlay">
        <div class="container">
            <div class="header">
                <h1>Contact Us</h1>
                <p>We'd love to hear from you! Please fill out the form below.</p>
            </div>
            
            <div class="contact-wrapper">
                <div class="contact-form">
                    <form id="contactForm" runat="server">
                        <asp:Panel ID="SuccessPanel" runat="server" CssClass="success-message" Visible="false">
                            Your message has been sent successfully! We'll get back to you soon.
                        </asp:Panel>
                        
                        <div class="form-group">
                            <label for="txtName">Full Name</label>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter your full name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
                                ErrorMessage="Name is required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        
                        <div class="form-group">
                            <label for="txtEmail">Email Address</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter your email address"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                                ErrorMessage="Email is required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                                ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
                                ErrorMessage="Please enter a valid email address" CssClass="validation-message" Display="Dynamic"></asp:RegularExpressionValidator>
                        </div>
                        
                        <div class="form-group">
                            <label for="txtPhone">Phone Number</label>
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Enter your phone number"></asp:TextBox>
                        </div>
                        
                        <div class="form-group">
                            <label for="ddlSubject">Subject</label>
                            <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control">
                                <asp:ListItem Text="-- Select a subject --" Value=""></asp:ListItem>
                                <asp:ListItem Text="General Inquiry" Value="General Inquiry"></asp:ListItem>
                                <asp:ListItem Text="Design Consultation" Value="Design Consultation"></asp:ListItem>
                                <asp:ListItem Text="Project Quote" Value="Project Quote"></asp:ListItem>
                                <asp:ListItem Text="Feedback" Value="Feedback"></asp:ListItem>
                                <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvSubject" runat="server" ControlToValidate="ddlSubject"
                                ErrorMessage="Please select a subject" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        
                        <div class="form-group">
                            <label for="txtMessage">Message</label>
                            <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" placeholder="Type your message here..."></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvMessage" runat="server" ControlToValidate="txtMessage"
                                ErrorMessage="Message is required" CssClass="validation-message" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        
                        <asp:Button ID="btnSubmit" runat="server" Text="Send Message" CssClass="btn-submit" OnClick="btnSubmit_Click" />
                    </form>
                </div>
                
                <div class="map-section">
                    <h2>Visit Our Studio</h2>
                    <div class="contact-info">
                        <h3>Studio Address</h3>
                        <p>698f, ITI Layout, Hosapalya, HSR Layout<br />
                           Bangalore<br />
                           Karnataka - 560068</p>
                        
                        <h3>Contact Information</h3>
                        <p>Email: akgroup.interiors@gmail.com<br />
                           Phone: 9880731765<br />
                           Hours: Monday - Friday, 9am - 6pm</p>
                    </div>
                    
                    <!-- Google Maps integration -->
                    <div class="map-container">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3888.783853013898!2d77.63233531482171!3d12.91550809088787!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bae14e813b0989f%3A0x2482e9ec0b00a13c!2s698f%2C%20ITI%20Layout%2C%20Hosapalaya%2C%20HSR%20Layout%2C%20Bengaluru%2C%20Karnataka%20560068!5e0!3m2!1sen!2sin!4v1676904035583!5m2!1sen!2sin" 
                                width="100%" height="100%" frameborder="0" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script type="text/javascript">
        // Optional JavaScript for enhancing the form experience
        document.addEventListener('DOMContentLoaded', function() {
            // Fade in success message if visible
            var successPanel = document.querySelector('.success-message');
            if (successPanel && successPanel.style.display !== 'none') {
                successPanel.style.display = 'block';
                setTimeout(function() {
                    successPanel.style.opacity = '1';
                }, 100);
            }
        });
    </script>
</body>
</html>