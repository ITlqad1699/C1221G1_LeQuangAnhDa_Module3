<%--
  Created by IntelliJ IDEA.
  User: lqad1
  Date: 4/12/2022
  Time: 4:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form action="/change" method="post">
    Product Description: <input type="text" name="description">
    <br>
    Price: <input type= "number" name="price">
    <br>
    Discount Percent: <input type="number" name="discount">
    <br>
    <button type="submit">Amount</button>
  </form>
  </body>
</html>
