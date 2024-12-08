<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 20px;
        }
        .payment-details {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 400px;
            margin: auto;
        }
        .payment-details h1 {
            font-size: 22px;
            color: #333;
        }
        .payment-details p {
            font-size: 14px;
            color: #555;
        }
        .payment-details .total-price {
            font-weight: bold;
            font-size: 18px;
            color: #333;
        }
        .payment-details button {
            background-color: #28a745;
            border: none;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            margin-top: 10px;
            cursor: pointer;
        }
        .payment-details button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<div class="payment-details">
    <h1>Payment Details</h1>
    <p><strong>Product Name:</strong> ${productName}</p>
    <p><strong>Type:</strong> ${productType}</p>
    <p><strong>Quantity:</strong> ${quantity}</p>
    <p><strong>Price per unit:</strong> ₹${price}</p>
    <p class="total-price">Total Price: ₹${totalPrice}</p>

    <!-- Display Farmer Details based on farmerId -->
    <h3>Farmer Information:</h3>
    <%
        String farmerId = request.getParameter("farmerId");
        String farmerName = "";
        String farmerContact = "";
        
        // Database connection
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fms-sdpproject", "root", "@Deepak123");
            
            String sql = "SELECT name, contact FROM farmers WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, farmerId);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                farmerName = rs.getString("name");
                farmerContact = rs.getString("contact");
            }
            
            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
    <p><strong>Name:</strong> <%= farmerName %></p>
    <p><strong>Contact:</strong> <%= farmerContact %></p>

    <!-- Payment Button -->
    <button type="submit" onclick="alert('Payment Successful!')">Proceed to Pay</button>
</div>

</body>
</html>
