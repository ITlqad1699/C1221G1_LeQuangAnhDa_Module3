<%--
  Created by IntelliJ IDEA.
  User: lqad1
  Date: 4/16/2022
  Time: 2:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Create New User</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <style>
        input {
            border-radius: 5px;
        }

        div {
            width: 300px;
        }

        table {
            border-radius: 10px;
        }
    </style>
</head>
<body>
<center>
    <div align="center">
        <a href="/users">
            <button type="button" class="btn btn-light">Back to List</button>
        </a>
        <div align="center">
            <form method="post">
                <caption>
                    <h2>Add New User</h2>
                </caption>
                <button type="submit" class="btn btn-primary">Create User</button>
                <table border="1" cellpadding="5" class="table table-info">
                    <tbody>
                    <tr>
                        <th>User Name</th>
                        <td>
                            <input type="text" name="name" id="name" size="45">
                        </td>
                        <p style="color:red">${erro.get("name")}</p>
                    </tr>
                    <tr>
                        <th>Email</th>
                        <td>
                            <input type="text" name="email" id="email" size="45">
                        </td>
                        <p style="color:red">${erro.get("email")}</p>
                    </tr>
                    <tr>
                        <th>Country</th>
                        <td>
                            <input type="text" name="country" id="country" size="45">
                        </td>
                        <p style="color:red">${erro.get("country")}</p>
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
