<%--
  Created by IntelliJ IDEA.
  User: lqad1
  Date: 4/19/2022
  Time: 10:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap4.min.css">
</head>
<body>
<div class="container border col-12" style="width: 100%">
    <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4  bg-white border-bottom box-shadow my-0 "
         style="background: #046056;">
        <h5 class="my-0 mr-md-auto font-weight-normal"><img
                src="https://phuongviethcm.com/wp-content/uploads/2019/07/FURAMA.png"
                style="width: 60px; height: 60px"></h5>
        <a class="btn btn-outline-primary" href="#">Sign up</a>
    </div>
    <nav class="navbar navbar-expand-lg p-2 my-0 fixed col " style="background: darkolivegreen;">
        <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link text-white" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="/employee">Employee</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="/customer">Customer</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="/service">Service</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="/contract">Contract</a>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0" action="/customer" method="get">
                <input type="hidden" name="action" value="search">
                <input class="form-control mr-sm-2" placeholder="Search" aria-label="Search" type="text" name="search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </nav>
    <center>
        <div align="center">
            <div align="center">
                <form method="post">
                    <table class="table bg-light table-striped col-8">
                        <tbody class="tbody-dark">
                        <tr>
                            <th class="col-2">Name</th>
                            <td>
                                <input type="text" name="name" id="name" class="form-control border-primary">
                                <p class="alert alert-danger" role="alert">${erro.get("name")}</p>
                            </td>
                            <th>Day Of Birth</th>
                            <td>
                                <input type="date" name="birthDay" id="birthDay" class="form-control border-primary">
                                <p class="alert alert-danger">${erro.get("birthDay")}</p>
                            </td>
                        </tr>
                        <tr>
                            <th>Gender</th>
                            <td>
                                <select name="gender" class="form-control border-primary">
                                    <option value="1">Male</option>
                                    <option value="0">Female</option>
                                </select>
                                <p class="alert alert-danger">${erro.get("gender")}</p>
                            </td>
                            <th>Citizen ID</th>
                            <td>
                                <input type="text" name="citizenId" id="citizenId" class="form-control border-primary">
                                <p class="alert alert-danger">${erro.get("citizenId")}</p>
                            </td>
                        </tr>
                        <tr>
                            <th>Number Phone</th>
                            <td>
                                <input type="text" name="numberPhone" id="numberPhone" class="form-control border-primary">
                                <p class="alert alert-danger">${erro.get("numberPhone")}</p>
                            </td>
                            <th>Email</th>
                            <td>
                                <input type="text" name="email" id="email" class="form-control border-primary">
                                <p class="alert alert-danger">${erro.get("email")}</p>
                            </td>
                        </tr>
                        <tr>
                            <th>Address</th>
                            <td>
                                <input type="text" name="address" id="address" class="form-control border-primary">
                                <p class="alert alert-danger">${erro.get("address")}</p>
                            </td>
                            <th>Customer Type</th>
                            <td>
                                <select name="customerTypeId" class="form-control border-primary">
                                    <c:forEach items="${customerType}" var="customerType">
                                        <option value="${customerType.customerTypeId}">
                                                ${customerType.customerType}
                                        </option>
                                    </c:forEach>
                                </select>
                                <p class="alert alert-danger">${erro.get("customerTypeId")}</p>
                            </td>
                        </tr>
                        <tr>
                            <th>Customer Code</th>
                            <td>
                                <input type="text" name="customerCode" id="customerCode" class="form-control border-primary">
                                <p class="alert alert-danger">${erro.get("customerCode")}</p>
                            </td>
                            <th></th>
                            <td>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <button type="submit" class="btn btn-success">Create Customer</button>
                </form>
            </div>
        </div>
    </center>
</div>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap4.min.js"></script>
</body>
</html>
<%--<script>--%>
<%--    // Data Picker Initialization--%>
<%--    $('.datepicker').datepicker({--%>
<%--        inline: true--%>
<%--    });--%>
<%--</script>--%>
