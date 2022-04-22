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
                        <tbody>
                        <tr>
                            <th>Service Code</th>
                            <td>
                                <input type="text" name="serviceCode" id="serviceCode"
                                       class="form-control border-primary">
                                <p style="color:red">${erro.get("serviceCode")}</p>
                            </td>
                            <th>Name</th>
                            <td>
                                <input type="text" name="name" id="name" class="form-control border-primary">
                                <p style="color:red">${erro.get("name")}</p>
                            </td>
                        <tr>
                            <th>area</th>
                            <td>
                                <input type="text" name="area" id="area" class="form-control border-primary">
                                <p style="color:red">${erro.get("area")}</p>
                            </td>
                            <th>cost</th>
                            <td>
                                <input type="text" name="cost" id="cost" class="form-control border-primary">
                                <p style="color:red">${erro.get("cost")}</p>
                            </td>
                        </tr>
                        <tr>
                            <th>maxPeople</th>
                            <td>
                                <input type="text" name="maxPeople" id="maxPeople" class="form-control border-primary">
                                <p style="color:red">${erro.get("maxPeople")}</p>
                            </td>
                            <th>roomStandard</th>
                            <td>
                                <input type="text" name="roomStandard" id="roomStandard"
                                       class="form-control border-primary">
                                <p style="color:red">${erro.get("roomStandard")}</p>
                            </td>
                        </tr>
                        <tr>
                            <th>other</th>
                            <td>
                                <input type="text" name="other" id="other" class="form-control border-primary">
                                <p style="color:red">${erro.get("other")}</p>
                            </td>
                            <th>swimmingPoolArea</th>
                            <td>
                                <input type="text" name="swimmingPoolArea" id="swimmingPoolArea"
                                       class="form-control border-primary">
                                <p style="color:red">${erro.get("swimmingPoolArea")}</p>
                            </td>
                        </tr>
                        <tr>
                            <th>floorNum</th>
                            <td>
                                <input type="text" name="floorNum" id="floorNum" class="form-control border-primary">
                                <p style="color:red">${erro.get("floorNum")}</p>
                            </td>
                            <th>Rental Types</th>
                            <td>
                                <select name="rentalTypeId" class="form-control border-primary">
                                    <c:forEach items="${rentalTypes}" var="rentalTypes">
                                        <option value="${rentalTypes.rentalTypeId}">
                                                ${rentalTypes.rentalType}
                                        </option>
                                    </c:forEach>
                                </select>
                                <p style="color:red">${erro.get("rentalTypes")}</p>
                            </td>
                        </tr>
                        <tr>
                            <th>Service Type</th>
                            <td>
                                <select name="serviceTypeId" class="form-control border-primary" id="mySelect"
                                        onchange="myFunction()">
                                    <c:forEach items="${serviceTypes}" var="serviceTypes">
                                        <option value="${serviceTypes.serviceTypeId}">
                                                ${serviceTypes.serviceType}
                                        </option>
                                    </c:forEach>
                                </select>
                                <p style="color:red">${erro.get("serviceTypeId")}</p>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <button type="submit" class="btn btn-success">Create Service</button>
                </form>
            </div>
        </div>
    </center>
</div>
<p id="l">If you click on the "Hide" button, I will disappear.</p>
<button id="hide">Hide</button>
<button id="show">Show</button>
<script>
   function myFunction () {
       let floor = document.getElementById("mySelect").value;
       if(floor == 3){
           document.getElementById("floorNum").value = "0";
       }
   }
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<script>
    $(document).ready(function(){
        $("#hide").click(function(){
            $("p").hide();
        });
        $("#show").click(function(){
            $("p").show();
        });
    });
</script>