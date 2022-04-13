<%--
  Created by IntelliJ IDEA.
  User: lqad1
  Date: 4/13/2022
  Time: 3:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>list</title>
</head>
<body>
    <h1>Products</h1>
    <p>
        <a href="/products?action=create">Create New Products</a>
    </p>
<table border="1px">
    <tr>
        <td>Name</td>
        <td>Price</td>
        <td>Description</td>
        <td>Producer</td>
        <td>Delete</td>
        <td>Edit</td>
    </tr>
    <c:forEach var="product" items='${requestScope["products"]}'>
        <tr>
            <td><a href="/products?action=view&id=${product.getId()}">${product.getName()}</a></td>
            <td>${product.getPrice()}</td>
            <td>${product.getDescription()}</td>
            <td>${product.getProducer}</td>
            <td><a href="/products?action=delete$id=${product.getId()}">Delete</a></td>
            <td><a href="/products?action=edit&id=${product.getId()}">Edit</a></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
