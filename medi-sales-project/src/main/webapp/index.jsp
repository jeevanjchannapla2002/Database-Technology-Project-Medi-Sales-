<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Medi Sales</title>
    <style>
        body {
                    background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)),
                                url('https://img.freepik.com/premium-photo/stethoscope-blue-background-medical-concept-generative-ai_634053-8050.jpg'); /* Background image */
                    background-size: cover;
                    background-position: center;
                    background-attachment: fixed;
                    color: white;
                    min-height: 100vh; /* Ensure the body takes up at least the full height of the viewport */
                    display: flex;
                    flex-direction: column;
                    margin: 0; /* Remove any default margin */
        }
        header {
            background: rgba(173, 216, 230, 0.9) !important;;
            color: black;
            padding: 0.5rem 0;
            text-align: center;
        }
        header h1 {
            margin: 0;
        }
        nav {
            margin-top: 1rem;
        }
        nav a {
            color: black;
            text-decoration: none;
            margin: 0 1rem;
        }
        nav a:hover {
            text-decoration: underline;
        }

        .container {
            padding: 2rem;
        }
        .hero {
            text-align: center;
            padding: 3rem 1rem;
            background: transperant;
        }
        .hero h2 {
            color: #007BFF;
        }
        .features {
            display: flex;
            flex-wrap: wrap;
            gap: 1rem;
            justify-content: space-between;
        }
        .feature {
            flex: 1 1 calc(33.333% - 1rem);
            background: transperant;
            padding: 1rem;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .feature h3 {
            color: #007BFF;
        }
        footer {
            background: black;
            color: #fff;
            text-align: center;
            padding: 0.2rem 0;
            margin-top: 0rem;
        }
        footer a {
            color: #fff;
            text-decoration: none;
        }
        footer a:hover {
            text-decoration: underline;
        }


    </style>
</head>
<body>
    <header>
            <div class="logo-container">
                <img src="logo.png" alt="Marg ERP Logo" height="40">
            </div>
        <h1>X-workz Medi Sales</h1>
        <nav>
            <a href="#">Home</a>
            <a href="#features">Features</a>
            <a href="#about">About</a>
            <a href="#contact">Contact</a>
            <a href="register">SignUp</a>
            <a href="signIn">SignIn</a>

        </nav>
    </header>

    <div class="container">
        <section class="hero">
            <h2>Your Trusted Partner in Medical Equipment</h2>
            <p>We provide top-quality medical equipment and supplies at competitive prices, ensuring your healthcare needs are met with reliability and efficiency.</p>
        </section>
<br>
        <section id="features" class="features">
            <div class="feature">
                <h3>Wide Range of Products</h3>
                <p>From diagnostic tools to surgical instruments, we have a comprehensive selection of medical equipment to meet your needs.</p>
            </div>
            <div class="feature">
                <h3>Top-Notch Quality</h3>
                <p>All our products meet the highest industry standards, ensuring safety and reliability in every use.</p>
            </div>
            <div class="feature">
                <h3>Exceptional Support</h3>
                <p>Our team is here to assist you every step of the way, providing expert advice and prompt customer service.</p>
            </div>
        </section>

        <section id="about">
            <h2>About Medi Sales</h2>
            <p>With over 10 years of experience in the medical supplies industry, Medi Sales is committed to delivering excellence. Our mission is to empower healthcare providers by equipping them with the best tools for their work.</p>
        </section>

        <section id="contact">
            <h2>Contact Us</h2>
            <p>Email: jeevanjcklb.xworkz@gmail.com</p>
            <p>Phone: +91 8867397004</p>
            <p>Address: MAHE, Bengaluru</p>
        </section>
    </div>

    <footer>
        <p>&copy; 2025 X-workz Medi Sales. All rights reserved. <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
    </footer>
</body>
</html>
