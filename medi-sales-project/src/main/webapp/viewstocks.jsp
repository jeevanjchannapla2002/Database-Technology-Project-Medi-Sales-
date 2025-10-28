<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Stock - MEDI-SALES</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
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
            max-width: 1100px;
            margin: 50px auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            padding: 30px;
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
            margin-top: 6.8rem;
        }
        footer a {
            color: #fff;
            text-decoration: none;
        }
        footer a:hover {
            text-decoration: underline;
        }

        /* Table Styling */
        #user-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        #user-table th, #user-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        #user-table th {
            background-color: #f5f9fa;
            font-weight: bold;
        }
        .btn-small {
            padding: 6px 12px;
            font-size: 12px;
            color: #fff;
            background-color: #0056b3;
            border-radius: 5px;
            text-decoration: none;
        }
        .btn-small:hover {
            background-color: #003d80;
        }
        .btn-delete {
            background-color: #dc3545;
        }
        .btn-delete:hover {
            background-color: #c82333;
        }
        .btn-container {
            display: flex;  /* Using flexbox for alignment */
            gap: 10px;      /* Adds space between the buttons */
        }
        #page-title {
            font-weight: bold;          /* Makes the text bold */
            font-family: 'Segoe UI', Arial, sans-serif;  /* Custom font family */
            text-align: center;
            font-size: 28px;
            color: #0056b3;             /* You can change the color if needed */
            margin-top: 20px;           /* Adds space above the title */
            margin-bottom: 20px;        /* Adds space below the title */
        }

        /* Adjust the layout and make it mobile-friendly */
        @media (max-width: 768px) {
            .container {
                padding: 15px;
                max-width: 100%;
            }
            #user-table th, #user-table td {
                padding: 8px;
                font-size: 14px;
            }
        }
        h3 {
            font-family: 'Segoe UI', Arial, sans-serif;  /* Choose a clean font */
            font-size: 24px;                            /* Set font size */
            font-weight: bold;                          /* Make the title bold */
            color:  #0056b3;                                /* Set the text color */

            padding: 10px 20px;                         /* Add padding around the text */
            border-radius: 5px;
            margin-top: 20px;                           /* Space above the heading */
            margin-bottom: 20px;                        /* Space below the heading */
            text-transform: uppercase;                  /* Make the text uppercase */
        }

    </style>
</head>
<body>
    <!-- Header -->
    <header>
            <div class="logo-container">
                <img src="logo.png" alt="Marg ERP Logo" height="40">
            </div>
        <h1>X-workz Medi Sales</h1>
        <nav>
            <a onclick="window.history.back();">Home</a>

        </nav>
    </header>

    <!-- Container -->
    <div class="container">
        <h2 id="page-title">Stock Details</h2>

        <!-- Stock Details Table -->
        <h3>Existing Stock</h3>
        <table id="user-table">
            <thead>
                <tr id="header-row">
                    <th class="table-column" id="column-slno">Sl.no</th>
                    <th class="table-column" id="column-product-company">Product Company</th>
                    <th class="table-column" id="column-product-name">Product Name</th>
                    <th class="table-column" id="column-mrp">MRP</th>
                    <th class="table-column" id="column-hsn">HSN</th>
                    <th class="table-column" id="column-pack">Pack</th>
                    <th class="table-column" id="column-batchno">BatchNo</th>
                    <th class="table-column" id="column-mfg-date">Mfg Date</th>
                    <th class="table-column" id="column-exp-date">Exp Date</th>
                    <th class="table-column" id="column-quantity">Quantity</th>
                    <th class="table-column" id="column-rate">Rate</th>
                    <th class="table-column" id="column-discount">Discount</th>
                    <th class="table-column" id="column-action">Total Amount</th>
                </tr>
            </thead>
            <tbody id="user-table-body">
                <!-- Dynamic content using JSTL -->
                <c:forEach var="stock" items="${stockList}">
                    <tr class="user-row">
                        <td class="user-id">${stock.id}</td>
                        <td class="user-product-company">${stock.productCompany}</td>
                        <td class="user-product-name">${stock.productName}</td>
                        <td class="user-mrp">${stock.mrp}</td>
                        <td class="user-hsn">${stock.hsn}</td>
                        <td class="user-pack">${stock.pack}</td>
                        <td class="user-batchno">${stock.batchNo}</td>
                        <td class="user-mfg-date">${stock.mfgDate}</td>
                        <td class="user-exp-date">${stock.expDate}</td>
                        <td class="user-quantity">${stock.quantity}</td>
                        <td class="user-rate">${stock.rate}</td>
                        <td class="user-discount">${stock.discount}</td>
                        <td class="user-total-amount">${totalAmount}</td>
                       <!-- <td class="user-actions">
                            <div class="btn-container">
                                <a href="fetchStockDetails?id=${stock.id}" class="btn-small btn-update">Update</a>
                                <a href="deleteStock?id=${stock.id}" class="btn-small btn-delete btn-small-delete">Delete</a>
                            </div>
                        </td>-->
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 X-workz Medi Sales. All rights reserved. <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
    </footer>

</body>
</html>
