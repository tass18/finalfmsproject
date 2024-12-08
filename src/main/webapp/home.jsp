<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PRO'FX - Home</title>
    <!-- Embedded CSS -->
    <style>
        /* General Body Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #F5F5F7;
            margin: 0;
            padding: 0;
        }

        /* Header Section */
        header {
            background-color: #705C53;
            padding: 20px 0;
            color: #FFFFFF;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            text-align: center;
        }

        nav ul {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
        }

        nav ul li {
            margin: 0 10px;
        }

        nav ul li a {
            color: #FFFFFF;
            text-decoration: none;
            transition: color 0.3s;
        }

        nav ul li a:hover {
            color: #EDDDE0;
        }

        .hero {
            background: url('https://img.freepik.com/premium-vector/illustration-grown-rice-round-frame-japanese-style-background_180401-1404.jpg') no-repeat center center/cover;
            color: #FFFFFF;
            padding: 100px 0;
        }

        .hero h1 {
            font-size: 3rem;
            margin-bottom: 20px;
            color: #705C53;
        }

        .hero p {
            font-size: 1.25rem;
            margin-bottom: 30px;
            color: #705C53;
        }
        .hero a {
            font-size: 1.30rem;
            margin-bottom: 30px;
            color: #705C53 ;
            
            
        }

        .buttons a {
            background-color: #705C53;
            color: #FFFFFF;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            margin: 0 10px;
            transition: background-color 0.3s;
        }

        .buttons a:hover {
            background-color: #B7B7B7;
        }

        .home-section {
            padding: 40px 0;
        }

        .grid-container {
            display: flex;
            justify-content: space-between;
            gap: 20px;
            padding: 0 20px;
            flex-wrap: nowrap;
        }

        .grid-item {
            background-color: #FFFFFF;
            border: 1px solid #B7B7B7;
            border-radius: 8px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 18%; /* Ensure all 5 cards fit in a single row */
            cursor: pointer;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .grid-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .grid-item img {
            max-width: 80px;
            margin-bottom: 20px;
        }

        .grid-item h3 {
            color: #705C53;
            margin-bottom: 10px;
        }

        .grid-item p {
            color: #B7B7B7;
        }

        .grid-item a {
            text-decoration: none;
            color: inherit;
        }
          body {
            font-family: Arial, sans-serif;
            background-color: #F5F5F7;
            margin: 0;
            padding: 0;
        }

		 .four-containers {
            display: flex;
            gap: 15px;
            justify-content: space-around;
            margin: 40px 0;
            padding-left: 20px;
            padding-right: 20px;
        }

        .container-item {
            position: relative;
            flex: 1;
            height: 250px;
            border-radius: 8px;
            background-size: cover;
            background-position: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, box-shadow 0.3s;
            overflow: hidden;
        }

        .container-item:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .container-item h3 {
            position: absolute;
            bottom: 15px;
            left: 15px;
            color: #FFFFFF;
            background: rgba(0, 0, 0, 0.5);
            padding: 10px;
            border-radius: 5px;
            margin: 0;
        }
    </style>
</head>
<body>

<%@ include file="demoheader.jsp" %>

<section class="hero">
    <div class="container">
        <h1>Farming Management System</h1>
        <p>PRO'FX is a Simpler & Enhanced Farmer Management System. Explore Our Awesome <a href = "services">Services</a> Now.</p>
        <div class="buttons">
            <a href="login" class="btn">Farmer Login</a>
            <a href="userlogin" class="btn">User Login</a>
            <a href="register" class="btn">Register</a>
        </div>
    </div>
</section>

<section class="home-section">
    <div class="grid-container">
        <div class="grid-item" onclick="location.href='/adminlogin';">
            <img src="https://www.svgrepo.com/show/421614/admin-user-web.svg" alt="Admin Login">
            <h3>Admin Login</h3>
            <p>Secure admin access for management operations.</p>
        </div>
        <div class="grid-item" onclick="location.href='/services';">
            <img src="https://www.svgrepo.com/show/524608/globus.svg" alt="Services">
            <h3>Services</h3>
            <p>Providing top-notch services for your farming needs.</p>
        </div>
        <div class="grid-item" onclick="location.href='aboutus';">
            <img src="https://www.svgrepo.com/show/129388/about-us.svg" alt="About Us">
            <h3>About Us</h3>
            <p>Learn more about our mission and values.</p>
        </div>
        <div class="grid-item" onclick="location.href='feedbackus';">
            <img src="https://www.svgrepo.com/show/415812/contact-phone-talking.svg" alt="Contact Us">
            <h3>To Contact or Feedback Us</h3>
            <p>Get in touch with our support team anytime.</p>
        </div>
        <div class="grid-item" onclick="location.href='help';">
            <img src="https://www.svgrepo.com/show/415825/contact-headset-communication.svg" alt="Help 24/7">
            <h3>Help 24/7</h3>
            <p>We are available round the clock to assist you.</p>
        </div>
    </div>
    <div class="four-containers">
        <div class="container-item" style="background-image: url('https://th.bing.com/th/id/OIP.vj7u8l9tc3D0fZV5O_GwiAHaE8?rs=1&pid=ImgDetMain');">
            <h3>Sustainability</h3>
        </div>
        <div class="container-item" style="background-image: url('https://thumbs.dreamstime.com/b/doctor-writing-word-food-safety-marker-medical-concept-doctor-writing-word-food-safety-marker-medical-concept-203404540.jpg');">
            <h3>Food Safety</h3>
        </div>
        <div class="container-item" style="background-image: url('https://th.bing.com/th/id/OIP.0roWIEMjbeuBckPTM-RJbgHaE7?rs=1&pid=ImgDetMain');">
            <h3>Traceability (Future)</h3>
        </div>
        <div class="container-item" style="background-image: url('https://th.bing.com/th/id/OIP.4OWLOr6br36uKS96FSRmVQHaE8?rs=1&pid=ImgDetMain');">
            <h3>Growth Monitoring</h3>
        </div>
    </div>
</section>

</body>
</html>
