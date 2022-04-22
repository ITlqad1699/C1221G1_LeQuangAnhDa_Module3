<%--
  Created by IntelliJ IDEA.
  User: lqad1
  Date: 4/18/2022
  Time: 3:36 PM
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
            <form class="form-inline my-2 my-lg-0" action="/employee" method="get">
                <input type="hidden" name="action" value="search">
                <input class="form-control mr-sm-2" placeholder="Search" aria-label="Search" type="text" name="search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </nav>
</div>
<div align="center">
    <div class="display-flex">
        <form class="form-inline my-2 my-lg-0 d-inline" action="/employee" method="get" >
            <input type="hidden" name="action" value="search">
            <input class="form-control mr-sm-2"  aria-label="Search" placeholder="name" type="text" name="search_name">
            <input class="form-control mr-sm-2"  aria-label="Search" placeholder="citizen id" type="text" name="search_citizen_id">
            <input class="form-control mr-sm-2"  aria-label="Search" placeholder="phone number" type="text" name="search_phone_numder">
            <button class="btn btn-success my-2 my-sm-0" type="submit">Search</button>
        </form>
        <a href="/employee?action=create" class="d-inline">
            <button type="button" class="btn btn-primary">Create New</button>
        </a>
    </div>
    <caption><h2>List of Employees</h2></caption>
    <table class="table table-striped " id="tableCustomer">
        <thead class="thead-dark">
        <tr>
            <th class="col-1">id</th>
            <th class="col-1">Name</th>
            <th class="col-1">Day of birth</th>
            <th>CitizenId</th>
            <th>Salary</th>
            <th>NumberPhone</th>
            <th>Email</th>
            <th class="col-1">Address</th>
            <th class="col-1">Position</th>
            <th class="col-1">Level</th>
            <th class="col-1">Devision</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="employees" items="${employees}">
            <tr>
                <td><c:out value="${employees.id}"/></td>
                <td><c:out value="${employees.name}"/></td>
                <td><c:out value="${employees.birthDay}"/></td>
                <td><c:out value="${employees.citizenId}"/></td>
                <td><fmt:formatNumber value="${employees.salary}" type="number"/></td>
                <td><c:out value="${employees.numberPhone}"/></td>
                <td><c:out value="${employees.email}"/></td>
                <td><c:out value="${employees.address}"/></td>
                <td class="col-1">
                   <c:forEach items="${positions}" var="positions">
                       <c:if test="${positions.positionlId eq employees.positionlId}">
                           ${positions.position}
                       </c:if>
                   </c:forEach>
                </td>
                <td class="col-1">
                    <c:forEach items="${levels}" var="levels">
                        <c:if test="${levels.levelId eq employees.levelId}">
                            ${levels.level}
                        </c:if>
                    </c:forEach>
                </td>
                <td class="col-1">
                   <c:forEach items="${devisions}" var="devisions">
                       <c:if test="${devisions.devisionId eq employees.devisionId}">
                           ${devisions.devision}
                       </c:if>
                   </c:forEach>
                </td>
                <td style="border: none">
                    <a href="/employee?action=edit&id=${employees.id}">
                        <button type="button" class="btn btn-primary">
                            Edit
                        </button>
                    </a>
                    <button type="button" class="btn btn-danger"
                            data-toggle="modal" data-target="#exampleModalCenter"
                            onclick="infoDelete(
                                <c:out value='${employees.id}'/>,
                                <c:out value='\"${employees.name}\"'/>,
                                <c:out value='\"${employees.birthDay}\"'/>,
                                <c:out value='\"${employees.citizenId}\"'/>,
                                <c:out value='\"${employees.salary}\"'/>,
                                <c:out value='\"${employees.numberPhone}\"'/>,
                                <c:out value='\"${employees.email}\"'/>,
                                <c:out value='\"${employees.address}\"'/>,
                                <c:out value='\"${employees.positionlId}\"'/>,
                                <c:out value='\"${employees.levelId}\"'/>,
                                <c:out value='\"${employees.devisionId}\"'/>,
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
                <form action="/employee" method="post">
                    <div class="modal-body">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" id="id_delete" name="id">
                        <div id="name_delete"></div>
                        <div id="birthDay_delete"></div>
                        <div id="email_delete"></div>
                        <div id="citizenId_delete"></div>
                        <div id="salary_delele"></div>
                        <div id="positionlId_delete"></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">NO</button>
                        <button type="submit" class="btn btn-danger">YES</button>
                    </div>
                </form>
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
    function infoDelete(id, name, birthDay, citizenId, salary, numberPhone, email, address, positionlId, levelId, devisionId) {
        document.getElementById("id_delete").value = id;
        document.getElementById("name_delete").innerText = "Name: " + name;
        document.getElementById("birthDay_delete").innerText = "birthDay " + birthDay;
        document.getElementById("citizenId_delete").innerText = "citizenId: " + citizenId;
        document.getElementById("salary_delele").innerText = "salary: " + salary;
        document.getElementById("numberPhoned_delete").innerText = "numberPhone: " + numberPhone;
        document.getElementById("email_delete").innerText = "email: " + email;
        document.getElementById("address_delete").innerText = "address: " + address;
        document.getElementById("positionlId_delete").innerText = "positionlId: " + positionlId;
        document.getElementById("levelId_delete").innerText = "levelId: " + levelId;
        document.getElementById("devisionId_delete").innerText = "devisionId: " + devisionId;
    }

    $(document).ready(function () {
        $('#tableCustomer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 3
        })
    })
</script>
