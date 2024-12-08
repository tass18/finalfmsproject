<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>USER | VIEW ALL PRODUCTS</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #F5F5F7;
        }

        h3 {
            text-align: center;
            color: #705C53;
            margin-top: 20px;
        }

        .main-content {
            margin-left: 250px;
            padding: 20px;
        }

        form {
            text-align: center;
            margin: 20px;
        }

        label {
            font-size: 14px;
            margin-right: 10px;
        }

        select {
            padding: 5px;
            font-size: 14px;
            width: 200px;
            margin-right: 10px;
        }

        button {
            padding: 6px 15px;
            font-size: 14px;
            background-color: #705C53;
            color: white;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background-color: #B7B7B7;
        }

        .card-container {
            display: flex;
            flex-direction: column;
            gap: 20px;
            margin-top: 20px;
        }

        .card {
            display: flex;
            align-items: center;
            background-color: #FFFFFF;
            border: 1px solid #B7B7B7;
            border-radius: 8px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            padding: 10px;
            gap: 15px;
        }

        .card img {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border-radius: 8px;
        }

        .card-content {
            display: flex;
            flex-direction: column;
            gap: 10px;
            flex: 1;
        }

        .card-details {
            font-size: 14px;
            color: #333;
        }

        .card-details p {
            margin: 0;
        }

        .card-actions {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .card-actions button {
            padding: 8px 20px;
            font-size: 14px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .card-actions button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <%@ include file="usernavbar.jsp" %>
    <div class="main-content">
        <h3>View All Products</h3>
        <form action="/filterproducts" method="get">
            <label for="specification">Filter by Specification:</label>
            <select id="specification" name="specification" required>
                <option value="">SELECT SPECIFICATION</option>
                <option value="vegetables">Vegetables</option>
                <option value="dairy_products">Dairy Products</option>
                <option value="organic_waste">Organic Waste</option>
            </select>
            <button type="submit">Filter</button>
        </form>

        <div class="card-container">
            <c:forEach items="${productslist}" var="product">
                <div class="card">
                   <img src="${product.image}" alt="Product Image">
                    <div class="card-content">
                        <div class="card-details">
                            <p><b>Product Name:</b> <c:out value="${product.name}" /></p>
                            <p><b>Specification:</b> <c:out value="${product.specification}" /></p>
                            <p><b>Type:</b> <c:out value="${product.type}" /></p>
                            <p><b>Price:</b> <c:out value="${product.price}" /></p>
                            <p><b>Location:</b> <c:out value="${product.location}" /></p>
                            
                            <p><b>Farmer Contact:</b> <c:out value="${product.contact}" /></p>
                        </div>
                    </div>
                    <div class="card-actions">
                        <form action="/productdetails" method="get">
                            <input type="hidden" name="productId" value="${product.id}" />
                            <button type="submit">View</button>
                        </form>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
