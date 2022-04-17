<%--
  Created by IntelliJ IDEA.
  User: lqad1
  Date: 4/16/2022
  Time: 1:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>$Title$</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
<center>
    <div style="width: 500px; height: auto" align="center">
        <h1>User Management</h1>
        <%-- Back to menu --%>
        <a href="/users">
            <button type="button" class="btn btn-light">Back to List</button>
        </a>
        <%-- SEARCH --%>
        <form action="/users" method="get">
            <input type="hidden" name="action" value="search">
            <label>Name User:</label>
            <input type="text" name="name">
            <button class="btn btn-primary" type="submit">Search</button>
        </form>
        <%-- Create New --%>
        <a href="/users?action=create">
            <button type="button" class="btn btn-primary">Create New</button>
        </a>
        <%-- Show List --%>
        <div align="center">
            <caption><h2>List of Users</h2></caption>
            <table class="table  table-bordered table-secondary round">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Country</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="user" items="${listUser}">
                    <tr>
                        <td><c:out value="${user.id}"/></td>
                        <td><c:out value="${user.name}"/></td>
                        <td><c:out value="${user.email}"/></td>
                        <td><c:out value="${user.country}"/></td>
                        <td style="border: none" class="col-1">
                            <a href="/users?action=edit&id=${user.id}">
                                <button type="button" class="btn btn-primary">
                                    Edit
                                </button>
                            </a>
                        </td>
                        <td style="border: none" class="col-1">
                            <button type="button" class="btn btn-danger"
                                    data-toggle="modal" data-target="#exampleModalCenter"
                                    onclick="infoDelete(
                                        <c:out value='${user.id}'/>,
                                        <c:out value='\"${user.name}\"'/>,
                                        <c:out value='\"${user.email}\"'/>,
                                        <c:out value='\"${user.country}\"'/>,
                                            )">
                                Delete
                            </button>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
                 aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">Confirm Delete?</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="/users" method="post">
                            <div class="modal-body">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" id="id_delete" name="id">
                                <div id="name_delete"></div>
                                <div id="email_delelte"></div>
                                <div id="country_delete"></div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">NO</button>
                                <button type="submit" class="btn btn-danger">YES</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
</center>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<script>
    function infoDelete(id, name, email, country) {
        document.getElementById("id_delete").value = id;
        document.getElementById("name_delete").innerText = "Name: " + name;
        document.getElementById("email_delelte").innerText = "Email " + email;
        document.getElementById("country_delete").innerText = "Country: " + country;
    }
</script>