<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="InteriorDesign.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Luxury Interior Design Solutions</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
   <style>
       :root {
        --primary-color: #091c51;
        --accent-color: #6a4c93;
        --text-light: #ffffff;
    }

    /* Ensure proper font usage */
    body {
        font-family: 'Helvetica Neue', Arial, sans-serif;
        margin: 0;
        padding: 20px;
        background-color: #f9f9f9;
    }

    /* Navbar */
    .navbar {
        background-color: rgba(255, 255, 255, 0.95) !important;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        padding: 15px 0;
    }

    .navbar-brand {
        display: flex;
        align-items: center;
        gap: 15px;
    }

    .brand-text {
        font-size: 28px;
        font-weight: 600;
        color: var(--primary-color);
        letter-spacing: 1px;
    }

    .nav-link {
        color: var(--primary-color) !important;
        font-weight: 500;
        padding: 10px 20px !important;
        transition: color 0.3s ease;
    }

    .nav-link:hover {
        color: var(--accent-color) !important;
    }

    /* Login Button */
    .login-btn {
        background-color: var(--accent-color);
        color: var(--text-light) !important;
        border-radius: 25px;
        padding: 8px 20px !important;
        display: flex;
        align-items: center;
        gap: 8px;
        transition: transform 0.3s ease;
    }

    .login-btn:hover {
        background-color: var(--primary-color);
        transform: translateY(-2px);
    }

    .login-icon {
        font-size: 1.2rem;
    }
    .login-menu {
    display: flex;
    flex-direction: column;
    gap: 5px;
}

.admin-login-link {
    color: #0d47a1; /* Dark blue color */
    text-decoration: none;
    font-size: 0.9em;
}

.admin-login-link:hover {
    text-decoration: underline;
}
    /* Carousel */
    .carousel {
        margin-top: 80px;
    }

    .carousel-item {
        height: 600px;
    }

    .carousel-item img {
        object-fit: cover;
        height: 100%;
        width: 100%;
    }

    .carousel-caption {
        background: rgba(0, 0, 0, 0.5);
        padding: 20px;
        border-radius: 10px;
    }

    /* Section Titles */
    .section-title {
        font-size: 2.5rem;
        color: var(--primary-color);
        text-align: center;
        margin: 50px 0 30px;
        font-weight: 600;
    }

    /* Gallery */
    .gallery-container {
        padding: 40px 0;
    }

    .gallery-item {
        position: relative;
        overflow: hidden;
        border-radius: 10px;
        margin-bottom: 30px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease;
    }

    .gallery-item:hover {
        transform: translateY(-5px);
    }

    .gallery-item img {
        width: 100%;
        height: 300px;
        object-fit: cover;
    }

    .view-more-btn {
        background-color: var(--accent-color);
        color: var(--text-light);
        padding: 12px 30px;
        border-radius: 25px;
        text-decoration: none;
        font-weight: 500;
        letter-spacing: 1px;
        transition: all 0.3s ease;
        display: inline-block;
        margin: 40px auto;
    }

    .view-more-btn:hover {
        background-color: var(--primary-color);
        transform: translateY(-2px);
    }

    .container {
        max-width: 1200px;
        margin: 0 auto;
    }

    /* Header */
    .header {
        text-align: center;
        margin-bottom: 40px;
    }

    .header h1 {
        color: #333;
        margin-bottom: 10px;
    }

    .header h1 span {
        color: #b87d3b;
        font-style: italic;
    }

    .subheading {
        color: #666;
        font-size: 1.1em;
        margin-bottom: 50px;
        text-align: center;
    }

    /* Timeline */
    .timeline {
        display: flex;
        justify-content: space-between;
        position: relative;
        margin-top: 100px;
    }

    .timeline::after {
        content: '';
        position: absolute;
        width: 100%;
        height: 2px;
        background-color: #6b4764;
        top: 50%;
        left: 0;
        z-index: 1;
    }

    .timeline-item {
        display: flex;
        flex-direction: column;
        align-items: center;
        width: 200px;
        z-index: 2;
    }

    .timeline-image {
        width: 200px;
        height: 200px;
        border-radius: 10px;
        margin-bottom: 20px;
        overflow: hidden;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .timeline-image img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .timeline-point {
        width: 20px;
        height: 20px;
        background-color: #6b4764;
        border-radius: 50%;
        margin: 10px 0;
        border: 4px solid #fff;
    }

    .timeline-title {
        text-align: center;
        font-weight: bold;
        color: #333;
    }

    /* Button Container */
    .button-container {
        text-align: center;
        margin: 20px auto;
        padding: 10px;
    }
    .get-started-btn {
    background-color: #6a4c93; /* Purple color */
    color: white;
    padding: 12px 25px;
    font-size: 1.1rem;
    font-weight: bold;
    border-radius: 30px;
    text-decoration: none;
    transition: all 0.3s ease;
    display: inline-block;
}

.get-started-btn:hover {
    background-color: #4c2c72; /* Darker purple */
    transform: translateY(-2px);
}
.image-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 15px;
    justify-content: center;
    align-items: center;
}

