<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script>
        function validatePasswords() {
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;

            if (password !== confirmPassword) {
                alert("Passwords do not match.");
                return false;
            }
            return true;
        }
    </script>
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

    .profile-photo {
        position: absolute;
        right: 1rem;  /* Moves the image to the far right */
        top: 50%;  /* Vertically centers the image */
        transform: translateY(-50%);  /* Adjusts the vertical centering */
        border-radius: 50%;  /* Makes the image circular */
        height: 55px;
        width: 50px;
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


         .form-container {
           border: 2px solid #007bff;
           padding: 20px;
           border-radius: 15px;
           background-color: transparent; /* Semi-transparent white */
           color: white;
           max-width: 1000px;
           margin: 0 auto;
           padding: 40px;
           box-shadow: 0 4px 8px rgba(255, 255, 255, 0.3); /* Subtle white shadow */
        }

    .box-heading {
    display: inline-block; /* Allows the heading to fit inside the box */
    background-color: #007bff; /* Background color of the box */
    color: white; /* Text color */
    padding: 10px 20px; /* Padding inside the box */
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

        .form-row .form-group {
            margin-bottom: 1rem;
        }

        .error-message {
            color: red;
            font-weight: bold;
            margin-top: 10px;
        }
        .field-error {
            color: red;
            font-size: 0.9rem;
        }
        .msg{
        color: green;
        font-weight: bold;
        }




    </style>
</head>
<body>



<!-- Navbar Section (Moved after header) -->
<header>
        <div class="logo-container">
            <img src="logo.png" alt="Marg ERP Logo" height="40">
        </div>
    <h1>X-workz Medi Sales</h1>
    <nav>
        <a onclick="window.history.back();">Home</a>
        <a href="#">About Us</a>
        <a href="#">Contact</a>
    </nav>
    <img src="view/${dto.getPhoto()}" alt="User Image" class="profile-photo" />
</header>





<!-- Main Content Section -->
<div class="container mt-5">
    <div class="form-container">
        <div class="center-container">
            <h2 class="box-heading">Update Profile</h2>
        </div>
        <h5 class="msg">${Successful}</h5>
        <h5 class="error-message">${key}</h5>
        <form action="update" method="post" enctype="multipart/form-data">
            <!-- Row for First and Last Name -->

                <div class="form-group col-md-6">
                    <label for="contactPerson">Contact Person *</label>
                    <input type="text" class="form-control" id="contactPerson" name="contactPerson" style="color=black" value="${dto.getContactPerson()}" >
                    <span class="field-error">${contactPersonError}</span>
                </div>
            <div class="form-row">
                 <input type="text" class="form-control" id="id" name="id" value="${dto.getId()}" hidden>

                <div class="form-group col-md-6">
                    <label for="companyName">Company Name *</label>
                    <input type="text" class="form-control" id="companyName" name="companyName" style="color=black" value="${dto.getCompanyName()}" >
                    <span class="field-error">${companyNameError}</span>
                </div>
                <div class="form-group col-md-6">
                       <label for="businessType">Business Type *</label>
                       <select class="form-control" id="businessType" name="businessType" >
                           <option value="${dto.getBusinessType()}"> ${dto.getBusinessType()}</option>
                                <option value="retail">Retail</option>
                                <option value="wholesale">Wholesale</option>
                                <option value="services">Services</option>
                       </select>
                       <span class="field-error">${businessTypeError}</span>
                   </div>
            </div>

            <!-- Row for Email fields -->
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="eMail">Email:</label>
                    <input type="email" class="form-control" id="eMail" name="eMail" value="${dto.getEMail()}" >
                    <span class="field-error">${emailError}</span>
                </div>
                <div class="form-group col-md-6">
                    <label for="contact">Contact Number:</label>
                    <input type="tel" class="form-control" id="contact" name="contact" value="${dto.getContact()}">
                    <span class="field-error">${contactError}</span>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="address1">Address1 *</label>
                    <input type="text" class="form-control" id="address1" name="address1" value="${dto.getAddress1()}" >
                    <span class="field-error">${address1Error}</span>
                </div>
                <div class="form-group col-md-6">
                    <label for="address2">Address2 *</label>
                    <input type="text" class="form-control" id="address2" name="address2" value="${dto.getAddress2()}" >
                    <span class="field-error">${address2Error}</span>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="pincode">Address1 *</label>
                    <input type="text" class="form-control" id="pincode" name="pincode" value="${dto.getPincode()}" >
                    <span class="field-error">${pincodeError}</span>
                </div>
                <div class="form-group col-md-6">
                    <label for="referral">Referral (Optional)</label>
                    <input type="text" class="form-control" id="referral" name="referral" value="${dto.getReferral()}" >
                </div>
            </div>


           <input type="file" name="profilePhoto" accept="image/*" />

           <!-- Row for Password fields -->
           <div class="form-row">
               <div class="form-group col-md-6">

                   <input type="password" class="form-control" id="password" name="password" hidden value="${dto.getPassword()}">
                   <span class="field-error">${passwordError}</span>
               </div>
               <div class="form-group col-md-6">

                   <input type="password" class="form-control" id="confirmPassword" hidden name="confirmPassword" value="${dto.getConfirmPassword()}">
                   <span class="field-error">${confirmPasswordError}</span>
               </div>

           </div>

            <input type="submit" value="Update" class="btn btn-success btn-block"></input>
        </form>
    </div>
</div>
<br>

<!-- Footer Section -->
<footer>
                <p>&copy; 2025 X-workz Medi Sales. All rights reserved. <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
        </footer>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
