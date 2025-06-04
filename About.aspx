<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="InteriorDesign.About" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About Us - AK Group Interior Design</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <style>
        /* Google Font Import */
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Playfair+Display:wght@400;500;600;700&display=swap');
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Poppins', Arial, sans-serif;
            line-height: 1.6;
            color: #333;
            background-color: #f9f5ff;
            padding: 0;
            margin: 0;
        }
        
        /* Header Section */
        .header {
            background: linear-gradient(135deg, #8A2BE2, #9370DB);
            color: white;
            text-align: center;
            padding: 80px 20px;
            position: relative;
            overflow: hidden;
        }
        
        .header:before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('https://images.unsplash.com/photo-1618221195710-dd6b41faaea6?blur=8');
            background-size: cover;
            opacity: 0.15;
            z-index: 0;
        }
        
        .header-content {
            position: relative;
            z-index: 1;
            max-width: 900px;
            margin: 0 auto;
        }
        
        .header h1 {
            font-family: 'Playfair Display', serif;
            font-size: 3.5rem;
            margin-bottom: 20px;
            color: white;
            font-weight: 700;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.2);
        }
        
        .header p {
            font-size: 1.2rem;
            max-width: 700px;
            margin: 0 auto;
            opacity: 0.9;
        }
        
        /* Main Container */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        /* About Section */
        .about-section {
            padding: 60px 0;
            background-color: white;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            border-radius: 10px;
            margin-top: -50px;
            position: relative;
            z-index: 2;
        }
        
        .about-heading {
            font-family: 'Playfair Display', serif;
            font-size: 2.2rem;
            color: #8A2BE2;
            margin-bottom: 30px;
            text-align: center;
            position: relative;
            display: inline-block;
        }
        
        .about-heading:after {
            content: '';
            position: absolute;
            width: 60px;
            height: 3px;
            background-color: #de72fe;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
        }
        
        .about-description {
            line-height: 1.8;
            text-align: left;
            margin-bottom: 50px;
            font-size: 1.05rem;
            color: #444;
            padding: 0 20px;
        }
        
        .about-description p {
            margin-bottom: 20px;
        }
        
        .highlight-text {
            font-weight: 500;
            color: #8A2BE2;
        }
        
        .section-title {
            font-family: 'Playfair Display', serif;
            font-size: 1.8rem;
            color: #8A2BE2;
            margin-bottom: 40px;
            text-align: center;
            font-weight: 600;
        }
        
        /* Feature Item Sections */
        .feature-sections {
            padding: 40px 0;
        }
        
        .feature-item {
            display: flex;
            align-items: stretch;
            margin-bottom: 60px;
            background-color: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(138, 43, 226, 0.08);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        
        .feature-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(138, 43, 226, 0.12);
        }
        
        .feature-item:nth-child(even) {
            flex-direction: row-reverse;
        }
        
        .feature-image {
            flex: 0 0 45%;
            position: relative;
            overflow: hidden;
        }
        
        .feature-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
            transition: transform 0.5s ease;
        }
        
        .feature-item:hover .feature-image img {
            transform: scale(1.05);
        }
        
        .feature-content {
            flex: 1;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        
        .feature-heading {
            font-family: 'Playfair Display', serif;
            color: #8A2BE2;
            margin-bottom: 20px;
            font-size: 1.6rem;
            position: relative;
            padding-bottom: 15px;
            font-weight: 600;
        }
        
        .feature-heading:after {
            content: '';
            position: absolute;
            width: 40px;
            height: 2px;
            background-color: #de72fe;
            bottom: 0;
            left: 0;
        }
        
        .feature-content p {
            color: #555;
            margin-bottom: 15px;
            line-height: 1.7;
        }
        
        .icon-box {
            display: inline-block;
            width: 60px;
            height: 60px;
            background-color: rgba(138, 43, 226, 0.1);
            border-radius: 50%;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #8A2BE2;
            font-size: 1.5rem;
        }
        
        /* Footer CTA */
        .cta-section {
            background: linear-gradient(135deg, #8A2BE2, #9370DB);
            color: white;
            text-align: center;
            padding: 60px 20px;
            margin-top: 40px;
            border-radius: 10px;
        }
        
        .cta-title {
            font-family: 'Playfair Display', serif;
            font-size: 2rem;
            margin-bottom: 20px;
        }
        
        .cta-button {
            display: inline-block;
            padding: 12px 30px;
            background-color: white;
            color: #8A2BE2;
            text-decoration: none;
            border-radius: 30px;
            font-weight: 600;
            margin-top: 20px;
            transition: all 0.3s ease;
            border: 2px solid white;
        }
        
        .cta-button:hover {
            background-color: transparent;
            color: white;
        }
        
        /* Responsive Styles */
        @media (max-width: 768px) {
            .header h1 {
                font-size: 2.5rem;
            }
            
            .feature-item, .feature-item:nth-child(even) {
                flex-direction: column;
            }
            
            .feature-image {
                flex: 0 0 auto;
                height: 250px;
            }
            
            .feature-content {
                padding: 30px;
            }
        }
    </style>
</head>
<body>
    <!-- Header Section -->
    <div class="header">
        <div class="header-content">
            <h1>About AK Group</h1>
            <p>Creating Exceptional Interior Spaces Since 1998</p>
        </div>
    </div>
    
    <div class="container">
        <!-- About Section -->
        <div class="about-section">
            <h2 class="about-heading">Our Story</h2>
            <div class="about-description">
                <p>
                    Founded in 1998, <span class="highlight-text">AK Group</span> has been a leading company in the interior design industry, specializing in creating exquisite, functional spaces. With over <span class="highlight-text">25 years of expertise</span>, we are renowned for our specialization in interior decoration, complex glass works, and a diverse range of high-quality materials.
                </p>
                <p>
                    Our services encompass intricate decorative interiors, custom glass solutions, and the supply of premium plywood, doors, and hardware. As trusted dealers in all types of glass, plywood, and hardware, we ensure that every project is equipped with the best materials, providing durability and elegance to each design.
                </p>
                <p>
                    At AK Group, customer satisfaction is our priority. Our clients consistently express their appreciation for our professionalism, timely service, and personalized approach to transforming their spaces. We take pride in turning their visions into reality, delivering results that exceed expectations. Whether for residential, commercial, or office spaces, AK Group is committed to bringing creativity and excellence into every project.
                </p>
            </div>
            
            <h3 class="section-title">Our Featured Projects</h3>
        </div>
        
        <!-- Feature Sections -->
        <div class="feature-sections">
            <!-- LED Mirrors Section -->
            <div class="feature-item">
                <div class="feature-image">
                    <img src="https://i.etsystatic.com/31923344/r/il/f076df/3406954620/il_570xN.3406954620_ayf1.jpg" alt="LED Mirrors" />
                </div>
                <div class="feature-content">
                    <div class="icon-box"><i class="fas fa-lightbulb"></i></div>
                    <h3 class="feature-heading">LED MIRRORS</h3>
                    <p>
                        We are proud to have worked with prestigious clients such as Madeena Hotel, where we had the privilege of providing a unique and modern design element by installing sophisticated LED mirrors.
                    </p>
                    <p>
                        The integration of advanced LED technology not only elevated the ambiance of the hotel's interiors but also offered an energy-efficient lighting solution that complemented the space's luxurious atmosphere.
                    </p>
                </div>
            </div>
            
            <!-- Railing Glass Section -->
            <div class="feature-item">
                <div class="feature-image">
                    <img src="https://images.unsplash.com/photo-1613490493576-7fde63acd811" alt="Railing Glass" />
                </div>
                <div class="feature-content">
                    <div class="icon-box"><i class="fas fa-shield-alt"></i></div>
                    <h3 class="feature-heading">RAILING GLASS</h3>
                    <p>
                        AK Group is proud to have completed the installation of high-quality railing glass for prestigious residential plots. These projects involved the precise fitting of custom-designed glass railings that combine safety, durability, and aesthetic appeal.
                    </p>
                    <p>
                        The choice of premium materials and attention to detail in installation allowed us to deliver sleek and contemporary railing solutions that enhance the overall beauty of residential spaces.
                    </p>
                </div>
            </div>
            
            <!-- Frameless Shower Enclosures Section -->
            <div class="feature-item">
                <div class="feature-image">
                    <img src="https://www.jaquar.com/images/uploaded/jaquar%20frameless%20shower%20enclosures.jpg" alt="Frameless Shower Enclosures" />
                </div>
                <div class="feature-content">
                    <div class="icon-box"><i class="fas fa-shower"></i></div>
                    <h3 class="feature-heading">FRAMELESS SHOWER ENCLOSURES</h3>
                    <p>
                        AK Group specializes in creating elegant frameless shower enclosures that transform bathrooms into modern, spacious retreats. Our recent project at Luxury Towers demonstrates the sophisticated appeal of these custom glass installations.
                    </p>
                    <p>
                        Each enclosure is precision-crafted using tempered safety glass and premium hardware, ensuring both stunning aesthetics and reliable performance. Our clients appreciate how these transparent barriers maximize light and create an illusion of expanded space in their bathrooms.
                    </p>
                </div>
            </div>
            
            <!-- Glass Partitions Section -->
            <div class="feature-item">
                <div class="feature-image">
                    <img src="https://images.unsplash.com/photo-1497366811353-6870744d04b2" alt="Glass Partitions" />
                </div>
                <div class="feature-content">
                    <div class="icon-box"><i class="fas fa-border-all"></i></div>
                    <h3 class="feature-heading">GLASS PARTITIONS</h3>
                    <p>
                        Our commercial glass partition solutions have been implemented across numerous office spaces, including the recent project at Skyline Corporate Center. These partitions create distinct, functional areas while maintaining an open, collaborative atmosphere.
                    </p>
                    <p>
                        Using a combination of clear, frosted, and decorative glass options, we design partitions that balance privacy with aesthetic appeal. Each installation is customized to the client's specific needs, providing effective space division without sacrificing natural light or visual connectivity.
                    </p>
                </div>
            </div>
        </div>
        
        <!-- Call to Action Section -->
        <div class="cta-section">
            <h3 class="cta-title">Ready to Transform Your Space?</h3>
            <p>Let our team of experts bring your vision to life with our premium interior design solutions.</p>
            <a href="ContactUs.aspx" class="cta-button">Contact Us Today</a>
        </div>
    </div>
</body>
</html>