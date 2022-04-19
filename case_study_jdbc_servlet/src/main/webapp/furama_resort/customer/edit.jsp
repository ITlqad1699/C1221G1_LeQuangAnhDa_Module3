<%--
  Created by IntelliJ IDEA.
  User: lqad1
  Date: 4/19/2022
  Time: 4:59 PM
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
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5" class="table table-light">
            <caption>
                <h2>
                    Edit User
                </h2>
            </caption>
            <c:if test="${customer != null}">
                <input type="hidden" name="id" value="<c:out value='${customer.id}' />"
                />
            </c:if>
            <tr>
                <th> Name</th>
                <td>
                    <input type="text" name="name" size="45"
                           value="<c:out value='${customer.name}' />"
                    />
                    <p style="color:red">${erro.get("name")}</p>
                </td>
            </tr>
            <tr>
                <th> Day of birth</th>
                <td>
                    <input type="text" name="birthDay" size="45"
                           value="<c:out value='${customer.birthDay}' />"
                    />
                    <p style="color:red">${erro.get("birthDay")}</p>
                </td>
            </tr>
            <tr>
                <th> Gender</th>
                <td>
                    <select name="gender">
                        <option value="1">Male</option>
                        <option value="0">Female</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>citizenId</th>
                <td>
                    <input type="text" name="citizenId" size="45"
                           value="<c:out value='${customer.citizenId}' />"
                    />
                    <p style="color:red">${erro.get("citizenId")}</p>
                </td>
            </tr>
            <tr>
                <th>numberPhone</th>
                <td>
                    <input type="text" name="numberPhone" size="15"
                           value="<c:out value='${customer.numberPhone}' />"
                    />
                    <p style="color:red">${erro.get("numberPhone")}</p>
                </td>
            </tr>
            <tr>
                <th>email</th>
                <td>
                    <input type="text" name="email" size="15"
                           value="<c:out value='${customer.email}' />"
                    />
                    <p style="color:red">${erro.get("email")}</p>
                </td>
            </tr>
            <tr>
                <th>address</th>
                <td>
                    <input type="text" name="address" size="15"
                           value="<c:out value='${customer.address}' />"
                    />
                    <p style="color:red">${erro.get("address")}</p>
                </td>
            </tr>
            <tr>
                <th>customerTypeId</th>
                <td>
                    <select name="customerTypeId">
                        <option value="1">Diamond</option>
                        <option value="2">Platinium</option>
                        <option value="3">Gold</option>
                        <option value="4">Silver</option>
                        <option value="5">Member</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save"/>
                </td>
            </tr>
        </table>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
