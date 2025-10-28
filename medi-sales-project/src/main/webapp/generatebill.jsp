<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generate Bill - MEDI-SALES</title>
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
            max-width: 1200px;
            margin: 30px auto;
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
            margin-top: 0rem;
        }
        footer a {
            color: #fff;
            text-decoration: none;
        }
        footer a:hover {
            text-decoration: underline;
        }

        /* Form Styling */
        h2 {
            margin-bottom: 20px;
            color: #0056b3;
        }

        .form-row {
            margin-top: 20px;
        }

        .form-row input, .form-row select {
            margin-bottom: 10px;
        }

        .form-btn {
            background-color: #0056b3;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }

        .form-btn:hover {
            background-color: #003d80;
        }

        /* Table Styling */
        #sales-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        #sales-table th, #sales-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        #sales-table th {
            background-color: #f5f9fa;
            font-weight: bold;
        }

        /* Max Stock Message */
        #maxStockMessage {
            font-size: 12px;
            color: blue;
            margin-top: 5px;
        }

        /* Layout Adjustment */
        .col-md-3, .col-md-2 {
            padding-right: 10px;
        }

        /* Responsiveness */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }

            .form-row {
                flex-direction: column;
            }

            .form-btn {
                width: auto;
            }
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

<div class="container">
        <!-- Sales Bill Form -->
        <form method="post" action="getBill">
            <h2 id="page-title">Vendor Sales Bill</h2>
            <h3>Billing for : ${customerName}</h3>
            <p>Address: ${address}</p>

            <div class="row form-row">
                <div class="col-md-3">
                    <select name="productName" id="productName" class="form-select" required onchange="fetchProductStock()">
                        <option value="">Select Product</option>
                        <!-- Dynamically populated product options -->
                    </select>
                </div>
                <div class="col-md-3">
                    <select name="customerName" id="customerName" class="form-select" required>
                        <option value="">Select Customer</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <input type="number" name="quantity" id="quantityEntered" class="form-control" placeholder="Quantity" required />
                    <div id="maxStockMessage"></div>
                </div>
                <div class="col-md-2">
                    <input type="number" name="gst" id="gstEntered" class="form-control" placeholder="GST (%)" required />
                </div>
                <div class="col-md-2">
                    <input type="number" name="discount" id="discountEntered" class="form-control" placeholder="Discount (%)" required />
                </div>
            </div>

            <!-- Submit Button -->
            <div class="form-row mt-3">
                <button type="submit" class="form-btn">Add</button>
                <a href="http://localhost:8080/medi-sales-project/generatePdf"> get Bill</a>
            </div>

        </form>

       <h3 class="mt-4">Sales Bill Details</h3>
               <table id="sales-table">
                   <thead>
                       <tr>
                           <th>Sl.no</th>
                           <th>Product</th>
                           <th>HSN No</th>
                           <th>Description</th>
                           <th>Exp. Date</th>
                           <th>Quantity</th>
                           <th>Mrp</th>
                           <th>GST</th>
                           <th>Discount</th>
                           <th>Total</th>
                       </tr>
                   </thead>
                  <tbody>
                      <c:forEach var="dto" items="${dtoList}" varStatus="status">
                          <tr>
                              <td>${status.index + 1}</td>
                              <td>${dto.productName}</td>
                              <td>${dto.hsn}</td>
                              <td>${dto.productCompany}</td>
                              <td>${dto.expDate}</td>
                              <td>${dto.quantity}</td>
                              <td>${dto.mrp}</td>
                              <td>${dto.gst}</td>
                              <td>${dto.discount}</td>
                              <td>${dto.totalAmount}</td>
                          </tr>
                      </c:forEach>
                  </tbody>
               </table>

               <!-- Total Amount -->
               <h4 class="mt-4 text-end">Total: ${totalAmount}</h4>

           </div>

    <!-- Footer -->
<footer>
                <p>&copy; 2025 X-workz Medi Sales. All rights reserved. <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
        </footer>

   <script>
           document.addEventListener("DOMContentLoaded", function() {
               fetchProducts();
               fetchCustomers();
           });

           function fetchProducts() {
               fetch('http://localhost:8080/medi-sales-project/api/getProducts')
                   .then(response => response.json())
                   .then(data => {
                       let selectElement = document.getElementById("productName");
                       selectElement.innerHTML = '<option value="">Select Product</option>';
                       data.forEach(product => {
                           let option = document.createElement("option");
                           option.value = product;
                           option.text = product;
                           selectElement.appendChild(option);
                       });
                   })
                   .catch(error => console.error('Error fetching products:', error));
           }

           function fetchCustomers() {
               fetch('http://localhost:8080/medi-sales-project/api/getCustomer')
                   .then(response => response.json())
                   .then(data => {
                       let selectElement = document.getElementById("customerName");
                       selectElement.innerHTML = '<option value="">Select Customer</option>';
                       data.forEach(customer => {
                           let option = document.createElement("option");
                           option.value = customer;
                           option.text = customer;
                           selectElement.appendChild(option);
                       });
                   })
                   .catch(error => console.error('Error fetching customers:', error));
           }
           function fetchProductStock() {
                                const name = document.getElementById("productName").value ;
                                console.log(name);
                                if (name) {
                                   fetch("http://localhost:8080/medi-sales-project/api/getStockByProduct?productName="+name)
                                        .then(response => response.json())
                                        .then(stock => {
                                            const maxStockMessage = document.getElementById("maxStockMessage");
                                            maxStockMessage.textContent = "Maximum quantity available is"+stock;

                                            const quantityInput = document.getElementById("quantity");
                                            quantityInput.setAttribute("placeholder", "Enter quantity (max ${stock})");
                                        })
                                        .catch(error => console.error('Error fetching product stock:', error));
                                        } else {
                                            const maxStockMessage = document.getElementById("maxStockMessage");
                                            maxStockMessage.textContent = '';

                                            const quantityInput = document.getElementById("quantity");
                                            quantityInput.setAttribute("placeholder", "Enter quantity");
                                        }
                                    }

   </script>

</body>
</html>