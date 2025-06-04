<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Loginpage.aspx.cs" Inherits="InteriorDesign.WebForm2" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
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

        .login-container {
            background-color: white;
            padding: 40px;
            border-radius: 8px;
            width: 400px;
            box-shadow: 0 0 10px rgba(147, 112, 219, 0.2);
        }

        .login-title {
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

        .btn-login {
            background-color: #9370DB;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 4px;
            width: 100%;
            cursor: pointer;
            font-size: 16px;
        }

        .btn-login:hover {
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
            color: #FF0000;
            font-size: 12px;
            margin-top: 5px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h2 class="login-title">Login</h2>

            <div class="form-group">
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                    ControlToValidate="txtEmail" ErrorMessage="Email is required"
                    Display="Dynamic" ForeColor="#FF0000">
                </asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Phone Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPhone" runat="server"
                    ControlToValidate="txtPhone" ErrorMessage="Phone number is required"
                    Display="Dynamic" ForeColor="#FF0000">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revPhone" runat="server"
                    ControlToValidate="txtPhone" ErrorMessage="Invalid phone number"
                    Display="Dynamic" ForeColor="#FF0000"
                    ValidationExpression="^\d{10}$">
                </asp:RegularExpressionValidator>
            </div>

            <div class="form-group">
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                    ControlToValidate="txtPassword" ErrorMessage="Password is required"
                    Display="Dynamic" ForeColor="#FF0000">
                </asp:RequiredFieldValidator>
            </div>

            <div class="show-password">
                <asp:CheckBox ID="chkShowPassword" runat="server" Text="Show Password" onclick="togglePassword();" />
            </div>

            <div class="form-group">
                <asp:Button ID="btnLogin" runat="server" Text="LOGIN" CssClass="btn-login" OnClick="btnLogin_Click" />
            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="error-message"></asp:Label>

            <div class="links">
                <a href="Signup.aspx">Don't have an account? Sign up here</a>
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