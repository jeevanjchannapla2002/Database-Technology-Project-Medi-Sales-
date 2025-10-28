<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In - Marg ERP Cloud</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
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

        .container {
                    border: 2px solid #007bff;
                    margin-top: 30px;
                    background: transperant;
                    border-radius: 10px;
                    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                    width: 1000px;
                    height: 500px;
                }

                .box-heading {
                    display: inline-block;
                    background-color: black;
                    color: white;
                    padding: 5px 15px;
                    border-radius: 20px;
                    max-width: 250px;
                    max-height: 50px;
                    text-align: center;
                }

        .form-section {
            padding: 20px;
            width: 578px;
        }

        .form-section h2 {
            font-weight: bold;
            color: #2e8155;
        }

        .form-section p {
            color: white;
            margin-top: 00px;
            text-align: center;
        }

        .form-section h3 {
            color: red;
            margin-top: 00px;
            text-align: center;
        }


        .form-section .form-control {
            border-radius: 30px;
            padding: 10px 20px;
        }

        .form-section .form-control:focus {
            box-shadow: none;
            border-color: #2e8155;
        }

        .form-section .input-group-text {
            background-color: #e9ecef;
            border-radius: 30px;
            border: none;
        }

        .btn-signin {
            background-color: #2e8155;
            color: #fff;
            font-size: 16px;
            padding: 10px;
            border-radius: 30px;
            width: 100%;
        }

        .btn-signin:hover {
            background-color: #256d48;
        }

        .form-footer {
            margin-top: 20px;
        }

        .form-footer a {
            color: #2e8155;
            font-weight: bold;
            text-decoration: none;
        }

        .form-footer a:hover {
            text-decoration: underline;
        }

        .info-section {
            padding: 80px;
            text-align: center;
            background-color: black ;
            border-radius: 10px;
            max-width: 450px;
            max-height: 500px;
            border-top-right-radius: 15px;
            border-top-left-radius: 15px;
            border-bottom-right-radius: 15px;
            border-bottom-left-radius: 15px;
        }

        .info-section img {
            max-width: 200px;
            max-height: 100px;
            margin-bottom: 20px;
        }

        .info-section h3 {
            font-weight: bold;
            color: #495057;
        }

        .info-section p {
            color: #6c757d;
        }

        header {
                            background: rgba(173, 216, 230, 0.9) !important;;
                            color: black;
                            padding: 0.5rem ;
                            text-align: center;
                        }
                        header h1 {
                            margin: 0 ;
                            font-size: 30px;
                            font-style: normal;
                        }
                        nav {
                            margin-top: 0.5rem;
                        }
                        nav a {
                            color: black;
                            text-decoration: none;
                            margin: 0 1rem;
                        }
                        nav a:hover {
                            text-decoration: underline;
                }
                footer {
                            background: black;
                            color: #fff;
                            text-align: center;
                            padding: 0.2rem 0;
                            margin-top: 4.3rem;
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
                    <a href="home">Home</a>
                    <a href="register">SignUp</a>
                    <a href="signIn">SignIn</a>
                </nav>
        </header>
    <div class="container d-lg-flex mx-auto">
        <!-- Sign In Section -->
        <div class="col-lg-6 form-section">
        <div class="text-center">
                        <h2 class="box-heading">Sign In</h2>
        </div>
            <p>Create an Account on Marg ERP Cloud</p>
            <h3 class="error-message">${notFound}</h3>
            <form action="login" method="get">
                <div class="mb-4">
                    <label for="email" class="form-label">Email ID *</label>
                    <div class="input-group">
                        <span class="input-group-text">
                            <img src="https://cdn-icons-png.flaticon.com/128/561/561127.png" alt="Logo" style="width:12px; height:12px;">
                        </span>
                        <input type="email" class="form-control" id="email" name="email" value="${email}" placeholder="Enter your Registered email" required>
                    </div>
                </div>
                <div class="mb-4">
                    <label for="password" class="form-label">Password *</label>
                    <div class="input-group">
                        <span class="input-group-text">
                            <img src="https://cdn-icons-png.flaticon.com/128/159/159604.png" alt="Logo" style="width:12px; height:12px;">
                        </span>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
                        <span class="input-group-text">
                            <i class="bi bi-eye-slash" onclick="togglePassword()"></i>
                        </span>
                    </div>
                </div>
                <div class="d-flex justify-content-between align-items-center">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="rememberMe">
                        <label class="form-check-label" for="rememberMe">Remember me</label>
                    </div>
                    <a href="forgot-password" class="text">Forgot Password?</a>
                </div>
                <button type="submit" class="btn btn-signin mt-4">SIGN IN</button>
            </form>
            <div class="form-footer text-center">
                <p>Not registered yet? <a href="register">Sign Up</a></p>
            </div>
        </div>

        <!-- Info Section with Carousel -->
<div class="col-lg-5 info-section">
    <div id="infoCarousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="5000">
        <!-- Indicators (manual navigation buttons) -->
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#infoCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1" hidden></button>
            <button type="button" data-bs-target="#infoCarousel" data-bs-slide-to="1" aria-label="Slide 2" hidden></button>
            <button type="button" data-bs-target="#infoCarousel" data-bs-slide-to="2" aria-label="Slide 3" hidden></button>
        </div>

        <!-- Slides -->
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="https://avatars.githubusercontent.com/u/48981565?v=4" class="d-block mx-auto" alt="Logo" style="max-width: 70px; margin: 20px auto;">
                <h3>Data Protection</h3>
                <p>Secured Encryption to safeguard confidential data from illegitimate access. Various firewalls to protect against potential cyber threats.</p>
            </div>
            <div class="carousel-item">
                <img src="https://cdn-icons-png.flaticon.com/512/3523/3523063.png" class="d-block mx-auto" alt="Secure Payment" style="max-width: 70px; margin: 20px auto;">
                <h3>Secure Payments</h3>
                <p>Trusted payment gateways to ensure safe and seamless transactions. Multi-layered encryption for protecting sensitive data.</p>
            </div>
            <div class="carousel-item">
                <img src="https://cdn-icons-png.flaticon.com/512/4320/4320655.png" class="d-block mx-auto" alt="Support" style="max-width: 70px; margin: 20px auto;">
                <h3>24/7 Support</h3>
                <p>Round-the-clock assistance from a dedicated team. Get expert help whenever you need it, without any delays.</p>
            </div>
        </div>

        <!-- Controls (previous and next buttons) -->
        <button class="carousel-control-prev" type="button" data-bs-target="#infoCarousel" data-bs-slide="prev" hidden>
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#infoCarousel" data-bs-slide="next" hidden>
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden" >Next</span>
        </button>
    </div>
</div>
    </div>

    <footer>
                <p>&copy; 2025 X-workz Medi Sales. All rights reserved. <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
        </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Icon -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.js"></script>
    <script>
        function togglePassword() {
            const passwordField = document.getElementById('password');
            const icon = event.target;
            if (passwordField.type === 'password') {
                passwordField.type = 'text';
                icon.classList.remove('bi-eye-slash');
                icon.classList.add('bi-eye');
            } else {
                passwordField.type = 'password';
                icon.classList.remove('bi-eye');
                icon.classList.add('bi-eye-slash');
            }
        }
    </script>
</body>
</html>
