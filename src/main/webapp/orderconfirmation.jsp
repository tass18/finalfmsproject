<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #F5F5F7;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        .container {
            width: 60%;
            margin: 50px auto;
            background-color: #FFFFFF;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #4CAF50;
            font-size: 36px;
            margin-bottom: 20px;
        }

        p {
            font-size: 18px;
            color: #333;
        }

        .order-info {
            margin-top: 20px;
            font-size: 20px;
            margin-bottom: 30px;
        }

        .order-info b {
            color: #4CAF50;
        }

        .btn {
            padding: 15px 30px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
            font-size: 16px;
            margin: 10px;
        }

        .btn:hover {
            background-color: #45a049;
        }

        .send-mail-btn {
            background-color: #007BFF;
        }

        .send-mail-btn:hover {
            background-color: #0056b3;
        }

        .home-btn {
            background-color: #FF9800;
        }

        .home-btn:hover {
            background-color: #e68900;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Your Order has been Confirmed!</h2>
        <div class="order-info">
            <p><b>Order ID:</b> <span id="orderId"></span></p>  <!-- Random Order ID -->
            <p><b>Total Price:</b> ₹${order.totalAmount}</p>
        </div>
        <p>Thank you for shopping with us!</p>

        <button class="btn home-btn" onclick="window.location.href='home.jsp';">Go Home</button>
        <button class="btn send-mail-btn" onclick="sendEmail();">Send to Mail</button>
    </div>

    <script>
        function generateRandomOrderId() {
            return 'ORD' + Math.floor(Math.random() * 1000000);
        }

        window.onload = function() {
            var orderId = generateRandomOrderId();
            document.getElementById("orderId").innerText = orderId;
        };

        function sendEmail() {
            // Add email sending logic here
            alert("Email with order details sent successfully!");
        }
    </script>

</body>
</html>