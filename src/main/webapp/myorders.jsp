<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="usernavbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Orders</title>
</head>
<body>
    <h2>My Orders</h2>
    <c:if test="${not empty orders}">
        <table>
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Order Date</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="order" items="${orders}">
                    <tr>
                        <td>${order.id}</td>
                        <td>${order.productName}</td>
                        <td>${order.price}</td>
                        <td>${order.orderDate}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
    <c:if test="${empty orders}">
        <p>No orders found!</p>
    </c:if>
</body>
</html>