.grid-item {
    border: 4px solid #5a3d76; /* Purple border */
    border-radius: 15px;
    box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.2);
    transition: transform 0.3s ease-in-out;
}

.grid-item:hover {
    transform: scale(1.05);
}

.large {
    width: 684px;
    height: 361px;
}

.medium {
    width: 220px;
    height: 180px;
}

.small {
    width: 150px;
    height: 140px;
}

@media (max-width: 768px) {
    .image-grid {
        grid-template-columns: repeat(2, 1fr);
    }
}


    /* Footer */
    .footer {
        background-color: #663399;
        color: white;
        padding: 40px 0;
        margin-top: 50px;
    }

    .footer-section h5 {
        font-weight: bold;
        margin-bottom: 20px;
        color: white;
    }

    .footer-section p,
    .footer-section ul {
        margin-bottom: 10px;
        line-height: 1.6;
    }

    .footer-section a {
        color: #ffffff;
        text-decoration: none;
        transition: color 0.3s ease;
    }

    .footer-section a:hover {
        color: #ddd;
        text-decoration: underline;
    }

    .social-icons {
        display: flex;
        gap: 15px;
    }

    .social-icon {
        font-size: 20px;
        color: white;
        transition: transform 0.3s ease, color 0.3s ease;
    }

    .social-icon:hover {
        transform: scale(1.2);
        color: #ffd700;
    }

    .copyright {
        font-size: 14px;
        margin-top: 15px;
        color: #ddd;
        text-align: center;
    }

    /* Responsive Styles */
    @media (max-width: 1200px) {
        .timeline {
            flex-direction: column;
            align-items: center;
            gap: 40px;
        }

        .timeline::after {
            width: 2px;
            height: 100%;
            top: 0;
            left: 50%;
        }

        .timeline-item {
            width: 80%;
            max-width: 300px;
        }
    }

    @media (max-width: 768px) {
        .col-md-4 {
            flex: 0 0 100%;
            max-width: 100%;
            margin-bottom: 30px;
        }

        .footer {
            padding: 30px 0;
            text-align: center;
        }

        .social-icons {
            justify-content: center;
        }
    }

</style>

</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg fixed-top">
    <div class="container">
        <a class="navbar-brand" href="#">
            <img src="https://www.akgroup.fr/wp-content/uploads/2023/06/AKGroup-logo.png" alt="Interior Design" style="height: 50px;"/>
            <span class="brand-text">INTERIOR DESIGNER</span>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="WebForm1.aspx">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="About.aspx">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Services.aspx">Services</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Projects.aspx">Projects</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ContactUs.aspx">Contact</a>
                </li>
            </ul>
            <div class="d-flex align-items-center">
                <a href="Loginpage.aspx" class="btn btn-primary login-btn rounded-pill me-3">
                    Login / Sign Up
                </a>
                <a href="AdminLogin.aspx" class="admin-login-link">
                    Admin Login
                </a>
            </div>
        </div>
    </div>
