<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - Marg ERP Cloud</title>
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
            margin-top: 10px;
            background: transperant;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .container {
            padding: 2rem;
            width: 1150px;
            height: 700px;
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
            max-width: 800px;
        }

        .form-section p {
            font-size: 12px;
            color: white;
            text-align: center;
        }

        .form-section .form-control {
            border-radius: 10px;
            padding: 6px 15px;
            font-size: 12px;
        }

        .form-section .input-group-text {
            border-radius: 20px;
            background-color: #e9ecef;
            padding: 5px 10px;
        }

        .btn-signup {
        background-color: #2e8155;
        color: #fff;
        font-size: 14px;
        padding: 8px 30px;
        border-radius: 20px;
        display: block; /* Make it a block-level element */
        margin: 20px auto; /* Center it horizontally */
        text-align: center;
    }

    .btn-signup:hover {
        background-color: #256d48;
    }

        .btn-signup:hover {
            background-color: #256d48;
        }

        .form-footer p {
            font-size: 12px;
        }

        .info-section {
            padding: 150px;
            text-align: center;
            background-color: black;
            color: white;
            border-radius: 10px;
            max-width: 450px;
            max-height: 600px;
            border-top-right-radius: 15px;
            border-top-left-radius: 15px;
            border-bottom-right-radius: 15px;
            border-bottom-left-radius: 15px;
        }

        .info-section img {
            max-width: 70px;
            margin-top: 125px;
            margin-bottom: 0px;
        }

        .info-section h3 {
            font-size: 16px;
            color: #fff;
        }

        .info-section p {
            font-size: 12px;
            color: #d1d1d1;
        }

        .field-error {
                    color: red;
                    font-size: 0.9rem;
        }

        .error-message {
                    color: red;
                    font-weight: bold;
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
                    margin-top: 1.1rem;
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
        <!-- Sign Up Section -->
        <div class="col-lg-7 form-section">
            <div class="text-center">
                <h2 class="box-heading">Sign Up</h2>
            </div>
            <p>Create an Account on Marg ERP Cloud</p>
            <form action="user" method="post" onsubmit="return validatePasswords()" enctype="multipart/form-data">

            <img src="view/default.jpeg" alt="User Image" hidden id="profile" class="profile-photo" height="55" width="50" />
            <div>
                <span class="form-group col-md-6" id="emailError" style="color:red"></span>
            </div>
                <div class="mb-2">
                    <label for="companyName" class="form-label">Company Name *</label>
                    <div class="input-group">
                        <span class="input-group-text"><img src="https://cdn-icons-png.flaticon.com/128/847/847969.png" alt="Logo" style="width:12px; height:12px;"></span>
                        <input type="text" id="companyName" name="companyName" class="form-control" placeholder="Enter company name" required>
                    </div>
                    <span class="field-error">${companyNameError}</span>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-2">
                        <label for="contactPerson" class="form-label">Contact Person *</label>
                        <div class="input-group">
                            <span class="input-group-text"><img src="https://cdn-icons-png.flaticon.com/128/1077/1077012.png" alt="Logo" style="width:12px; height:12px;"></span>
                            <input type="text" id="contactPerson" name="contactPerson" class="form-control" placeholder="Enter contact person" required>
                        </div>
                        <span class="field-error">${contactPersonError}</span>
                    </div>
                    <div class="col-md-6 mb-2">
                        <label for="businessType" class="form-label">Business Type *</label>
                        <div class="input-group">
                            <span class="input-group-text"><img src="https://cdn-icons-png.flaticon.com/128/3909/3909444.png" alt="Logo" style="width:12px; height:12px;"></span>
                            <select id="businessType" name="businessType" class="form-control">
                                <option selected>Select...</option>
                                <option value="retail">Retail</option>
                                <option value="wholesale">Wholesale</option>
                                <option value="services">Services</option>
                            </select>
                        </div>
                        <span class="field-error">${businessTypeError}</span>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-2">
                        <label for="contact" class="form-label">Contact Number *</label>
                        <div class="input-group">
                            <span class="input-group-text"><img src="https://cdn-icons-png.flaticon.com/128/597/597177.png" alt="Logo" style="width:12px; height:12px;"></span>
                            <input type="tel" class="form-control" id="contact" name="contact" onblur="checkPhone()" placeholder="Enter Contact Number">
                        </div>
                        <span id="field-error">${contactError}</span>
                    </div>
                    <div class="col-md-6 mb-2">
                        <label for="email" class="form-label">Registered Email *</label>
                        <div class="input-group">
                            <span class="input-group-text"><img src="https://cdn-icons-png.flaticon.com/128/561/561127.png" alt="Logo" style="width:12px; height:12px;"></span>
                            <input type="email" class="form-control" id="eMail" name="eMail" onblur="checkEmail()" placeholder="Enter Email">
                        </div>
                        <span id="field-error">${emailError}</span>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-2">
                        <label for="address1" class="form-label">Address 1 *</label>
                        <div class="input-group">
                            <span class="input-group-text"><img src="https://cdn-icons-png.flaticon.com/128/684/684908.png" alt="Logo" style="width:12px; height:12px;"></span>
                            <input type="text" id="address1" name="address1" class="form-control" placeholder="Enter address 1" required>
                        </div>
                        <span class="field-error">${address1Error}</span>
                    </div>
                    <div class="col-md-6 mb-2">
                        <label for="address2" class="form-label">Address 2 *</label>
                        <div class="input-group">
                            <span class="input-group-text"><img src="https://cdn-icons-png.flaticon.com/128/684/684908.png" alt="Logo" style="width:12px; height:12px;"></span>
                            <input type="text" id="address2" name="address2" class="form-control" placeholder="Enter address 2" required>
                        </div>
                        <span class="field-error">${address2Error}</span>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-2">
                        <label for="pincode" class="form-label">Pincode *</label>
                        <div class="input-group">
                            <span class="input-group-text"><img src="https://cdn-icons-png.flaticon.com/128/483/483345.png" alt="Logo" style="width:12px; height:12px;"></span>
                            <input type="text" id="pincode" name="pincode" class="form-control" placeholder="Enter pincode" required>
                        </div>
                        <span class="field-error">${pincodeError}</span>
                    </div>
                    <div class="col-md-6 mb-2">
                        <label for="referral" class="form-label">Referral (Optional)</label>
                        <div class="input-group">
                            <span class="input-group-text"><img src="https://cdn-icons-png.flaticon.com/128/727/727399.png" alt="Logo" style="width:12px; height:12px;"></span>
                            <input type="text" id="referral" name="referral" class="form-control" placeholder="Enter referral code">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-2">
                        <label for="password" class="form-label">Password *</label>
                        <div class="input-group">
                            <span class="input-group-text"><img src="https://cdn-icons-png.flaticon.com/128/159/159604.png" alt="Logo" style="width:12px; height:12px;"></span>
                            <input type="password" class="form-control" id="password" name="password" placeholder="Enter Password">
                            <span class="input-group-text" onclick="togglePassword('password')"><i class="bi bi-eye-slash"></i></span>
                        </div>
                        <span class="field-error">${passwordError}</span>
                    </div>
                    <div class="col-md-6 mb-2">
                        <label for="confirmPassword" class="form-label">Confirm Password *</label>
                        <div class="input-group">
                            <span class="input-group-text"><img src="https://cdn-icons-png.flaticon.com/128/159/159604.png" alt="Logo" style="width:12px; height:12px;"></span>
                            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Enter Confirm Password">
                            <span class="input-group-text" onclick="togglePassword('confirmPassword')"><i class="bi bi-eye-slash"></i></span>
                        </div>
                        <span class="field-error">${confirmPasswordError}</span>
                    </div>
                </div>
                <button type="submit" class="btn btn-signup">SIGN UP</button>
                <div class="form-footer text-center">
                    <p>Already have an account? <a href="signIn">Sign In</a></p>
                </div>
            </form>
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
    <script>

        const checkEmail= async ()=>{
        const eMail = document.getElementById("eMail").value
        console.log(eMail)
        const response = await axios("http://localhost:8080/medi-sales-project/api/checkEmail/"+eMail)
        if(response.data ==="Email Already Exists"){
            document.getElementById("emailError").innerHTML=response.data
        }
        else{document.getElementById("emailError").innerHTML= " "
        }
    }
    const checkPhone = async () => {
        const phone = document.getElementById("contact").value
        console.log(phone)
        const response = await axios("http://localhost:8080/medi-sales-project/api/checkPhone/" + phone)
        if (response.data === "PhoneNumber Already Exists") {
            document.getElementById("contactError").innerHTML = response.data
        } else {
            document.getElementById("contactError").innerHTML = " "
        }
    }
    </script>
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
</body>
</html>