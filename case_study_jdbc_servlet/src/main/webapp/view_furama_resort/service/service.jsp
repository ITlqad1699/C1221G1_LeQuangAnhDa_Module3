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
            <form class="form-inline my-2 my-lg-0" action="/service" method="get">
                <input type="hidden" name="action" value="search">
                <input class="form-control mr-sm-2" placeholder="Search" aria-label="Search" type="text" name="search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </nav>
    <%-- Create New --%>
    <a href="/service?action=create">
        <button type="button" class="btn btn-primary">Create New</button>
    </a>
    <div align="center">
        <caption><h2>List of Service</h2></caption>
        <table class="table table-striped " id="tableCustomer">
            <thead class="thead-dark">
            <tr>
                <th class="col-1">ID</th>
                <th class="col-1">Service Code</th>
                <th class="col-1">Name</th>
                <th class="col-1">area</th>
                <th>cost</th>
                <th>maxPeople</th>
                <th>roomStandard</th>
                <th>other</th>
                <th class="col-1">swimmingPoolArea</th>
                <th class="col-1">floorNum</th>
                <th class="col-1">rentalTypeId</th>
                <th class="col-1">serviceTypeId</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="service" items="${service}">
                <tr>
                    <td><c:out value="${service.serviceId}"/></td>
                    <td><c:out value="${service.name}"/></td>
                    <td><c:out value="${service.serviceCode}"/></td>
                    <td><c:out value="${service.area}"/></td>
                    <td><c:out value="${service.cost}"/></td>
                    <td><c:out value="${service.maxPeople}"/></td>
                    <td><c:out value="${service.roomStandard}"/></td>
                    <td><c:out value="${service.other}"/></td>
                    <td><c:out value="${service.swimmingPoolArea}"/></td>
                    <td><c:out value="${service.floorNum}"/></td>
                    <td class="col-1">
                        <c:forEach items="${rentalTypes}" var="rentalTypes" >
                            <c:if test="${rentalTypes.rentalTypeId eq service.rentalTypeId}">
                                ${rentalTypes.rentalType}
                            </c:if>
                        </c:forEach>
                    </td>
                    <td class="col-1">
                        <c:forEach items="${serviceTypes}" var="serviceTypes" >
                            <c:if test="${serviceTypes.serviceTypeId eq service.serviceTypeId}">
                                ${serviceTypes.serviceType}
                            </c:if>
                        </c:forEach>
                    </td>
                    <td style="border: none">
                        <a href="/service?action=edit&id=${service.serviceId}">
                            <button type="button" class="btn btn-primary">
                                Edit
                            </button>
                        </a>
                        <button type="button" class="btn btn-danger"
                                data-toggle="modal" data-target="#exampleModalCenter"
                                onclick="infoDelete(
                                    <c:out value='${service.serviceId}'/>,
                                    <c:out value='${service.serviceCode}'/>,
                                    <c:out value='\"${service.name}\"'/>,
                                    <c:out value='\"${service.area}\"'/>,
                                    <c:out value='\"${service.cost}\"'/>,
                                    <c:out value='\"${service.maxPeople}\"'/>,
                                    <c:out value='\"${service.roomStandard}\"'/>,
                                    <c:out value='\"${service.other}\"'/>,
                                    <c:out value='\"${service.swimmingPoolArea}\"'/>,
                                    <c:out value='\"${service.floorNum}\"'/>,
                                    <c:out value='\"${service.rentalTypeId}\"'/>,
                                    <c:out value='\"${service.serviceTypeId}\"'/>,
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
                    <form action="/service" method="post">
                        <div class="modal-body">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" id="id_delete" name="id">
                            <div id="serviceCode_delete"></div>
                            <div id="name_delete"></div>
                            <div id="area_delete"></div>
                            <div id="maxPeople_delele"></div>
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
    function infoDelete(serviceId, name, area, cost, maxPeople, roomStandard, other, swimmingPoolArea, floorNum, rentalTypeId,serviceTypeId) {
        document.getElementById("id_delete").value = serviceId;
        document.getElementById("serviceCode_delete").innerText = "serviceCode: " + name;
        document.getElementById("name_delete").innerText = "Name: " + name;
        document.getElementById("area_delete").innerText = "area " + area;
        document.getElementById("cost_delete").innerText = "cost: " + cost;
        document.getElementById("maxPeople_delele").innerText = "maxPeople: " + maxPeople;
        document.getElementById("roomStandard_delete").innerText = "roomStandard: " + roomStandard;
        document.getElementById("other_delete").innerText = "other: " + other;
        document.getElementById("swimmingPoolArea_delete").innerText = "swimmingPoolArea: " + swimmingPoolArea;
        document.getElementById("floorNum_delete").innerText = "floorNum: " + floorNum;
        document.getElementById("rentalTypeId_delete").innerText = "rentalTypeId: " + rentalTypeId;
        document.getElementById("serviceTypeId_delete").innerText = "serviceTypeId: " + serviceTypeId;
    }

    $(document).ready(function () {
        $('#tableCustomer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 3
        })
    })
</script>