</nav>

        <!-- Carousel -->
        <div id="mainCarousel" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="0" class="active"></button>
                <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="1"></button>
                <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="2"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="https://chiedesign.in/wp-content/uploads/2022/05/Luxury-Interior-Design-Living-Room-1080x675.jpg" alt="Luxury Living Room"/>
                    <div class="carousel-caption">
                        <h2>Luxury Living Spaces</h2>
                        <p>Transform your home into a masterpiece of design</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="https://artfasad.com/wp-content/uploads/2023/12/modern-small-bathroom-design-19.jpg.webp" alt="Modern Bathroom"/>
                    <div class="carousel-caption">
                        <h2>Contemporary Bathrooms</h2>
                        <p>Where luxury meets functionality</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="https://5.imimg.com/data5/SELLER/Default/2024/6/424606641/WY/PJ/NJ/139435350/kitchen-interior-service.jpg" alt="Designer Kitchen"/>
                    <div class="carousel-caption">
                        <h2>Dream Kitchens</h2>
                        <p>Crafted for both style and practicality</p>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#mainCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#mainCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon"></span>
            </button>
        </div>

        <!-- Gallery Section -->
        <div class="container gallery-container">
            <h2 class="section-title">Our Featured Projects</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="gallery-item">
                        <img src="https://images.pexels.com/photos/1571460/pexels-photo-1571460.jpeg" alt="Modern Living Room"/>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="gallery-item">
                        <img src="data:image/jpeg;base64,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" alt="Elegant Bedroom"/>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="gallery-item">
                        <img src="https://images.livspace-cdn.com/w:3840/plain/https://d3gq2merok8n5r.cloudfront.net/abhinav/ond-1634120396-Obfdc/ond-2024-1727950725-vfT46/ai-1729763281-QQglY/bathroom-1730284583-BRlCH/br-3-1734010081-rguGp.jpg" alt="Luxury Bathroom"/>
                    </div>
                </div>
            </div>
            <div class="text-center">
                <a href="Projects.aspx" class="view-more-btn">View More Projects</a>
            </div>
        </div>
        <div class="container">
            <div class="header">
                <h1>Home Interiors <span>Made Easy</span></h1>
            </div>
            
            <p class="subheading">
                With our end-to-end service, creating your ideal home interior becomes simple and stress-free.
            </p>

            <div class="timeline">
                <asp:Repeater ID="TimelineRepeater" runat="server">
                    <ItemTemplate>
                        <div class="timeline-item">
                            <div class="timeline-image">
                                <asp:Image ID="StepImage" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' />
                            </div>
                            <div class="timeline-point"></div>
                            <div class="timeline-title">
                                <%# Eval("StepNumber") %>. <%# Eval("Title") %>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <div class="button-container">
    <asp:LinkButton ID="ViewMoreBtn" runat="server" 
        Text="View More ›" 
        CssClass="view-more-btn"
        Font-Names="Arial"
        Font-Size="14px"
        PostBackUrl="~/BudgetEstimator.aspx"
        Style="text-decoration: none; margin-right: 15px; display: inline-block;" />
        
    <asp:LinkButton ID="StartProjectBtn" runat="server" 
        Text="Start Your Project" 
        OnClick="StartProjectBtn_Click"
        CssClass="start-project-btn"
        Font-Names="Arial"
        Font-Size="14px"
        Style="background-color: #2b1420; 
               color: #F4A460; 
               padding: 8px 20px; 
               border-radius: 20px; 
               text-decoration: none; 
               display: inline-block; 
               cursor: pointer;
               text-align: center;" />
