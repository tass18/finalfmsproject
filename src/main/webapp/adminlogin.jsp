<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PRO'FX - Admin Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
      /* Reset CSS */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to bottom right, #8E44AD, #16A085);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
        }

        header {
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
            background-color: white;
        }

        .content-wrapper {
            margin-top: 70px; /* Adjust to match the height of the header */
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            min-height: calc(100vh - 70px); /* Full viewport minus header height */
        }

        .login-wrapper {
            display: flex;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            max-width: 800px;
            width: 100%;
        }

        .illustration {
            background: #f7f7f7;
            padding: 30px;
            display: flex;
            justify-content: center;
            align-items: center;
            flex: 1;
        }

        .illustration img {
            max-width: 100%;
            height: auto;
        }

        .login-content {
            padding: 40px;
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .login-content h1 {
            margin-bottom: 20px;
            color: #333;
        }

        .input-group {
            margin-bottom: 20px;
        }

        .input-group label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }

        .input-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 6px;
        }

        .login-btn {
            background: #6C5CE7;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            margin-top: 10px;
        }

        .login-btn:hover {
            background: #5a4fcf;
        }

        .forgot-link {
            margin-top: 20px;
            text-align: center;
            color: #6C5CE7;
            text-decoration: none;
        }

        .forgot-link:hover {
            text-decoration: underline;
        }

        .login-footer {
            margin-top: 20px;
            text-align: center;
            font-size: 12px;
            color: #aaa;
        }
    </style>
</head>
<body>
    <header>
        <%@ include file="demoheader.jsp" %>
    </header>
    <div class="content-wrapper">
        <div class="login-wrapper">
            <div class="illustration">
                <img src="https://static.vecteezy.com/system/resources/previews/020/101/791/non_2x/admin-login-blue-gradient-concept-icon-administrator-account-learning-management-system-access-abstract-idea-thin-line-illustration-isolated-outline-drawing-vector.jpg" alt="Login Illustration">
            </div>
            <div class="login-content">
                <h1>Login as Admin</h1>
                <form method="post" action="/checkadminlogin">
                    <div class="input-group">
                        <label for="admin-username">Username</label>
                        <input 
                            type="text" 
                            id="admin-username" 
                            name="admin-username" 
                            placeholder="Enter your username" 
                            pattern="[a-zA-Z0-9]+" 
                            title="Username should be alphanumeric only." 
                            maxlength="20" 
                            required 
                            autocomplete="off" 
                            aria-label="Enter your username">
                    </div>
                    <div class="input-group">
                        <label for="admin-password">Password</label>
                        <input 
                            type="password" 
                            id="admin-password" 
                            name="admin-password" 
                            placeholder="Enter your password" 
                            minlength="8" 
                            title="Password must be at least 8 characters long." 
                            required 
                            autocomplete="off" 
                            aria-label="Enter your password">
                    </div>
                    <button type="submit" class="login-btn">LOG IN</button>
                </form>
                <a href="mailto:2200032786@kluniversity.in" class="forgot-link">Forgot your password? Mail to 2200032786@kluniversity.in</a>
                <div class="login-footer">
                    Terms of use. Privacy policy.
                </div>
            </div>
        </div>
    </div>
</body>
</html>
