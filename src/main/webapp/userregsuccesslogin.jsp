<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="demoheader.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Success</title>
    <style>
        /* Main Body Styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        /* Content Container */
        .container {
            text-align: center;
            background-color: #FFFFFF; /* White */
            padding: 30px 50px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            width: 90%;
            margin: 30px auto; /* Centered content */
        }

        /* Heading Styles */
        h1 {
            font-size: 24px;
            color: #4CAF50; /* Success Green */
            margin-bottom: 20px;
        }

        /* Paragraph Styles */
        p {
            font-size: 18px;
            color: #555555; /* Medium Gray */
            margin-bottom: 30px;
        }

        /* Link Styling */
        a {
            text-decoration: none;
            background-color: #705C53; /* Matching the navbar background */
            color: white; /* White text */
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        a:hover {
            background-color: #B7B7B7; /* Match hover color in navbar */
        }
    </style>
</head>
<body>
    <!-- Including the demo navbar -->
    <div class="container">
        <h1>Registration Status</h1>
        <p>Your registration was successful!</p>
        <p>Thank you for registering with us.</p>
        <a href="userlogin.jsp">Click here to login</a>
    </div>
</body>
</html>
