<%--
  Created by IntelliJ IDEA.
  User: lqad1
  Date: 4/18/2022
  Time: 3:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap4.min.css">
</head>
<body>

<div class="container border" style="width: 100%">
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
    <%-- Create New --%>
    <a href="/customer?action=create">
        <button type="button" class="btn btn-primary">Create New</button>
    </a>
    <div align="center">
        <caption><h2>List of Customers</h2></caption>
        <table class="table table-striped" id="tableCustomer">
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Birth Day</th>
                <th>Gender</th>
                <th>Citizen ID</th>
                <th>Phone Number</th>
                <th>Email</th>
                <th>Address</th>
                <th class="col-1">Customer Type</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="cutomers" items="${cutomers}">
                <tr>
                    <td><c:out value="${cutomers.id}"/></td>
                    <td><c:out value="${cutomers.name}"/></td>
                    <td><c:out value="${cutomers.birthDay}"/></td>
                    <td>
                        <c:if test="${cutomers.gender == 0}">
                           Female
                        </c:if>
                        <c:if test="${cutomers.gender == 1}">
                            Male
                        </c:if>
                    </td>
                    <td><c:out value="${cutomers.citizenId}"/></td>
                    <td><c:out value="${cutomers.numberPhone}"/></td>
                    <td><c:out value="${cutomers.email}"/></td>
                    <td><c:out value="${cutomers.address}"/></td>
                    <td class="col-1">
                        <c:choose>
                            <c:when test="${cutomers.customerTypeId==1}">Diamond</c:when>
                            <c:when test="${cutomers.customerTypeId==2}">Platinium</c:when>
                            <c:when test="${cutomers.customerTypeId==3}">Gold</c:when>
                            <c:when test="${cutomers.customerTypeId==4}">Silver</c:when>
                            <c:when test="${cutomers.customerTypeId==5}">Member</c:when>
                        </c:choose>
                    </td>
                    <td style="border: none">
                        <a href="/customer?action=edit&id=${cutomers.id}">
                            <button type="button" class="btn btn-primary">
                                Edit
                            </button>
                        </a>
                        <button type="button" class="btn btn-danger"
                                data-toggle="modal" data-target="#exampleModalCenter"
                                onclick="infoDelete(
                                    <c:out value='${cutomers.id}'/>,
                                    <c:out value='\"${cutomers.name}\"'/>,
                                    <c:out value='\"${cutomers.birthDay}\"'/>,
                                    <c:out value='\"${cutomers.gender}\"'/>,
                                    <c:out value='\"${cutomers.citizenId}\"'/>,
                                    <c:out value='\"${cutomers.numberPhone}\"'/>,
                                    <c:out value='\"${cutomers.email}\"'/>,
                                    <c:out value='\"${cutomers.address}\"'/>,
                                    <c:out value='\"${cutomers.customerTypeId}\"'/>,
                                        )">
                            Delete
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">CONFIRM DELETE?</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="/customer" method="post">
                        <div class="modal-body">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" id="id_delete" name="id">
                            <div id="name_delete"></div>
                            <div id="email_delelte"></div>
                            <div id="birthDay_delete"></div>
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
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap4.min.js"></script>
</body>
</html>
<script>
    function infoDelete(id, name, email, country, birthDay, gender, citizenId, numberPhone, address, customerTypeId) {
        document.getElementById("id_delete").value = id;
        document.getElementById("name_delete").innerText = "Name: " + name;
        document.getElementById("email_delelte").innerText = "Email " + email;
        document.getElementById("birthDay_delete").innerText = "birthDay: " + birthDay;
        document.getElementById("gender_delele").innerText = "gender: " + gender;
        document.getElementById("citizenId_delete").innerText = "citizenId: " + citizenId;
        document.getElementById("numberPhone_delete").innerText = "numberPhone: " + numberPhone;
        document.getElementById("address_delete").innerText = "address: " + address;
        document.getElementById("customerTypeId_delete").innerText = "customerTypeId: " + customerTypeId;
    }

    $(document).ready(function () {
        $('#tableCustomer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 3
        })
    })
</script>

