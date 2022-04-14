<%--
  Created by IntelliJ IDEA.
  User: lqad1
  Date: 4/14/2022
  Time: 8:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<h1>Products</h1>
<p>
    <a href="/product?action=create">Create new product</a>
</p>
<table class="table table-bordered " style="text-align: center;width: 80%">
    <tr class="table-primary row">
        <th class="col-1">id</th>
        <th class="col-2">name</th>
        <th class="col-2">price</th>
        <th class="col-3">description</th>
        <th class="col-2">producer</th>
        <td class="col-1">Edit</td>
        <td class="col-1">Delete</td>
    </tr>
    <c:forEach var="item" items="${products}">
        <tr class="row">
            <td class="col-1">${item.id}</td>
            <td class="col-2"><a href="/product?action=view&id=${item.id}">${item.name}</a></td>
            <td class="col-2">${item.price}</td>
            <td class="col-3">${item.description}</td>
            <td class="col-2">${item.producer}</td>
            <td class="col-1"><a href="/product?action=edit&id=${item.id}">edit</a></td>
            <td class="col-1"><a href="/product?action=delete&id=${item.id}">delete</a></td>
        </tr>
    </c:forEach>
</table>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>
</html>
