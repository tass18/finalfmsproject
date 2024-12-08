<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Sidebar</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        /* Sidebar styling */
        .sidebar {
            height: 100vh;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #705C53;
            padding-top: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            overflow-y: auto;
        }

        .sidebar a {
            display: block;
            color: white;
            padding: 15px 20px;
            text-decoration: none;
            font-size: 18px;
            transition: background-color 0.3s;
            margin-bottom: 5px;
        }

        .sidebar a:hover {
            background-color: #B7B7B7;
        }

        /* Main content area */
        .main-content {
            margin-left: 250px; /* Match the sidebar width */
            padding: 20px;
        }

        /* Header Styling */
        .sidebar h2 {
            text-align: center;
            color: white;
            font-size: 22px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h2>User Panel</h2>
        <a href="userhome">Home</a>
        <a href="userbuyproducts">Buy Product By Specification</a>
        <a href="userbuyproductsbyname">Buy Product By Name</a>
        <a href="userviewallproducts">View All Products</a>
        <a href="userviewallfarmers">View All Farmers</a>
         <a href="#">View Orders Farmers</a>
         <a href="userupdateprofile">Profile</a>
        <a href="#">Add Card Details</a>
        <a href="#">View Expenditure(Dummy)</a>
        <a href="userlogout">Logout</a>
    </div>
</body>
</html>
