<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Farmer Sidebar</title>
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
        <h2>Farmer Panel</h2>
        <a href="farmerhome">Home</a>
        <a href="farmeraddproduct">Add Products</a>
        <a href="farmerreqadding">Request Adding Product</a>
        <a href="farmerproducts">My Products</a>
        <a href="farmerupdateproduct">Update Products</a>
        <a href="farmerdeleteproduct">Delete Products</a>
        <a href="farmerviewallproducts">View All Products</a>
         <a href="farmerviewallusers">View All Users</a>
        <a href="farmerupdateprofile">Profile</a>
        <a href="#">View Income(Dummy)</a>
        <a href="farmerlogout">Logout</a>
    </div>
</body>
</html>
