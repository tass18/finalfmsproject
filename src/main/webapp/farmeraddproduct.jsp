<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #F5F5F7;
            margin: 0;
            padding: 0;
        }

        .container {
            margin: 20px auto;
            width: 90%;
            max-width: 800px;
            background-color: #FFFFFF;
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
            transition: all 0.3s ease;
            margin-left: 330px;
        }

        h2 {
            text-align: center;
            color: #705C53;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        label {
            font-size: 14px;
            color: #333;
            margin-bottom: 8px;
        }

        input,  textarea {
            width: 97%;
            padding: 12px;
            font-size: 14px;
            border: 1px solid #DDD;
            border-radius: 5px;
            transition: border 0.3s ease, box-shadow 0.3s ease;
        }

        select {
            width: 100%;
            padding: 12px;
            font-size: 14px;
            border: 1px solid #DDD;
            border-radius: 5px;
            transition: border 0.3s ease, box-shadow 0.3s ease;
        }

        input:focus, textarea:focus, select:focus {
            border-color: #705C53;
            outline: none;
            box-shadow: 0px 0px 10px rgba(112, 92, 83, 0.2);
        }

        input[type="number"] {
            -webkit-appearance: none;
            -moz-appearance: textfield;
        }

        button {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            background-color: #705C53;
            color: #FFFFFF;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        button:hover {
            background-color: #B7B7B7;
            transform: scale(1.05);
        }

        button:active {
            transform: scale(1.02);
        }

        .message {
            text-align: center;
            margin-top: 20px;
            color: green;
        }

        select {
            cursor: pointer;
        }

        textarea {
            resize: vertical;
        }
    </style>

    <script>
        // Function to suggest price based on specification
        function suggestPrice() {
            var specification = document.getElementById("specification").value;
            var basePrice = 0;

            // Define base prices for different specifications
            switch (specification) {
                case "Vegetables":
                    basePrice = 50; // Example base price
                    break;
                case "Dairy Products":
                    basePrice = 100;
                    break;
                case "Value Added Products":
                    basePrice = 150;
                    break;
                case "Hand loom Products":
                    basePrice = 200;
                    break;
                case "Organic Waste":
                    basePrice = 30;
                    break;
                default:
                    basePrice = 0;
                    break;
            }

            // Set the suggested price to the input field
            document.getElementById("price").value = basePrice;
        }

        // Trigger price suggestion when specification is selected
        document.addEventListener('DOMContentLoaded', function () {
            var specificationField = document.getElementById("specification");
            specificationField.addEventListener("change", suggestPrice);
        });
    </script>

</head>
<body>
    <%@ include file="farmernavbar.jsp" %>
    <div class="container">
        <h2>Register Your Product</h2>
        <form action="/farmerreqadding" method="post">
            <label for="name">Product Name:</label>
            <input type="text" id="name" name="name" required placeholder="Enter product name">

            <label for="specification">Specification:</label>
            <select id="specification" name="specification" required>
                <option value="">Select Specification</option>
                <option value="Vegetables">Vegetables</option>
                <option value="Dairy Products">Dairy Products</option>
                <option value="Value Added Products">Value Added Products</option>
                <option value="Hand loom Products">Hand loom Products</option>
                <option value="Organic Waste">Organic Waste</option>
            </select>

            <label for="type">Product Type:</label>
            <input type="text" id="type" name="type" required placeholder="Enter product type">

            <label for="price">Price (in Rs):</label>
            <input type="number" id="price" name="price" step="0.01" required placeholder="Suggested Price" readonly>

            <label for="date">Date Of Availability (as DD-MM-YYYY):</label>
            <input type="text" id="date" name="date" required placeholder="Enter product adding date">

            <label for="location">Location:</label>
            <input type="text" id="location" name="location" required placeholder="Enter your location">

            <label for="contact">Contact:</label>
            <input type="text" id="contact" name="contact" required placeholder="Enter contact details">

            <label for="state">State:</label>
            <select id="state" name="state" >
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
            </select>

            <label for="quantity">Quantity (in KG(s) & LTR(s) only):</label>
            <input type="number" id="quantity" name="quantity" required placeholder="Enter quantity">

            <label for="images">Product Image(URL):</label>
            <input type="text" id="image1" name="images" required placeholder="Enter image URL">

            <label for="images">Product Image2(URL):</label>
            <input type="text" id="image2" name="images" placeholder="Enter image URL">

            <label for="description">Product Description:</label>
            <textarea id="description" name="description" rows="5" required placeholder="Enter product description"></textarea>

            <button type="submit">Register Product</button>
        </form>
    </div>
</body>
</html>
