<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="InteriorDesign.AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login - Interior Designer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
        }
        
        .login-container {
            max-width: 450px;
            margin: 100px auto;
            padding: 40px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }
        
        .logo-container {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .logo-container img {
            height: 60px;
        }
        
        .brand-text {
            display: block;
            font-weight: 700;
            font-size: 22px;
            color: #333;
            margin-top: 10px;
        }
        
        .login-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .login-header h2 {
            font-weight: 600;
            color: #333;
        }
        
        .login-form .form-control {
            height: 50px;
            border-radius: 8px;
            padding-left: 20px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
        }
        
        .login-form .form-control:focus {
            box-shadow: none;
            border-color: #5e42a6;
        }
        
        .login-btn {
            height: 50px;
            font-size: 16px;
            font-weight: 500;
            background-color: #5e42a6;
            border: none;
            border-radius: 8px;
            width: 100%;
            transition: all 0.3s ease;
        }
        
        .login-btn:hover {
            background-color: #4e3590;
            transform: translateY(-2px);
        }
        
        .back-link {
            display: block;
            text-align: center;
            margin-top: 25px;
            color: #666;
            text-decoration: none;
        }
        
        .back-link:hover {
            color: #5e42a6;
        }
        
        .form-check {
            margin-bottom: 20px;
        }
        
        .form-check-input:checked {
            background-color: #5e42a6;
            border-color: #5e42a6;
        }
        
        .input-group-text {
            background-color: transparent;
            border-left: none;
            cursor: pointer;
        }
        
        .error-message {
            color: #dc3545;
            margin-bottom: 15px;
            font-size: 14px;
            font-weight: 500;
            padding: 10px;
            background-color: rgba(220, 53, 69, 0.1);
            border-radius: 5px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="adminLoginForm" runat="server">
        <div class="container">
            <div class="login-container">
                <div class="logo-container">
                    <img src="https://www.akgroup.fr/wp-content/uploads/2023/06/AKGroup-logo.png" alt="Interior Design"/>
                    <span class="brand-text">INTERIOR DESIGNER</span>
                </div>
                
                <div class="login-header">
                    <h2>Admin Login</h2>
                    <p class="text-muted">Please login to access the admin dashboard</p>
                </div>
                
                <div class="login-form">
                    <asp:Label ID="lblError" runat="server" CssClass="error-message" Visible="false"></asp:Label>
                    
                    <div class="mb-3">
                        <label for="txtUsername" class="form-label">Username</label>
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter your username"></asp:TextBox>
                    </div>
                    
                    <div class="mb-3">
                        <label for="txtPassword" class="form-label">Password</label>
                        <div class="input-group">
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter your password"></asp:TextBox>
                            <span class="input-group-text" id="togglePassword">
                                <i class="bi bi-eye-slash"></i>
                            </span>
                        </div>
                    </div>
                    
                    <div class="form-check">
                        <asp:CheckBox ID="chkRememberMe" runat="server" CssClass="form-check-input" />
                        <label class="form-check-label" for="<%= chkRememberMe.ClientID %>">
                            Remember me
                        </label>
                    </div>
                    
                    <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn login-btn" OnClick="btnLogin_Click" />
                    
                    <div class="text-center mt-3">
                        <a href="#" class="text-decoration-none">Forgot password?</a>
                    </div>
                </div>
                
                <a href="WebForm1.aspx" class="back-link">
                    <i class="bi bi-arrow-left"></i> Back to Homepage
                </a>
            </div>
        </div>
    </form>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css"/>
    <script>
        // Toggle password visibility
        document.getElementById('togglePassword').addEventListener('click', function() {
            const passwordInput = document.getElementById('<%= txtPassword.ClientID %>');
            const icon = this.querySelector('i');

            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                icon.classList.remove('bi-eye-slash');
                icon.classList.add('bi-eye');
            } else {
                passwordInput.type = 'password';
                icon.classList.remove('bi-eye');
                icon.classList.add('bi-eye-slash');
            }
        });
    </script>
</body>
</html>