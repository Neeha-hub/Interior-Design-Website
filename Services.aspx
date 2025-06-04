<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="InteriorDesign.Services" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Our Services - Interior Design Solutions</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            color: #333;
        }
        
        .header {
            background: linear-gradient(135deg, #663399 0%, #4B0082 100%);
            color: white;
            padding: 2rem 0;
            margin-bottom: 3rem;
            position: relative;
            overflow: hidden;
        }
        
        .header::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            right: 0;
            height: 20px;
            background: inherit;
            transform: skewY(-1deg);
        }
        
        .header h1 {
            font-weight: 600;
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
        }
        
        .header p {
            font-weight: 300;
            font-size: 1.2rem;
            max-width: 700px;
            margin: 0 auto;
        }
        
        .service-card {
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            transition: all 0.3s ease;
            height: 100%;
            border: none;
        }
        
        .service-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 35px rgba(102, 51, 153, 0.15);
        }
        
        .card-img-top {
            height: 250px;
            object-fit: cover;
        }
        
        .service-card .card-body {
            padding: 1.8rem;
        }
        
        .service-card .card-title {
            font-weight: 600;
            margin-bottom: 1rem;
            color: #4B0082;
        }
        
        .tag {
            display: inline-block;
            background-color: #f0e6ff;
            color: #663399;
            padding: 0.3rem 0.8rem;
            border-radius: 20px;
            font-size: 0.8rem;
            margin-right: 0.5rem;
            margin-bottom: 0.5rem;
        }
        
        .btn-primary {
            background: linear-gradient(135deg, #663399 0%, #4B0082 100%);
            border: none;
            padding: 0.6rem 1.5rem;
            border-radius: 30px;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(102, 51, 153, 0.2);
        }
        
        .section-title {
            position: relative;
            margin-bottom: 3rem;
            font-weight: 600;
            text-align: center;
        }
        
        .section-title:after {
            content: "";
            position: absolute;
            left: 50%;
            bottom: -15px;
            width: 60px;
            height: 4px;
            background: linear-gradient(135deg, #663399 0%, #4B0082 100%);
            transform: translateX(-50%);
            border-radius: 2px;
        }
        
        .service-img-container {
            position: relative;
            overflow: hidden;
        }
        
        .service-overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(rgba(0,0,0,0), rgba(75, 0, 130, 0.7));
            opacity: 0;
            transition: all 0.3s ease;
            display: flex;
            align-items: flex-end;
            padding: 1.5rem;
        }
        
        .service-card:hover .service-overlay {
            opacity: 1;
        }
        
        .overlay-content {
            color: white;
            transform: translateY(20px);
            transition: all 0.3s ease;
        }
        
        .service-card:hover .overlay-content {
            transform: translateY(0);
        }
        
        .enquiry-section {
            background-color: #f0e6ff;
            padding: 4rem 0;
            border-radius: 15px;
            margin-top: 4rem;
        }
        
        .enquiry-card {
            background: white;
            border-radius: 15px;
            padding: 2.5rem;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
        }
        
        .feature-box {
            display: flex;
            align-items: flex-start;
            margin-bottom: 1.5rem;
        }
        
        .feature-icon {
            background: #f0e6ff;
            color: #663399;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
            margin-right: 1rem;
            flex-shrink: 0;
        }
        
        .back-to-top {
            position: fixed;
            bottom: 30px;
            right: 30px;
            width: 50px;
            height: 50px;
            background: linear-gradient(135deg, #663399 0%, #4B0082 100%);
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
            box-shadow: 0 5px 15px rgba(102, 51, 153, 0.3);
            cursor: pointer;
            transition: all 0.3s ease;
            z-index: 999;
        }
        
        .back-to-top:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(102, 51, 153, 0.4);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header text-center">
            <div class="container">
                <h1>Our Premium Glass & Interior Services</h1>
                <p>Transform your space with our elegant glass solutions and custom interior design services tailored to your needs.</p>
            </div>
        </div>
        
        <div class="container pb-5">
            <h2 class="section-title">Explore Our Services</h2>
            
            <div class="row g-4">
                <!-- LED Mirrors -->
                <div class="col-lg-4 col-md-6">
                    <div class="service-card card">
                        <div class="service-img-container">
                            <asp:Image ID="imgLEDMirrors" runat="server" CssClass="card-img-top" 
                                ImageUrl="/api/placeholder/600/400" AlternateText="LED Mirrors" />
                            <div class="service-overlay">
                                <div class="overlay-content">
                                    <h5>Premium LED lighting with custom designs</h5>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <h4 class="card-title">LED Mirrors</h4>
                            <div class="tags mb-3">
                                <span class="tag">Bathroom</span>
                                <span class="tag">Modern</span>
                                <span class="tag">Lighting</span>
                            </div>
                            <p class="card-text">Illuminate your space with our custom LED mirrors. Perfect for bathrooms, dressing areas, and decorative accents with energy-efficient lighting and fog-free technology.</p>
                            <asp:LinkButton ID="lnkLEDMirrors" runat="server" CssClass="btn btn-primary mt-2" Text="View Details"></asp:LinkButton>
                        </div>
                    </div>
                </div>
                
                <!-- Glass Partitions -->
                <div class="col-lg-4 col-md-6">
                    <div class="service-card card">
                        <div class="service-img-container">
                            <asp:Image ID="imgGlassPartitions" runat="server" CssClass="card-img-top" 
                                ImageUrl="/api/placeholder/600/400" AlternateText="Glass Partitions" />
                            <div class="service-overlay">
                                <div class="overlay-content">
                                    <h5>Create defined spaces while maintaining openness</h5>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <h4 class="card-title">Glass Partitions</h4>
                            <div class="tags mb-3">
                                <span class="tag">Office</span>
                                <span class="tag">Home</span>
                                <span class="tag">Dividers</span>
                            </div>
                            <p class="card-text">Elegant glass partitions to divide spaces while maintaining light flow and visual continuity. Perfect for offices, homes, and commercial spaces with customizable opacity and designs.</p>
                            <asp:LinkButton ID="lnkGlassPartitions" runat="server" CssClass="btn btn-primary mt-2" Text="View Details"></asp:LinkButton>
                        </div>
                    </div>
                </div>
                
                <!-- Glass Railings -->
                <div class="col-lg-4 col-md-6">
                    <div class="service-card card">
                        <div class="service-img-container">
                            <asp:Image ID="imgGlassRailings" runat="server" CssClass="card-img-top" 
                                ImageUrl="/api/placeholder/600/400" AlternateText="Glass Railings" />
                            <div class="service-overlay">
                                <div class="overlay-content">
                                    <h5>Elegant safety solutions for stairs and balconies</h5>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <h4 class="card-title">Glass Railings</h4>
                            <div class="tags mb-3">
                                <span class="tag">Staircases</span>
                                <span class="tag">Balconies</span>
                                <span class="tag">Safety</span>
                            </div>
                            <p class="card-text">Modern glass railing systems for staircases, balconies, and terraces. Combining safety with sleek design, our tempered glass railings create an open, airy feel while maintaining security.</p>
                            <asp:LinkButton ID="lnkGlassRailings" runat="server" CssClass="btn btn-primary mt-2" Text="View Details"></asp:LinkButton>
                        </div>
                    </div>
                </div>
                
                <!-- UPVC Work -->
                <div class="col-lg-4 col-md-6">
                    <div class="service-card card">
                        <div class="service-img-container">
                            <asp:Image ID="imgUPVC" runat="server" CssClass="card-img-top" 
                                ImageUrl="/api/placeholder/600/400" AlternateText="UPVC Work" />
                            <div class="service-overlay">
                                <div class="overlay-content">
                                    <h5>Energy-efficient windows and doors</h5>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <h4 class="card-title">UPVC Solutions</h4>
                            <div class="tags mb-3">
                                <span class="tag">Windows</span>
                                <span class="tag">Doors</span>
                                <span class="tag">Energy-Efficient</span>
                            </div>
                            <p class="card-text">High-quality UPVC doors and windows offering excellent insulation, soundproofing, and weather resistance. Our maintenance-free UPVC solutions combine durability with aesthetic appeal.</p>
                            <asp:LinkButton ID="lnkUPVC" runat="server" CssClass="btn btn-primary mt-2" Text="View Details"></asp:LinkButton>
                        </div>
                    </div>
                </div>
                
                <!-- Pergola Glass Work -->
                <div class="col-lg-4 col-md-6">
                    <div class="service-card card">
                        <div class="service-img-container">
                            <asp:Image ID="imgPergola" runat="server" CssClass="card-img-top" 
                                ImageUrl="/api/placeholder/600/400" AlternateText="Pergola Glass Work" />
                            <div class="service-overlay">
                                <div class="overlay-content">
                                    <h5>Outdoor living spaces with elegant protection</h5>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <h4 class="card-title">Pergola Glass Work</h4>
                            <div class="tags mb-3">
                                <span class="tag">Outdoor</span>
                                <span class="tag">Patio</span>
                                <span class="tag">Garden</span>
                            </div>
                            <p class="card-text">Create stunning outdoor living spaces with our glass pergolas. Offering protection from the elements while allowing natural light, our pergolas blend functionality with sophisticated design.</p>
                            <asp:LinkButton ID="lnkPergola" runat="server" CssClass="btn btn-primary mt-2" Text="View Details"></asp:LinkButton>
                        </div>
                    </div>
                </div>
                
                <!-- Glass Tables -->
                <div class="col-lg-4 col-md-6">
                    <div class="service-card card">
                        <div class="service-img-container">
                            <asp:Image ID="imgGlassTables" runat="server" CssClass="card-img-top" 
                                ImageUrl="/api/placeholder/600/400" AlternateText="Glass Tables" />
                            <div class="service-overlay">
                                <div class="overlay-content">
                                    <h5>Custom furniture pieces for any space</h5>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <h4 class="card-title">Glass Tables</h4>
                            <div class="tags mb-3">
                                <span class="tag">Furniture</span>
                                <span class="tag">Custom</span>
                                <span class="tag">Dining</span>
                            </div>
                            <p class="card-text">Bespoke glass tables for dining rooms, living areas, and offices. From minimalist designs to artistic statement pieces, our tables combine durability with sophisticated aesthetics.</p>
                            <asp:LinkButton ID="lnkGlassTables" runat="server" CssClass="btn btn-primary mt-2" Text="View Details"></asp:LinkButton>
                        </div>
                    </div>
                </div>
                
                <!-- Etched & Frosted Glass -->
                <div class="col-lg-4 col-md-6">
                    <div class="service-card card">
                        <div class="service-img-container">
                            <asp:Image ID="imgEtchedGlass" runat="server" CssClass="card-img-top" 
                                ImageUrl="/api/placeholder/600/400" AlternateText="Etched & Frosted Glass" />
                            <div class="service-overlay">
                                <div class="overlay-content">
                                    <h5>Artistic designs with privacy benefits</h5>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <h4 class="card-title">Etched & Frosted Glass</h4>
                            <div class="tags mb-3">
                                <span class="tag">Decorative</span>
                                <span class="tag">Privacy</span>
                                <span class="tag">Custom</span>
                            </div>
                            <p class="card-text">Artistic etched and frosted glass for privacy solutions and decorative elements. Custom designs for doors, windows, partitions and signage with elegant patterns and logos.</p>
                            <asp:LinkButton ID="lnkEtchedGlass" runat="server" CssClass="btn btn-primary mt-2" Text="View Details"></asp:LinkButton>
                        </div>
                    </div>
                </div>
                
                <!-- Glass Signs -->
                <div class="col-lg-4 col-md-6">
                    <div class="service-card card">
                        <div class="service-img-container">
                            <asp:Image ID="imgGlassSigns" runat="server" CssClass="card-img-top" 
                                ImageUrl="/api/placeholder/600/400" AlternateText="Glass Signs" />
                            <div class="service-overlay">
                                <div class="overlay-content">
                                    <h5>Professional branding solutions</h5>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <h4 class="card-title">Glass Signs</h4>
                            <div class="tags mb-3">
                                <span class="tag">Business</span>
                                <span class="tag">Branding</span>
                                <span class="tag">Office</span>
                            </div>
                            <p class="card-text">Elevate your brand with custom glass signage. Perfect for corporate offices, retail spaces, and professional environments, our signs combine premium materials with precision craftsmanship.</p>
                            <asp:LinkButton ID="lnkGlassSigns" runat="server" CssClass="btn btn-primary mt-2" Text="View Details"></asp:LinkButton>
                        </div>
                    </div>
                </div>
                
                <!-- Shower Cubicle -->
                <div class="col-lg-4 col-md-6">
                    <div class="service-card card">
                        <div class="service-img-container">
                            <asp:Image ID="imgShowerCubicle" runat="server" CssClass="card-img-top" 
                                ImageUrl="/api/placeholder/600/400" AlternateText="Shower Cubicle" />
                            <div class="service-overlay">
                                <div class="overlay-content">
                                    <h5>Modern bathroom solutions</h5>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <h4 class="card-title">Shower Cubicles</h4>
                            <div class="tags mb-3">
                                <span class="tag">Bathroom</span>
                                <span class="tag">Shower</span>
                                <span class="tag">Modern</span>
                            </div>
                            <p class="card-text">Premium shower cubicles and enclosures for modern bathrooms. Our designs feature tempered safety glass, innovative hardware, and customizable options to match your bathroom decor.</p>
                            <asp:LinkButton ID="lnkShowerCubicle" runat="server" CssClass="btn btn-primary mt-2" Text="View Details"></asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Enquiry Section -->
            <div class="enquiry-section mt-5">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-6 mb-4 mb-lg-0">
                            <h3 class="mb-4">Why Choose Our Glass Services?</h3>
                            
                            <div class="feature-box">
                                <div class="feature-icon">
                                    <i class="fas fa-medal"></i>
                                </div>
                                <div>
                                    <h5>Premium Quality Materials</h5>
                                    <p>We use only high-grade tempered glass and premium hardware for all our installations.</p>
                                </div>
                            </div>
                            
                            <div class="feature-box">
                                <div class="feature-icon">
                                    <i class="fas fa-drafting-compass"></i>
                                </div>
                                <div>
                                    <h5>Custom Design Solutions</h5>
                                    <p>Every project is tailored to your specific requirements, style preferences, and space constraints.</p>
                                </div>
                            </div>
                            
                            <div class="feature-box">
                                <div class="feature-icon">
                                    <i class="fas fa-tools"></i>
                                </div>
                                <div>
                                    <h5>Expert Installation</h5>
                                    <p>Our team of skilled professionals ensures precise installation and finishing for every project.</p>
                                </div>
                            </div>
                            
                            <div class="feature-box">
                                <div class="feature-icon">
                                    <i class="fas fa-shield-alt"></i>
                                </div>
                                <div>
                                    <h5>Warranty & Support</h5>
                                    <p>All our services come with comprehensive warranty and ongoing customer support.</p>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-lg-6">
                            <div class="enquiry-card">
                                <h4 class="mb-4">Get a Free Consultation</h4>
                                <div class="mb-3">
                                    <label for="txtName" class="form-label">Your Name</label>
                                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="John Doe"></asp:TextBox>
                                </div>
                                
                                <div class="mb-3">
                                    <label for="txtEmail" class="form-label">Email Address</label>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="john@example.com"></asp:TextBox>
                                </div>
                                
                                <div class="mb-3">
                                    <label for="txtPhone" class="form-label">Phone Number</label>
                                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="+1 234 567 8900"></asp:TextBox>
                                </div>
                                
                                <div class="mb-3">
                                    <label for="ddlService" class="form-label">Service Interested In</label>
                                    <asp:DropDownList ID="ddlService" runat="server" CssClass="form-select">
                                        <asp:ListItem Text="Select a Service" Value="" />
                                        <asp:ListItem Text="LED Mirrors" Value="led_mirrors" />
                                        <asp:ListItem Text="Glass Partitions" Value="glass_partitions" />
                                        <asp:ListItem Text="Glass Railings" Value="glass_railings" />
                                        <asp:ListItem Text="UPVC Solutions" Value="upvc" />
                                        <asp:ListItem Text="Pergola Glass Work" Value="pergola" />
                                        <asp:ListItem Text="Glass Tables" Value="glass_tables" />
                                        <asp:ListItem Text="Etched & Frosted Glass" Value="etched_glass" />
                                        <asp:ListItem Text="Glass Signs" Value="glass_signs" />
                                        <asp:ListItem Text="Shower Cubicles" Value="shower_cubicle" />
                                    </asp:DropDownList>
                                </div>
                                
                                <div class="mb-4">
                                    <label for="txtMessage" class="form-label">Your Requirements</label>
                                    <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" placeholder="Tell us about your project..."></asp:TextBox>
                                </div>
                                
                                <asp:Button ID="btnSubmit" runat="server" Text="Request Consultation" CssClass="btn btn-primary w-100" OnClick="btnSubmit_Click" />
                                
                                <asp:Label ID="lblMessage" runat="server" CssClass="mt-3 d-block text-center"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="back-to-top" id="backToTop" onclick="scrollToTop()">
            <i class="fas fa-arrow-up"></i>
        </div>
        
        <!-- Bootstrap JS and custom scripts -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript">
            // Back to top functionality
            function scrollToTop() {
                window.scrollTo({
                    top: 0,
                    behavior: 'smooth'
                });
            }
            
            // Show/hide back to top button based on scroll position
            window.onscroll = function() {
                if (document.body.scrollTop > 200 || document.documentElement.scrollTop > 200) {
                    document.getElementById("backToTop").style.display = "flex";
                } else {
                    document.getElementById("backToTop").style.display = "none";
                }
            };
            
            // Initialize the page with back to top hidden
            document.addEventListener('DOMContentLoaded', function() {
                document.getElementById("backToTop").style.display = "none";
            });
        </script>
    </form>
</body>
</html>
