<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PRO'FX - Registration</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        .registration-page {
            font-family: Arial, sans-serif;
            background-color: #F5F5F7;
            margin-top: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: calc(100vh - 60px);
            padding: 20px;
        }

        .registration-page .container {
            display: flex;
            background-color: #FFFFFF;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
            max-width: 800px;
            width: 100%;
        }

        .registration-page .form-container {
            padding: 30px;
            flex: 1;
        }

        .registration-page .form-container h2 {
            margin-bottom: 15px;
            color: #705C53;
        }

        .registration-page .form-group {
            margin-bottom: 15px;
        }

        .registration-page .form-group label {
            display: block;
            margin-bottom: 4px;
            color: #B7B7B7;
            font-size: 14px;
        }

        .registration-page .form-group input {
            width: 100%;
            padding: 8px;
            border: 1px solid #B7B7B7;
            border-radius: 4px;
            font-size: 14px;
        }

        .registration-page .form-group input:focus {
            outline: none;
            border-color: #705C53;
        }

        .registration-page .form-group input::placeholder {
            color: #B7B7B7;
            opacity: 0.8;
        }

        .registration-page .register-button {
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

        .registration-page .register-button:hover {
            background-color: #B7B7B7;
        }

        .registration-page .forgot-link {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #705C53;
            text-decoration: none;
            font-size: 14px;
        }

        .registration-page .forgot-link:hover {
            text-decoration: underline;
        }

        .registration-page .image-container {
            flex: 1;
            background: url('https://static.vecteezy.com/system/resources/previews/003/689/228/original/online-registration-or-sign-up-login-for-account-on-smartphone-app-user-interface-with-secure-password-mobile-application-for-ui-web-banner-access-cartoon-people-illustration-vector.jpg') no-repeat center;
            background-size: cover;
        }

        @media (max-width: 768px) {
            .registration-page .container {
                flex-direction: column;
            }
        }

        .registration-page .error-message {
            color: red;
        }
    </style>
</head>
<body>
<%@ include file="demoheader.jsp" %>

<div class="registration-page">
    <div class="container">
        <div class="form-container">
            <h2>Register as User</h2>
            <div class="checklogin">
                <c:if test="${not empty message}">
                    <p class="error-message"><c:out value="${message}" /></p>
                </c:if>
            </div>
            <form action="/checkuserregister" method="POST">
                <div class="form-group">
                    <label for="name"><i class="fas fa-user"></i> Name</label>
                    <input type="text" id="name" name="name" required minlength="3" maxlength="50" placeholder="Enter your full name">
                </div>
                <div class="form-group">
                    <label for="phone"><i class="fas fa-phone"></i> Phone</label>
                    <input type="text" id="phone" name="phone" required pattern="[0-9]{10}" placeholder="Enter 10-digit phone number">
                </div>
                <div class="form-group">
                    <label for="username"><i class="fas fa-user"></i> Username</label>
                    <input type="text" id="username" name="username" required minlength="5" maxlength="15" placeholder="Create a username">
                </div>
                <div class="form-group">
                    <label for="password"><i class="fas fa-lock"></i> Password</label>
                    <input type="password" id="password" name="password" required minlength="8" placeholder="Enter a strong password">
                </div>
                <div class="form-group">
                    <label for="address"><i class="fas fa-home"></i> Address</label>
                    <input type="text" id="address" name="address" required minlength="5" maxlength="100" placeholder="Enter your address">
                </div>
                <div class="form-group">
                    <label for="state"><i class="fas fa-map-marker-alt"></i> State</label>
                    <input type="text" id="state" name="state" required minlength="3" maxlength="50" placeholder="Enter your state">
                </div>
                <div class="form-group">
                    <label for="imageUrl"><i class="fas fa-image"></i> Profile Image URL</label>
                    <input type="url" id="imageUrl" name="imageUrl" placeholder="Enter image URL" required pattern="https?://.+">
                </div>
                <button type="submit" class="register-button">Register</button>
            </form>
            <a href="userlogin" class="forgot-link">Already have an account? Sign In</a>
        </div>
        <div class="image-container"></div>
    </div>
</div>
</body>
</html>
