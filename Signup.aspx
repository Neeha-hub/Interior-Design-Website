<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="InteriorDesign.Signup" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up</title>
    <style type="text/css">
        body {
            background-color: #E6E6FA;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        .signup-container {
            background-color: white;
            padding: 40px;
            border-radius: 8px;
            width: 400px;
            box-shadow: 0 0 10px rgba(147, 112, 219, 0.2);
        }

        .signup-title {
            text-align: center;
            color: #663399;
            font-size: 28px;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #B19CD9;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 14px;
        }

        .form-control:focus {
            outline: none;
            border-color: #9370DB;
            box-shadow: 0 0 5px rgba(147, 112, 219, 0.3);
        }

        .btn-signup {
            background-color: #9370DB;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 4px;
            width: 100%;
            cursor: pointer;
            font-size: 16px;
        }

        .btn-signup:hover {
            background-color: #663399;
        }

        .show-password {
            margin-top: 5px;
            color: #663399;
        }

        .links {
            text-align: center;
            margin-top: 20px;
        }

        .links a {
            color: #9370DB;
            text-decoration: none;
        }

        .links a:hover {
            color: #663399;
        }
        
        .error-message {
            color: #663399;
            font-size: 12px;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="signup-container">
            <h2 class="signup-title">Sign Up</h2>
            
            <div class="form-group">
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Full Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvName" runat="server" 
                    ControlToValidate="txtName" ErrorMessage="Name is required" 
                    Display="Dynamic" CssClass="error-message">
                </asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email" TextMode="Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="Email is required" 
                    Display="Dynamic" CssClass="error-message">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="Invalid email format" 
                    Display="Dynamic" CssClass="error-message"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                </asp:RegularExpressionValidator>
            </div>

            <div class="form-group">
                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Phone Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPhone" runat="server" 
                    ControlToValidate="txtPhone" ErrorMessage="Phone number is required" 
                    Display="Dynamic" CssClass="error-message">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revPhone" runat="server" 
                    ControlToValidate="txtPhone" ErrorMessage="Invalid phone number" 
                    Display="Dynamic" CssClass="error-message"
                    ValidationExpression="^\d{10}$">
                </asp:RegularExpressionValidator>
            </div>

            <div class="form-group">
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Address" TextMode="MultiLine" Rows="3"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                    ControlToValidate="txtPassword" ErrorMessage="Password is required" 
                    Display="Dynamic" CssClass="error-message">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revPasswordStrength" runat="server"
                    ControlToValidate="txtPassword" 
                    ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$"
                    ErrorMessage="Password must be at least 8 characters long, contain letters, numbers, and special characters"
                    Display="Dynamic" CssClass="error-message">
                </asp:RegularExpressionValidator>
            </div>

            <div class="show-password">
                <asp:CheckBox ID="chkShowPassword" runat="server" Text="Show Password" onclick="togglePassword();" />
            </div>

            <div class="form-group">
                <asp:Button ID="btnSignUp" runat="server" Text="SIGN UP" CssClass="btn-signup" OnClick="btnSignUp_Click" />
            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="error-message"></asp:Label>
            
            <div class="links">
                <a href="Loginpage.aspx">Already have an account? Login here</a>
            </div>
        </div>
    </form>

    <script type="text/javascript">
        function togglePassword() {
            var passwordField = document.getElementById('<%= txtPassword.ClientID %>');
            var checkBox = document.getElementById('<%= chkShowPassword.ClientID %>');

            if (checkBox.checked) {
                passwordField.type = 'text';
            } else {
                passwordField.type = 'password';
            }
        }
    </script>
</body>
</html>