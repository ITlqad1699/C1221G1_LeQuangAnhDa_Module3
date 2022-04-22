<%--
  Created by IntelliJ IDEA.
  User: lqad1
  Date: 4/19/2022
  Time: 10:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
<center>
    <div align="center">
        <div align="center">
            <form method="post">
                <caption>
                    <h2>Create New Customer</h2>
                </caption>
                <button type="submit" class="btn btn-primary">Create Customer</button>
                <table class="table table-info">
                    <tbody class="tbody-dark">
                    <tr>
                        <th>Name</th>
                        <td>
                            <input type="text" name="name" id="name" size="45">
                        </td>
                        <p style="color:red">${erro.get("name")}</p>
                    </tr>
                    <tr>
                        <th>Day of birth</th>
                        <td>
                            <input type="date" name="birthDay" id="birthDay" size="45">
                        </td>
                        <p style="color:red">${erro.get("birthDay")}</p>
                    </tr>
                    <tr>
                        <th>gender</th>
                        <td>
                            <select name="gender">
                                <option value="1">Male</option>
                                <option value="0">Female</option>
                            </select>
                        </td>
                        <p style="color:red">${erro.get("gender")}</p>
                    </tr>
                    <tr>
                        <th>citizen id</th>
                        <td>
                            <input type="text" name="citizenId" id="citizenId" size="45">
                        </td>
                        <p style="color:red">${erro.get("citizenId")}</p>
                    </tr>
                    <tr>
                        <th>number Phone</th>
                        <td>
                            <input type="text" name="numberPhone" id="numberPhone" size="45">
                        </td>
                        <p style="color:red">${erro.get("numberPhone")}</p>
                    </tr>
                    <tr>
                        <th>email</th>
                        <td>
                            <input type="text" name="email" id="email" size="45">
                        </td>
                        <p style="color:red">${erro.get("email")}</p>
                    </tr>
                    <tr>
                        <th>address</th>
                        <td>
                            <input type="text" name="address" id="address" size="45">
                        </td>
                        <p style="color:red">${erro.get("address")}</p>
                    </tr>
                    <tr>
                        <th>Customer Type</th>
                        <td>
                            <select name="customerTypeId">
                            <c:forEach items="${customerType}" var="customerType">
                                <option value="${customerType.customerTypeId}">
                                    ${customerType.customerType}
                                </option>
                            </c:forEach>
                            </select>
                        </td>
                            <p style="color:red">${erro.get("customerTypeId")}</p>
                    </tr>
                    <tr>
                        <th>Customer Code</th>
                        <td>
                            <input type="text" name="customerCode" id="customerCode" size="45">
                        </td>
                        <p style="color:red">${erro.get("customerCode")}</p>
                    </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
</center>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
