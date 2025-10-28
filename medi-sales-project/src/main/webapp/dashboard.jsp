<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Front Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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

        .navbar {
            background-color: rgba(173, 216, 230, 0.9) !important;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        }

        .navbar .nav-link {
            color: #000 !important;
            transition: color 0.3s;
        }

        .navbar .nav-link:hover {
            color: #0056b3 !important;
        }

        .navbar-toggler-icon {
            background-color: #000; /* Black color for the hamburger icon */
        }

        .menu-icon {
            font-size: 28px;
            cursor: pointer;
            color: white;
            margin-right: 15px;
            background: none;
            border: none;
        }

        .offcanvas {
            background-color: rgba(0, 0, 0, 0.8);
            color: white;
            width: 250px;
            padding: 20px;
        }

        .offcanvas a {
            display: block;
            padding: 10px;
            color: white;
            text-decoration: none;
            font-size: 14px;
            border-radius: 15px;
            transition: 0.3s;
        }

        .offcanvas a:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }


        footer {
                    background: black;
                    color: #fff;
                    text-align: center;
                    padding: 0.2rem 0;
                    margin-top: 0.9rem;
                }
                footer a {
                    color: #fff;
                    text-decoration: none;
                }
                footer a:hover {
                    text-decoration: underline;
        }

        .hero-section {
            text-align: center;
            padding: 100px 20px; /* Increased padding for better spacing */
            flex: 1; /* Allow hero section to grow and take available space */
        }

        .hero-section h1 {
            font-size: 3.5rem; /* Increased font size */
            font-weight: bold;
        }

        .hero-section p {
            font-size: 1.5rem; /* Increased font size */
            margin-top: 20px;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
            border-radius: 25px; /* Rounded corners */
            padding: 10px 30px; /* Increased padding */
            transition: background-color 0.3s, transform 0.3s; /* Smooth transition */
        }

        .btn-primary:hover {
            background-color: #0056b3;
            transform: scale(1.05); /* Slightly enlarge on hover */
        }


        .navbar-brand img {
            height: 40px; /* Set the height of the logo */
            width: auto; /* Maintain aspect ratio */
        }

      /* Cool glowing effect for the name */
      .cool-text {
          font-size: 2rem; /* Adjust font size */
          font-weight: bold;
          color: #fff;
          text-transform: uppercase;
          letter-spacing: 2px;
          text-shadow: 0 0 5px rgba(0, 255, 255, 0.8), 0 0 10px rgba(0, 255, 255, 0.8), 0 0 15px rgba(0, 255, 255, 0.8), 0 0 20px rgba(0, 255, 255, 0.8);
          animation: neonGlow 1.5s ease-in-out infinite alternate;
      }

      @keyframes neonGlow {
          0% {
              text-shadow: 0 0 5px rgba(0, 255, 255, 0.8), 0 0 10px rgba(0, 255, 255, 0.8), 0 0 15px rgba(0, 255, 255, 0.8), 0 0 20px rgba(0, 255, 255, 0.8);
          }
          100% {
              text-shadow: 0 0 10px rgba(0, 255, 255, 1), 0 0 20px rgba(0, 255, 255, 1), 0 0 30px rgba(0, 255, 255, 1), 0 0 40px rgba(0, 255, 255, 1);
          }
      }



        }
    </style>
</head>
<body>

    <!-- Navbar Section -->
    <nav class="navbar navbar-expand-lg navbar-light">

        <button class="menu-icon" type="button" data-toggle="collapse" data-target="#sidebar">
            &#9776;
        </button>
        <div class="logo-container">
            <img src="logo.png" alt="Marg ERP Logo" height="40">
        </div>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                 <li class="nav-item">
                     <h5 class="cool-text">hello ${dto.getContactPerson()} </h5>
                 </li>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="fetchDto?eMail=${dto.getEMail()}">UpdateProfile</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contact</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="home">LogOut</a>
                </li>
            </ul>
        </div>
    </nav>


    <!-- Sidebar inside Header -->
    <div class="collapse" id="sidebar">
        <div class="offcanvas">
            <h5>Menu</h5>
            <a href="createstock">Create Stock</a>
            <a href="getallstocks">View Stock</a>
            <a href="generatebill">Vendor Sales Bill</a>
        </div>
    </div>


    <!-- Hero Section -->
    <div class="hero-section">
        <h1>Welcome Again</h1>
        <p>We provide innovative solutions that help businesses grow and succeed in a rapidly changing world. Join us today to explore endless possibilities.</p>
    </div>




<footer>
                <p>&copy; 2025 X-workz Medi Sales. All rights reserved. <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
        </footer>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        function updateDateTime() {
            const now = new Date();
            const timeOptions = { hour: '2-digit', minute: '2-digit', second: '2-digit', hour12: true };
            const dateOptions = { year: 'numeric', month: 'long', day: 'numeric' };
            document.getElementById('currentTime').innerText = now.toLocaleTimeString('en-US', timeOptions);
            document.getElementById('currentDate').innerText = now.toLocaleDateString('en-US', dateOptions);
        }
        updateDateTime();
        setInterval(updateDateTime, 1000); // Update every second
    </script>


</body>
</html>
