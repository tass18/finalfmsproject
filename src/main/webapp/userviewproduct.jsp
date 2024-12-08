<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #F5F5F7;
            margin: 0;
            padding: 0;
        }

        .container {
            display: flex;
            flex-direction: row;
            justify-content: center;
            margin-top: 50px;
            padding: 20px;
        }

        .product-image {
            max-width: 400px;
            margin-right: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        .product-details {
            max-width: 600px;
            background-color: #FFFFFF;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #705C53;
            font-size: 28px;
            margin-bottom: 20px;
        }

        .product-info {
            margin-bottom: 20px;
            font-size: 16px;
        }

        .product-info b {
            color: #4CAF50;
        }

        .product-description {
            font-size: 16px;
            color: #555;
            line-height: 1.6;
            margin-top: 20px;
        }

        .back-btn, .buy-btn {
            padding: 10px 20px;
            background-color: #705C53;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
            margin-top: 20px;
        }

        .back-btn:hover, .buy-btn:hover {
            background-color: #B7B7B7;
        }

        .quantity-input {
            margin-top: 10px;
        }

        .feedback {
            margin-top: 10px;
            font-size: 14px;
            color: #d32f2f;
        }

        /* Modal (Popup) Styles */
        .modal {
            display: none; /* Hidden by default */
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
            overflow: auto;
            padding-top: 60px;
        }

        .modal-content {
            background-color: #fefefe;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 50%;
            border-radius: 10px;
        }

        .close {
            color: #aaa;
            font-size: 28px;
            font-weight: bold;
            position: absolute;
            right: 25px;
            top: 0;
            padding: 10px;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        .modal label {
            font-size: 16px;
            margin-bottom: 5px;
            display: block;
        }

        .modal input {
            padding: 10px;
            width: 100%;
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        .modal button {
            padding: 10px 20px;
            background-color: #705C53;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
            width: 100%;
        }

        .modal button:hover {
            background-color: #B7B7B7;
        }

    </style>
    <script>
    function calculatePrice() {
        const quantityInput = document.getElementById("quantity").value;
        const pricePerUnit = parseFloat(document.getElementById("quantity").dataset.price);
        const availableQuantity = parseInt(document.getElementById("quantity").dataset.available, 10);
        const feedback = document.getElementById("feedback");
        const totalPrice = document.getElementById("totalPrice");

        if (quantityInput > availableQuantity) {
            feedback.textContent = "Quantity not available.";
            totalPrice.textContent = "";
            document.getElementById("totalPriceInput").value = "";
            document.getElementById("quantityInput").value = "";
        } else if (quantityInput > 0) {
            feedback.textContent = "";
            const total = pricePerUnit * quantityInput;
            totalPrice.textContent = "₹" + total.toFixed(2);
            document.getElementById("totalPriceInput").value = total.toFixed(2);
            document.getElementById("quantityInput").value = quantityInput;
        } else {
            feedback.textContent = "Please enter a valid quantity.";
            totalPrice.textContent = "";
            document.getElementById("totalPriceInput").value = "";
            document.getElementById("quantityInput").value = "";
        }
    }

    // Modal Logic
    var modal = document.getElementById("cardModal");
    var btn = document.getElementById("buyBtn");
    var span = document.getElementsByClassName("close")[0];

    btn.onclick = function() {
        modal.style.display = "block";
    }

    span.onclick = function() {
        modal.style.display = "none";
    }

    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
    </script>
</head>
<body>
    <%@ include file="usernavbar.jsp" %>
    
    <div class="container">
        <div class="product-image">
            <img src="${product.image}" alt="Product Image" style="width: auto; height: auto; border-radius: 10px;">
        </div>
        <div class="product-details">
            <h2>${product.name}</h2>

            <div class="product-info">
                <p><b>Specification:</b> ${product.specification}</p>
                <p><b>Type:</b> ${product.type}</p>
                <p><b>Price per Unit:</b> ₹${product.price}</p>
                <p><b>Location:</b> ${product.location}</p>
                <p><b>Available Quantity:</b> ${product.quantity}</p>
                <p><b>Contact:</b> ${product.contact}</p>
            </div>

            <div class="quantity-input">
                <label for="quantity"><b>Enter Quantity:</b></label>
                <input 
                    type="number" 
                    id="quantity" 
                    name="quantity" 
                    min="1" 
                    data-price="${product.price}" 
                    data-available="${product.quantity}" 
                    oninput="calculatePrice()" 
                    required />
            </div>
            <div id="feedback" class="feedback"></div>
            <div id="totalPrice" style="margin-top: 10px; font-size: 16px; color: #4CAF50;"></div>

            <button id="buyBtn" class="buy-btn">Buy Now</button>
            <button class="back-btn" onclick="window.history.back();">Back</button>

        </div>
    </div>

    <!-- Modal for Card Details -->
    <div id="cardModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>Enter Card Details</h2>
            <form action="orderconfirmation.jsp" method="post">
                <label for="cardNumber">Card Number</label>
                <input type="text" id="cardNumber" name="cardNumber" pattern="\d{16}" maxlength="16" placeholder="Enter 16-digit card number" required>
                
                <label for="expiry">Expiry Date (MM/YY)</label>
                <input type="text" id="expiry" name="expiry" pattern="\d{2}/\d{2}" placeholder="MM/YY" required>
                
                <label for="cvv">CVV</label>
                <input type="text" id="cvv" name="cvv" pattern="\d{3}" maxlength="3" placeholder="Enter CVV" required>
                
                <input type="hidden" name="productId" value="${product.id}">
                <input type="hidden" name="productName" value="${product.name}">
                <input type="hidden" name="totalPrice" id="totalPriceInput">
                <input type="hidden" name="quantity" id="quantityInput">
                <button type="submit">Order</button>
            </form>
        </div>
    </div>
</body>
<script>
    window.onload = function() {
        // Modal Logic
        var modal = document.getElementById("cardModal");
        var btn = document.getElementById("buyBtn");
        var span = document.getElementsByClassName("close")[0];

        btn.onclick = function() {
            modal.style.display = "block";
        }

        span.onclick = function() {
            modal.style.display = "none";
        }

        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    };
</script>
</html>
