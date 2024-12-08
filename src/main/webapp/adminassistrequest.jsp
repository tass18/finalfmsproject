<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Assist Request</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #F5F5F7;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 20px auto;
            background-color: #FFFFFF;
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        h2,a {
            text-align: center;
            color: #705C53;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: #FFFFFF;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #B7B7B7;
        }

        th {
            background-color: #705C53;
            color: white;
        }

        td {
            color: #705C53;
        }

        tr:nth-child(even) {
            background-color: #EDDDE0;
        }

        tr:hover {
            background-color: #B7B7B7;
            color: white;
        }

        button {
            padding: 8px 12px;
            font-size: 14px;
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

        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
            padding-top: 60px;
        }

        .modal-content {
            background-color: #fefefe;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 500px;
            border-radius: 10px;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        label {
            font-size: 14px;
            color: #333;
            margin-bottom: 8px;
        }

        input, select, textarea {
            width: 98%;
            padding: 12px;
            font-size: 14px;
            border: 1px solid #DDD;
            border-radius: 5px;
            margin-bottom: 15px;
        }

        input:focus, textarea:focus, select:focus {
            border-color: #705C53;
            outline: none;
            box-shadow: 0px 0px 10px rgba(112, 92, 83, 0.2);
        }

        button.update {
            background-color: #4CAF50;
        }

        button.update:hover {
            background-color: #45a049;
        }
    </style>
<script>
    function openModal(productId, productName, productSpecification, productType, productPrice, productQuantity, productLocation, productState, productImage, productDescription) {
        document.getElementById('product_id').value = productId;
        document.getElementById('product_name').value = productName;
        document.getElementById('product_specification').value = productSpecification;
        document.getElementById('product_type').value = productType;
        document.getElementById('product_price').value = productPrice;
        document.getElementById('product_quantity').value = productQuantity;
        document.getElementById('producer_location').value = productLocation;
        document.getElementById('producer_state').value = productState;
        document.getElementById('product_images').value = productImage;
        document.getElementById('product_description').value = productDescription;

        document.getElementById('modal').style.display = "block";
    }

    function closeModal() {
        document.getElementById('modal').style.display = "none";
        // Reset the form fields after closing
        document.querySelector('#modal form').reset();
    }

    window.onclick = function(event) {
        if (event.target == document.getElementById('modal')) {
            closeModal();
        }
    }
    </script>
</head>
<body>
    <div class="container">
    	<a >GO ADMIN HOME<button onclick="window.location.href='adminhome';">HOME</button> <-Click-Here!</a>
        <h2>Admin Assist Requests</h2>
        <c:if test="${not empty products}">
            <table>
                <thead>
                    <tr>
                        <th>Product Name</th>
                        <th>Specification</th>
                        <th>Type</th>
                        <th>Price</th>
                        <th>Date</th>
                        <th>Contact</th>
                        <th>Quantity</th>
                        <th>Location</th>
                        <th>State</th>
                        <th>Image</th>
                        <th>Description</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="product" items="${products}">
                        <c:if test="${product.request == 0}">
                            <tr>
                                <td>${product.name}</td>
                                <td>${product.specification}</td>
                                <td>${product.type}</td>
                                <td>${product.price}</td>
                                 <td>${product.date}</td>
                                  <td>${product.contact}</td>
                                <td>${product.quantity}</td>
                                <td>${product.location}</td>
                                <td>${product.state}</td>
                                <td><img src="${product.image}" alt="${product.name}" width="50"></td>
                                <td>${product.description}</td>
                                <td>
                                    <button onclick="openModal('${product.id}', '${product.name}', '${product.specification}', '${product.type}', '${product.price}', '${product.quantity}', '${product.location}', '${product.state}', '${product.image}', '${product.description}')">Update</button>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <div id="modal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeModal()"></span>
                <h2>Update Product</h2>
                <form action="${pageContext.request.contextPath}/updateProduct" method="post">
                    <input type="hidden" id="product_id" name="id">
                    <label for="product_name">Product Name:</label>
                    <input type="text" id="product_name" name="name" required>

                    <label for="product_specification">Specification:</label>
                    <select id="product_specification" name="specification" required>
                        <option value="Vegetables">Vegetables</option>
                        <option value="Dairy Products">Dairy Products</option>
                        <option value="Organic Waste">Organic Waste</option>
                    </select>

                    <label for="product_type">Product Type:</label>
                    <input type="text" id="product_type" name="type" required>

                    <label for="product_price">Price (in $):</label>
                    <input type="number" id="product_price" name="price" step="0.01" required>

                    <label for="product_quantity">Quantity:</label>
                    <input type="number" id="product_quantity" name="quantity" required>

                    <label for="producer_location">Location:</label>
                    <input type="text" id="producer_location" name="location" required>

                    <label for="producer_state">State:</label>
                    <select id="producer_state" name="state" required>
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
                    </select>

                    <label for="product_images">Images:</label>
                    <input type="text" id="product_images" name="image" required>

                    <label for="product_description">Description:</label>
                    <textarea id="product_description" name="description" required></textarea>

                    <button type="submit" class="update">Update Product</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