</div>
    <script type="text/javascript">
        // Add hover effect for View More button
        document.getElementById('<%= ViewMoreBtn.ClientID %>').onmouseover = function() {
            this.style.textDecoration = 'underline';
            this.style.color = '#666666';
        };
        document.getElementById('<%= ViewMoreBtn.ClientID %>').onmouseout = function () {
            this.style.textDecoration = 'none';
            this.style.color = '#333333';
        };
        // Add hover effect for Start Project button
        document.getElementById('<%= StartProjectBtn.ClientID %>').onmouseover = function() {
            this.style.backgroundColor = '#3d1d2d';
            this.style.boxShadow = '0 4px 8px rgba(0,0,0,0.2)';
        };
        document.getElementById('<%= StartProjectBtn.ClientID %>').onmouseout = function () {
            this.style.backgroundColor = '#2b1420';
            this.style.boxShadow = 'none';
        };
    </script>   
        <div class="container text-center mt-5">
    <h2 style="font-size: 2.8rem; color: #333;">
        Why Choose <span style="font-style: italic; color: #b87d3b;">AK Groups Interior Designs?</span>
    </h2>
    <p class="lead" style="color: #666; font-size: 1.2rem; max-width: 750px; margin: 10px auto; height: 163px; width: 852px;">
        ✨ <strong>Transform your space into a masterpiece</strong> with <span style="color: #b87d3b; font-weight: bold;">AK Groups Interior Designs</span>, 
        where creativity meets perfection! 🎨✨ Our expert designers blend <strong>elegance, functionality, and innovation</strong> to craft interiors that truly 
        reflect your style and personality. From modern minimalism to timeless classics, every detail is <strong>tailored to perfection</strong>. 🌿🏡💫  
        Because <strong>your home deserves nothing but the best!</strong> ❤️✨
    </p>
    &nbsp;</div>
        <div class="container mt-5">
    <div class="image-grid">
        <img src="https://www.asenseinterior.com/assets/frontend/images/experience_photo.webp" class="grid-item large" alt="Interior 1"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="Booking.aspx" class="btn get-started-btn mt-3">Get Started</a></div>
</div>



        <!-- Footer -->
<footer class="footer">
    <div class="container">
        <div class="row">
            <!-- Contact Section -->
            <div class="col-md-4 footer-section">
                <h5>Contact Us</h5>
                <p>
                    <i class="fas fa-envelope"></i> 
                    <a href="mailto:akgroup.interiors@gmail.com">akgroup.interiors@gmail.com</a>
                    <br/>
                    <i class="fas fa-phone"></i> 
                    <a href="tel:+91 9880731765">(988) 073-1765</a>
                </p>
            </div>

            <!-- Quick Links -->
            <div class="col-md-4 footer-section">
                <h5>Quick Links</h5>
                <ul class="list-unstyled">
                    <li><asp:HyperLink runat="server" NavigateUrl="~/About.aspx">About Us</asp:HyperLink></li>
                    <li><asp:HyperLink runat="server" NavigateUrl="~/Privacy.aspx">Privacy Policy</asp:HyperLink></li>
                    <li><asp:HyperLink runat="server" NavigateUrl="~/Terms.aspx">Terms of Service</asp:HyperLink></li>
                </ul>
            </div>

            <!-- Social Media -->
            <div class="col-md-4 footer-section">
                <h5>Follow Us</h5>
                <p>Stay connected on social media</p>
                <div class="social-icons">
                    <a href="https://facebook.com" target="_blank" class="social-icon"><i class="fab fa-facebook-f"></i></a>
                    <a href="https://twitter.com" target="_blank" class="social-icon"><i class="fab fa-twitter"></i></a>
                    <a href="https://instagram.com" target="_blank" class="social-icon"><i class="fab fa-instagram"></i></a>
                    <a href="https://linkedin.com" target="_blank" class="social-icon"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
        </div>
        
        <hr/>
        
        <!-- Copyright Section -->
        <div class="text-center">
            <p class="copyright">© 2024 AK Group Interiors. All Rights Reserved.</p>
        </div>
    </div>
</footer>


</form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>