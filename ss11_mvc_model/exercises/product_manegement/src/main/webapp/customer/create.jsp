<%--
  Created by IntelliJ IDEA.
  User: lqad1
  Date: 4/13/2022
  Time: 3:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Create</title>
</head>
<body>
    <h1>Create New Product</h1>
    <p>
        <c:if test='${requestScope["message"] != null}'>
            <span class="message">${requestScope["message"]}</span>
        </c:if>
    </p>
    <p>
        <a href="/products">Back to customer list</a>
    </p>
    <form method="post">
        <fieldset>
            <legend>Customer information</legend>
            <table>
                <tr>
                    <td>Name: </td>
                    <td><input type="text" name="name" id="name"></td>
                </tr>
                <tr>
                    <td>Email: </td>
                    <td><input type="number" name="price" id="price"></td>
                </tr>
                <tr>
                    <td>Address: </td>
                    <td><input type="text" name="description" id="description"></td>
                </tr>
                <tr>
                    <td>Address: </td>
                    <td><input type="text" name="producer" id="producer"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Create product"></td>
                </tr>
            </table>
        </fieldset>
    </form>
</body>
</html>
