<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ include file="demoheader.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PRO'FX - Farmer Registration</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        
        .farmer-registration-page {
            font-family: Arial, sans-serif;
            background-color: #F5F5F7;
            margin-top: 20px; /* Ensures no overlap with the header */
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: calc(100vh - 60px); /* Subtract header height */
            padding: 20px;
        }

        .farmer-registration-page .container {
            display: flex;
            background-color: #FFFFFF;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
            max-width: 800px;
            width: 100%;
        }

        .farmer-registration-page .form-container {
            padding: 30px;
            flex: 1;
        }

        .farmer-registration-page .form-container h2 {
            margin-bottom: 15px;
            color: #705C53;
            font-size: 18px;
        }

        .farmer-registration-page .form-group {
            margin-bottom: 15px;
        }

        .farmer-registration-page .form-group label {
            display: block;
            margin-bottom: 4px;
            color: #B7B7B7;
            font-size: 14px;
        }

        .farmer-registration-page .form-group input,
        .farmer-registration-page .form-group select {
            width: 100%;
            padding: 8px;
            border: 1px solid #B7B7B7;
            border-radius: 4px;
            font-size: 14px;
        }

        .farmer-registration-page .form-group input:focus,
        .farmer-registration-page .form-group select:focus {
            outline: none;
            border-color: #705C53;
        }

        .farmer-registration-page .register-button {
            width: 100%;
            padding: 8px;
            background-color: #705C53;
            border: none;
            border-radius: 4px;
            color: #FFFFFF;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .farmer-registration-page .register-button:hover {
            background-color: #B7B7B7;
        }

        .farmer-registration-page .forgot-link {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #705C53;
            text-decoration: none;
            font-size: 14px;
        }

        .farmer-registration-page .forgot-link:hover {
            text-decoration: underline;
        }

        .farmer-registration-page .image-container {
            flex: 1;
            background: url('https://i.pinimg.com/originals/03/7e/68/037e68e1413888bb6173153ac61eb5ee.jpg') no-repeat center center;
            background-size: cover;
        }

        @media (max-width: 768px) {
            .farmer-registration-page .container {
                flex-direction: column;
            }
        }
    
    </style>
</head>
<body>
    <div class="farmer-registration-page">
        <div class="container">
            <div class="form-container">
                <h2>Farmer Registration</h2>
                <div class="checklogin">
                    <c:if test="${not empty message}">
                        <p class="error-message"><c:out value="${message}" /></p>
                    </c:if>
                </div>
                <form action="/checkfarmerregister" method="POST" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="name"><i class="fas fa-user"></i> Name</label>
                        <input type="text" id="name" name="name" required pattern="[A-Za-z\s]+" title="Only letters and spaces are allowed">
                    </div>
                    <div class="form-group">
                        <label for="phone"><i class="fas fa-phone"></i> Phone</label>
                        <input type="text" id="phone" name="phone" required pattern="[0-9]{10}" title="Enter a 10-digit phone number">
                    </div>
                    <div class="form-group">
                        <label for="username"><i class="fas fa-user"></i> Username</label>
                        <input type="text" id="username" name="username" required minlength="5" maxlength="15" pattern="[A-Za-z0-9_]+" title="Only letters, numbers, and underscores are allowed">
                    </div>
                    <div class="form-group">
                        <label for="email"><i class="fas fa-mail"></i> Email</label>
                        <input type="email" id="email" name="email" required title="Enter a valid email address">
                    </div>
                    <div class="form-group">
                        <label for="password"><i class="fas fa-lock"></i> Password</label>
                        <input type="password" id="password" name="password" required minlength="8" title="Password must be at least 8 characters long">
                    </div>
                    <div class="form-group">
                        <label for="address"><i class="fas fa-home"></i> Address</label>
                        <input type="text" id="address" name="address" required title="Enter your full address">
                    </div>
                    <div class="form-group">
                        <label for="state"><i class="fas fa-map-marker-alt"></i> State</label>
                        <label for="state">State:</label>
            		<select id="state" name="state" required>
                <option value="">Select State</option>
                <option value="Andhra Pradesh">Andhra Pradesh</option>
                <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                <option value="Assam">Assam</option>
                <option value="Bihar">Bihar</option>
                <option value="Chhattisgarh">Chhattisgarh</option>
                <option value="Goa">Goa</option>
                <option value="Gujarat">Gujarat</option>
                <option value="Haryana">Haryana</option>
                <option value="Himachal Pradesh">Himachal Pradesh</option>
                <option value="Jharkhand">Jharkhand</option>
                <option value="Karnataka">Karnataka</option>
                <option value="Kerala">Kerala</option>
                <option value="Madhya Pradesh">Madhya Pradesh</option>
                <option value="Maharashtra">Maharashtra</option>
                <option value="Manipur">Manipur</option>
                <option value="Meghalaya">Meghalaya</option>
                <option value="Mizoram">Mizoram</option>
                <option value="Nagaland">Nagaland</option>
                <option value="Odisha">Odisha</option>
                <option value="Punjab">Punjab</option>
                <option value="Rajasthan">Rajasthan</option>
                <option value="Sikkim">Sikkim</option>
                <option value="Tamil Nadu">Tamil Nadu</option>
                <option value="Telangana">Telangana</option>
                <option value="Tripura">Tripura</option>
                <option value="Uttar Pradesh">Uttar Pradesh</option>
                <option value="Uttarakhand">Uttarakhand</option>
                <option value="West Bengal">West Bengal</option>
                <!-- Add other states/UTs as needed -->
            </select>
			<div class="form-group">
                        <label for="image"><i class="fas fa-image"></i>ImageURL</label>
                        <input type="text" id="ImageURl" name="image" required title="Enter your full URL">
                    </div>

                    </div>
                    
                    <button type="submit" class="register-button">Register</button>
                </form>
                <a href="login" class="forgot-link">Already have an account? Sign In</a>
            </div>
            <div class="image-container"></div>
        </div>
    </div>
</body>
</html>
