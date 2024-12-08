<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>USER | VIEW ALL PRODUCTS</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f7; /* Light background */
            padding-left: 250px; /* Adjusted padding for sidebar */
            box-sizing: border-box;
        }

        h3 {
            text-align: center;
            color: #705C53; /* Heading color */
            margin: 20px 0;
            font-size: 28px;
        }

        .search-bar {
            position: relative;
            margin-bottom: 15px;
            max-width: 400px;
            margin: 0 auto;
        }

        #searchInput {
            width: 100%;
            padding: 10px 40px 10px 20px; /* Add space for the icon */
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            box-sizing: border-box;
        }

        .search-icon {
            position: absolute;
            right: 25px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 18px;
            color: #aaa;
            pointer-events: none; /* Prevent the icon from blocking input clicks */
        }

        .product-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
            padding: 20px;
            max-width: 100%;
        }

        .product-card {
            width: 250px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 15px;
            text-align: center;
            transition: transform 0.2s, box-shadow 0.2s;
            margin-bottom: 20px;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        .product-card img {
            width: 100%;
            height: 150px;
            object-fit: cover;
            border-radius: 8px;
        }

        .product-info h4 {
            color: #705C53;
            font-size: 18px;
            margin: 10px 0;
            cursor: pointer;
            transition: color 0.2s;
        }

        .product-info h4:hover {
            color: #007bff; /* Blue */
        }

        .product-details {
            color: #705C53;
            margin: 10px 0;
            font-size: 14px;
        }

        .action-buttons button {
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            margin: 5px;
            width: 100%;
        }

        .buy-now {
            background-color: #28a745; /* Green */
            color: white;
        }

        .buy-now:hover {
            background-color: #218838;
        }

        .add-to-cart {
            background-color: #007bff; /* Blue */
            color: white;
        }

        .add-to-cart:hover {
            background-color: #0056b3;
        }

        /* Adjust for small screens */
        @media (max-width: 768px) {
            body {
                padding-left: 0;
            }

            .product-card {
                width: 100%;
            }
        }
    </style>
</head>

<body>
    <%@ include file="usernavbar.jsp" %>
    <div class="main-content">
        <h3>View All Products</h3>
        <div class="search-bar">
            <input type="text" id="searchInput" onkeyup="filterProducts()" placeholder="Search by Product Name">
            <span class="search-icon">&#x1F50D;</span> <!-- Unicode for magnifying glass -->
        </div>
        
        <!-- Product Cards -->
        <div id="productContainer" class="product-container">
            <c:forEach items="${productslist}" var="product">
                <div class="product-card" data-name="${product.name}">
                    <!-- Product Image -->
                    <a href="buyproduct.jsp?id=${product.id}">
                        <img src="${product.image}" alt="${product.name}">
                    </a>

                    <!-- Product Info -->
                    <div class="product-info">
                        <a href="buyproduct.jsp?id=${product.id}">
                            <h4><c:out value="${product.name}" /></h4>
                        </a>
                        <div class="product-details">
                            <p>Specification: <c:out value="${product.specification}" /></p>
                            <p>Type: <c:out value="${product.type}" /></p>
                            <p>Price: ₹<c:out value="${product.price}" /></p>
                            <p>Quantity: <c:out value="${product.quantity}" /></p>
                        </div>
                    </div>

                    <!-- Action Buttons -->
                    <div class="action-buttons">
                        <!-- Add to Cart Button -->
                        
                        <!-- Buy Now Button -->
                        <form action="productdetails" method="get" style="display: inline;">
                            <input type="hidden" name="productId" value="${product.id}" />
                            <button type="submit" class="buy-now">Buy Now</button>
                        </form>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <script>
        function filterProducts() {
            const input = document.getElementById('searchInput').value.toUpperCase();
            const cards = document.querySelectorAll('.product-card');

            cards.forEach(card => {
                const productName = card.getAttribute('data-name').toUpperCase();
                card.style.display = productName.includes(input) ? '' : 'none';
            });
        }
    </script>
</body>

</html>
	