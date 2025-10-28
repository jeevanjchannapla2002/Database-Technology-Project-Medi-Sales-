<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Stock- MEDI-SALES</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <style>
        /* General Styling */
        body {
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)),
                        url('https://img.freepik.com/premium-photo/stethoscope-blue-background-medical-concept-generative-ai_634053-8050.jpg'); /* Background image */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: black;
            min-height: 100vh; /* Ensure the body takes up at least the full height of the viewport */
            display: flex;
            flex-direction: column;
            margin: 0; /* Remove any default margin */
        }
        .container {
           max-width: 800px;
            margin: 30px auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }


        /* Header Styling */
        header {
            background: rgba(173, 216, 230, 0.9) !important;;
            color: black;
            padding: 0.5rem ;
            text-align: center;
        }
        header h1 {
            margin: 0;
            font-size: 35px;
        }
        nav {
            margin-top: 0.2rem;
        }
        nav a {
            color: black;
            text-decoration: none;
            margin: 0 1rem;
        }
        nav a:hover {
            text-decoration: underline;
        }


        /* Footer Styling */
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

        /* Form Section */
        .form-section {
            flex: 2;
            padding: 30px 20px;
        }
        .form-section .box-heading {
            display: inline-block;
            background-color: black;
            color: white;
            padding: 5px 15px;
            border-radius: 20px;
            max-width: 250px;
            max-height: 50px;
            text-align: center;
        }
        .form-section p {
            color: white;
            text-align: center;
            font-size: 14px;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            font-size: 14px;
            font-weight: bold;
            color: #333;
            margin-bottom: 5px;
            display: block;
        }
        .form-group input,
        .form-group select {
            width: 100%;
            padding: 10px 12px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .radio-group {
            display: flex;
            gap: 10px;
        }
        .radio-group input {
            margin-top: 4px;
        }
        .radio-group label {
            font-size: 14px;
        }
        .btn {
            width: 100%;
            background-color: #0056b3;
            color: #fff;
            border: none;
            padding: 12px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #004f43;
        }
        .form-section a {
            text-decoration: none;
            color: #006b5d;
            font-weight: bold;
        }

        .container {
                    max-width: 1000px;
                    margin: 50px auto;
                    display: flex;
                    background-color: transparent;
                    border-radius: 10px;
                    box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
                    overflow: hidden;
                    color: white;
                    border: 2px solid #007bff;
                }
                .form-section {
                    flex: 4;
                    padding: 40px 30px;
                }
                .form-section h2 {
                    font-size: 26px;
                    color: #006b5d;
                    margin-bottom: 20px;
                }
                .btn {
                    width: 100%;
                    background-color:#0056b3;
                    color: #fff;
                    border: none;
                    padding: 12px;
                    font-size: 16px;
                    border-radius: 5px;
                    cursor: pointer;
                    transition: background-color 0.3s;
                }
                .btn:hover {
                    background-color: #0056b2;
                }
                .info-section {
                    flex: 2;
                    background: black;
                     padding: 130px 15px;
                    text-align: center;
                    color: white;
                    border-top-right-radius: 15px;
                    border-top-left-radius: 15px;
                    border-bottom-right-radius: 15px;
                    border-bottom-left-radius: 15px;
                }
                .info-section img {
                    width: 100px;
                    margin-bottom: 20px;
                }

        /* Toggle Password Visibility */
        .password-toggle {
            position: relative;
        }
        .password-toggle input {
            padding-right: 40px;
        }
        .password-toggle .toggle-btn {
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            cursor: pointer;
            font-size: 16px;
            color: #aaa;
        }
        .password-toggle .toggle-btn:hover {
            color: #333;
             cursor: pointer;
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
            <a onclick="window.history.back();">Home</a>

        </nav>
    </header>

    <div class="container">
        <div class="form-section">
                    <div class="text-center">
                        <h2 class="box-heading">Create Stock</h2>
                    </div>
            <p>Register Your Product on MEDI-SALES Cloud</p>
            <form action="stock" method="post" >
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="productCompany" class="form-label">Product Company *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-building"></i></span>
                            <input type="text" class="form-control" id="productCompany" name="productCompany" placeholder="Enter Product Company Name" required>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="productName" class="form-label">Product Name *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-box"></i></span>
                            <input type="text" class="form-control" id="productName" name="productName" placeholder="Enter Product Name" required>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="mrp" class="form-label">MRP *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-currency-dollar"></i></span>
                            <input type="text" class="form-control" id="mrp" name="mrp" placeholder="Amount" required>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="pack" class="form-label">Pack *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-boxes"></i></span>
                            <input type="text" class="form-control" id="pack" name="pack"  required>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="mfgDate" class="form-label">Manufacturing Date *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-calendar"></i></span>
                            <input type="date" class="form-control" id="mfgDate" name="mfgDate" required>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="expDate" class="form-label">Expiration Date *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-calendar-x"></i></span>
                            <input type="date" class="form-control" id="expDate" name="expDate" required>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="quantity" class="form-label">Quantity *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-boxes"></i></span>
                            <input type="number" class="form-control" id="quantity" name="quantity" required>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="rate" class="form-label">Rate *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-currency-dollar"></i></span>
                            <input type="text" class="form-control" id="rate" name="rate" required>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                         <label for="gst" class="form-label">Gst *</label>
                         <div class="input-group">
                             <span class="input-group-text"><i class="bi bi-currency-dollar"></i></span>
                              <input type="text" class="form-control" id="rate" name="gst" required>
                         </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="discount" class="form-label">Discount *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-percent"></i></span>
                            <input type="text" class="form-control" id="discount" name="discount" placeholder="Enter Discount in Percentage" required>
                             </div>
                    </div>
                </div>
                <button type="submit" id="submit-btn" class="btn">Register Product</button>
            </form>
        </div>
        <div class="info-section">
                    <img src="img.png" alt="Marg ERP On Cloud">
                    <h3>Secure Access</h3>
                   <p>Effortlessly manage and create stock items on Marg Cloud, track inventory levels, monitor stock movements, and streamline your business operations with real-time updates and complete control over your stock data.</p>   </div>
    </div>
<p>${success}</p>

    <footer>
        <p>&copy; 2025 X-workz Medi Sales. All rights reserved. <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
    </footer>

</body>
</html>
