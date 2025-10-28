<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>tour app</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
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
        .thank-you {
            text-align: center;
            animation: fadeIn 2s ease-in-out;
        }
        .thank-you h1 {
            font-size: 3rem;
            color: #0d6efd;
            animation: pop 1.0s ease-in-out infinite;
        }
        .thank-you p {
            font-size: 1.2rem;
            color: #6c757d;
        }
        .btn-home {
                     background-color: #0d6efd;
                     color: white;
                     padding: 12px 30px;
                     border-radius: 8px;
                     font-size: 1rem;
                     text-decoration: none;
                     display: inline-block;
                      float: right;
                     margin-top: 20px;
                     transition: background-color 0.3s ease;
                 }
                 .btn-home:hover {
                     background-color: #0056b3;
                 }
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        @keyframes pop {
            0%, 100% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.1);
            }
        }
    </style>
</head>
<body>
<div class="thank-you">
    <h1>Thank You!</h1>
    <p> ${ key } Your Account Created successfully</p>
</div>
<div>
    <a href="index.jsp" class="btn-home">Go to Home Page</a>
</div>

<!-- Bootstrap JS (optional) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
