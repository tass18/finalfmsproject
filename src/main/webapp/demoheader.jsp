<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JFSD DEMO PROJECT</title>
    <style>
        
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        /* Header Styling */
        h2 {
            text-align: center;
            color: #705C53;
            font-size: 24px; /* Smaller font size */
            margin-top: 10px;
            margin-bottom: 10px;
            
        }

        /* Navigation styling */
        .nav-container {
            text-align: center;
            background-color: #705C53;
            padding: 15px 0;
            margin-top: 5px;
        }

        .nav-container a {
            text-decoration: none;
            color: white;
            font-size: 18px;
            margin: 0 15px;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .nav-container a:hover {
            background-color: #B7B7B7;
        }

        /* Main content container */
        .content-container {
            margin-top: 30px;
            text-align: center;
        }
    </style>
</head>
<body>
    <h2>Farmer Management System</h2>
    <div class="nav-container">
        <a href="/home">Home</a>
        <a href="login">Farmer Login</a>
        <a href="userlogin">User Login</a>
        <a href="register">Farmer Register</a>
        <a href="userregister">User Register</a>
    </div>

    <!-- You can add more content here as necessary -->
</body>
</html>
