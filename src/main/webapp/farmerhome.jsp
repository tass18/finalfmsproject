<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PRO'FX | Farmer Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* General Styling */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #F5F5F7; /* Background from palette */
            display: flex;
        }

        /* Vertical Navigation Bar */
        .vertical-nav {
            width: 220px;
            height: 100vh;
            background-color: #705C53; /* Navbar color */
            color: #FFFFFF;
            padding: 20px;
            box-sizing: border-box;
        }

        .vertical-nav h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 1.5rem;
        }

        .vertical-nav a {
            display: block;
            color: #FFFFFF;
            text-decoration: none;
            padding: 10px 15px;
            margin-bottom: 15px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .vertical-nav a:hover {
            background-color: #EDDDE0; /* Hover background */
            color: #705C53; /* Hover text */
        }

        /* Main Content */
        .main-content {
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        /* Section 1: Header with Background Image */
        .header {
            background-image: url('https://th.bing.com/th/id/OIP.bb3kYwk62vbGjd_BNfS6GwHaEK?rs=1&pid=ImgDetMain');
            background-size: cover;
            background-position: center;
            height: 300px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: #705C53; /* Text color from palette */
            position: relative;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        .header::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(237, 221, 224, 0.8); /* Semi-transparent overlay */
        }

        .header h1 {
            font-size: 2.5rem;
            z-index: 1;
        }

        .header h2 {
            font-size: 2.5rem;
            z-index: 1;
        }

        /* Section 2: Features */
        .features {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            padding: 20px;
            gap: 20px;
        }

        .feature-card {
            flex: 1 1 calc(25% - 40px); /* 4 cards per row, responsive */
            background-color: #F5F5F7; /* Card background */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .feature-card:hover {
            transform: translateY(-5px);
            box-shadow: 0px 6px 10px rgba(0, 0, 0, 0.15);
        }

        .feature-card i {
            font-size: 2rem;
            color: #705C53; /* Icon color */
            margin-bottom: 15px;
        }

        .feature-card h3 {
            font-size: 1.2rem;
            color: #705C53;
            margin-bottom: 10px;
        }

        .feature-card p {
            font-size: 0.9rem;
            color: #B7B7B7; /* Text color */
            margin-bottom: 15px;
        }

        .feature-card a {
            display: inline-block;
            background-color: #705C53; /* Button color */
            color: #FFFFFF;
            text-decoration: none;
            padding: 10px 15px;
            border-radius: 5px;
            font-size: 0.9rem;
            transition: background-color 0.3s;
        }

        .feature-card a:hover {
            background-color: #EDDDE0; /* Button hover */
            color: #705C53; /* Hover text */
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .features {
                flex-direction: column;
                align-items: center;
            }

            .feature-card {
                flex: 1 1 100%;
            }

            .header h1 {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
    <%@ include file="farmernavbar.jsp" %>
    <div class="main-content">
        <div class="header">
            <h1>Welcome to PRO'FX Dashboard</h1>
            <h2>Logged as Farmer!</h2>
        </div>
        <div class="features">
            <div class="feature-card">
               <i class="fas fa-info-circle"></i>
                <h3>About Us</h3>
                <p>Click here to know about us</p>
                <p>on-click you will be logged out for authentication reasons</p>
                <a href="aboutus">About us</a>
            </div>
            <div class="feature-card">
                <i class="fas fa-envelope"></i>
                <h3>Services</h3>
                <p>You Can contact us from here for any queries.</p>
                 <p>on-click you will be logged out for authentication reasons</p>
                <a href="homeservices.jsp">Contact us</a>
            </div>
            <div class="feature-card">
               <i class="fas fa-comments"></i>
                <h3>Feedback us</h3>
                <p>Help to resolve our problems with suggestions.</p>
                 <p>on-click you will be logged out for authentication reasons</p>
                <a href="homefeedbackus.jsp">Feedback</a>
            </div>
            <div class="feature-card">
                <i class="fas fa-question-circle"></i>
                <h3>Help</h3>
                <p>24/7 available</p>
                 <p>on-click you will be logged out for authentication reasons</p>
                <a href="home247.jsp">Help</a>
            </div>
        </div>
    </div>
</body>
</html>
