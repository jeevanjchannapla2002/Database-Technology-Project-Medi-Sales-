<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)),
                                    url('https://img.freepik.com/premium-photo/stethoscope-blue-background-medical-concept-generative-ai_634053-8050.jpg'); /* Background image */
                        background-size: cover;
                        background-position: center;
                        background-attachment: fixed;
                        min-height: 100vh; /* Ensure the body takes up at least the full height of the viewport */
                        display: flex;
                        flex-direction: column;
                        margin: 0; /* Remove any default margin */
            background-color: #f8f9fa;
        }



        .footer {
            background-color: black;
            color: white;
            padding: 30px 0;
            text-align: center;
            width: 100%;
            display: flex;
            justify-content: space-between; /* Align items to the sides */
            align-items: center; /* Center items vertically */
            padding: 20px; /* Adjust padding */
        }

         .form-container {
           border: 2px solid #007bff;
           padding: 20px;
           border-radius: 25px;
           background-color: transparent; /* Semi-transparent white */
           color: white; /* Text color */
           max-width: 500px;
           margin: 0 auto;
           padding: 25px;
           box-shadow: 0 4px 8px rgba(255, 255, 255, 0.3); /* Subtle white shadow */
           margin-bottom:-5px;
           margin-top: -30px;
        }



        .forgot-password {
            display: block;
            margin-top: 10px;
            text-align: center;
        }
        .message {
                    color: green;
                    font-weight: bold;
                    text-align: center;
                    margin-top: 10px;
                    }
        .error-message {
               color: red;
            font-weight: bold;
            text-align: center;
            margin-top: 10px;
        }

        header {
                    background: rgba(173, 216, 230, 0.9) !important;;
                    color: black;
                    padding: 0.5rem 0;
                    text-align: center;
                }
                header h1 {
                    margin: 0;
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
                    margin-top: 0.9rem;
                }
                footer a {
                    color: #fff;
                    text-decoration: none;
                }
                footer a:hover {
                    text-decoration: underline;
        }

                       .box-heading {
                                   display: inline-block;
                                   background-color: black;
                                   color: white;
                                   padding: 5px 15px;
                                   border-radius: 20px;
                                   max-width: 500px;
                                   max-height: 50px;
                                   text-align: center;
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

<!-- Main Content Section -->
<div class="container mt-5">
    <div class="form-container">
        <div class="text-center">
                        <h2 class="box-heading">Forgot-password</h2>
        </div>
        <h2 class="message">${valid}</h2>
        <h2 class="error-message">${Invalid}</h2>
        <form action="forgot-password" >
            <div class="form-row">
                <div class="form-group col-md-12">
                    <label for="email">Email:</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="Enter Registered Email" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-12">
                    <label for="newPassword">New Password:</label>
                    <input type="password" class="form-control" id="newPassword" name="newPassword" placeholder="Set new password" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-12">
                    <label for="confirmPassword">Confirm Password:</label>
                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="confirm new password" required>
                </div>
            </div>

            <button type="submit" class="btn btn-success btn-block">Reset Password</button>
            <a href="signIn" class="btn btn-link forgot-password">Back to Login</a>
        </form>
    </div>
</div>
<br>

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

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
