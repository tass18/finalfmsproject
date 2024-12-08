<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ADMIN | VIEW ALL FARMERS</title>
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
            margin: 20px 0;
        }

        table {
            width: 90%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #FFFFFF;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #705C53;
            color: #FFFFFF;
        }

        tr:nth-child(even) {
            background-color: #F9F9F9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .image-cell img {
            width: 50px;
            height: auto;
            object-fit: cover;
        }

        .state {
            font-weight: bold;
            color: #705C53;
        }

        .main-content {
            margin-top: 60px; /* Adjust for fixed navbar height */
        }
    </style>
</head>
<body>
    <%@ include file="adminnavbar.jsp" %>
    <div class="main-content">
        <h3>View All Products</h3>
        <table>
            <thead>
                <tr>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Specification</th>
                    <th>Type</th>
                    <th>Price</th>
                    <th>Contact</th>
                    <th>Date</th>
                    <th>State</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${productslist}" var="product">
                    <tr>
                        <td class="image-cell">
                            <c:choose>
                                <c:when test="${not empty product.image}">
                                    <img src="${product.image}" alt="Product Image" />
                                </c:when>
                                <c:otherwise>
                                    <!-- Leave it empty or display a default placeholder -->
                                    <span>No Image</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td><c:out value="${product.name}" /></td>
                        <td><c:out value="${product.specification}" /></td>
                        <td><c:out value="${product.type}" /></td>
                        <td><c:out value="${product.price}" /></td>
                        <td><c:out value="${product.contact}" /></td>
                        <td><c:out value="${product.date}" /></td>
                        <td class="state"><c:out value="${product.location}" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
