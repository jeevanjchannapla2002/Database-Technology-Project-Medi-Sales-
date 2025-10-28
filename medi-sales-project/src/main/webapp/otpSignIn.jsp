<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
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

    header {
        background: rgba(173, 216, 230, 0.9) !important;
        color: black;
        padding: 0.5rem;
        display: flex;
        flex-direction: column;  /* Stack elements vertically */
        align-items: center;  /* Center-aligns the title and navigation */
        position: relative;  /* Allows positioning of the image */
        text-align: center;  /* Center-aligns text in the header */
    }

    header h1 {
        margin: 0;
        font-size: 30px;
        font-style: normal;
    }

    nav {
        margin-top: 0.5rem;  /* Adds space between the title and links */
    }

    nav a {
        color: black;
        text-decoration: none;
        margin: 1rem ;  /* Adds vertical space between links */
    }

    nav a:hover {
        text-decoration: underline;
    }

        footer {
                    background: black;
                    color: #fff;
                    text-align: center;
                    padding: 0.2rem 0;
                    margin-top: 8rem;
                }
                footer a {
                    color: #fff;
                    text-decoration: none;
                }
                footer a:hover {
                    text-decoration: underline;
        }

         .form-container {
           border: 2px solid #007bff;
           padding: 20px;
           border-radius: 15px;
           background-color: transparent; /* Semi-transparent white */
           color: white; /* Text color */
           max-width: 500px;
           margin: 0 auto;
           padding: 40px;
           box-shadow: 0 4px 8px rgba(255, 255, 255, 0.3); /* Subtle white shadow */
        }

            .box-heading {
            display: inline-block; /* Allows the heading to fit inside the box */
            background-color: #007bff; /* Background color of the box */
            color: white; /* Text color */
            padding: 5px 20px; /* Padding inside the box */
            border-radius: 5px; /* Rounded corners */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Optional shadow for depth */
            text-align: center; /* Center align the text */
            margin: 0 auto; /* Centers the box horizontally */

            }

            .center-container {
            display: flex; /* Enables flexbox for alignment */
            justify-content: center; /* Centers horizontally */
            align-items: center; /* Centers vertically */
            min-height: 0vh; /* Ensures full height of the viewport */
                }

        .forgot-password {
            display: block;
            margin-top: 10px;
            text-align: center;
        }

        .error-message {
            color: red;
            font-weight: bold;
            text-align: center;
            margin-top: 10px;
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
        <a href="dashboard">Home</a>
        <a href="#">About Us</a>
        <a href="#">Contact</a>
    </nav>
</header>

<div class="container mt-5">
    <div class="form-container">
        <div class="center-container">
                    <h2 class="box-heading">Reset Password</h2>
                </div>
                <br>
        <h5 class="text-center" style="color:red">Your Account has been blocked please verify and Reset password</h5>
        <form action="sendOtp" method="get" id="otpForm">
            <div class="form-row">
                <div class="form-group col-md-12">
                    <label for="email">Email:</label>
                    <input type="email" class="form-control" id="email" name="email" value="${email}" placeholder="enter registered email" required>
                </div>
                <span class="text-center" id="message"></span>
            </div>

            <div class="form-row">
                <div class="form-group col-md-12">
                    <label for="otp">Enter OTP:</label>
                    <input type="number" class="form-control" id="otp" name="otp" placeholder="enter valid otp" disabled>
                </div>
            </div>
            <button type="submit" id="submitOtpBtn" class="btn btn-success btn-block" style="display:none;">Submit OTP</button>
        </form>

        <button id="sendOtpBtn" class="btn btn-primary btn-block" onclick="otpSent()">Send OTP</button>
    </div>
</div>


<script>
    const otpSent = async () => {
        const email = document.getElementById("email").value;
        const response = await axios("http://localhost:8080/medi-sales-project/api/sendOtp/" + email);

        document.getElementById("message").innerHTML = response.data;

        document.getElementById("otp").disabled = false;
        document.getElementById("submitOtpBtn").style.display = "block";
    }
</script>

<!-- Footer Section -->
<footer>
                <p>&copy; 2025 X-workz Medi Sales. All rights reserved. <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
        </footer>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>