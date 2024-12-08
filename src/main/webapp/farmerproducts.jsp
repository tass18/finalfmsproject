<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%@ include file="farmernavbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Products</title>
    <style>
        /* General styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #F5F5F7; /* Light background */
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #4CAF50;
            color: white;
            padding: 10px 0;
            text-align: center;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
        }

        .container {
            margin-left: 210px; /* Adjusts for the fixed navbar */
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #705C53; /* Heading color */
            margin-top: 20px;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #FFFFFF; /* Table background */
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); /* Subtle shadow */
        }

        th, td {
            padding: 15px;
            text-align: left;
            border: 1px solid #B7B7B7; /* Border color */
        }

        th {
            background-color: #705C53; /* Header background */
            color: white; /* Header text */
            font-weight: bold;
        }

        td {
            color: #705C53; /* Cell text */
        }

        /* Zebra striping for rows */
        tr:nth-child(even) {
            background-color: #EDDDE0; /* Light row background */
        }

        tr:hover {
            background-color: #B7B7B7; /* Hover effect */
            color: white; /* Hover text */
        }

        .message {
            text-align: center;
            font-size: 18px;
            color: #333;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>My Products</h2>
        <c:if test="${empty products}">
            <p>No products found.</p>
        </c:if>
        <c:if test="${not empty products}">
            <table>
                <thead>
                    <tr>
                        <th>Product Name</th>
                        <th>Type</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Location</th>
                        <th>Specification</th>
                        <th>Date</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="product" items="${products}">
                        <tr>
                            <td>${product.name}</td>
                            <td>${product.type}</td>
                            <td>${product.price}</td>
                            <td>${product.quantity}</td>
                            <td>${product.location}</td>
                            <td>${product.specification}</td>
                            <td>${product.date}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
</body>
</html>
