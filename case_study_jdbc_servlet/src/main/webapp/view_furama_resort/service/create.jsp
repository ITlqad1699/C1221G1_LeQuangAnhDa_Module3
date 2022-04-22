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
                <button type="submit" class="btn btn-primary">Create Service</button>
                <table border="1" cellpadding="5" class="table table-info">
                    <tbody>
                    <tr>
                        <th>Name</th>
                        <td>
                            <input type="text" name="name" id="name" size="45">
                        </td>
                        <p style="color:red">${erro.get("name")}</p>
                    </tr>
                    <tr>
                        <th>area</th>
                        <td>
                            <input type="text" name="area" id="area" size="45">
                        </td>
                        <p style="color:red">${erro.get("area")}</p>
                    </tr>
                    <tr>
                        <th>cost</th>
                        <td>
                            <input type="text" name="cost" id="cost" size="45">
                        </td>
                        <p style="color:red">${erro.get("cost")}</p>
                    </tr>
                    <tr>
                        <th>maxPeople</th>
                        <td>
                            <input type="text" name="maxPeople" id="maxPeople" size="45">
                        </td>
                        <p style="color:red">${erro.get("maxPeople")}</p>
                    </tr>
                    <tr>
                        <th>roomStandard</th>
                        <td>
                            <input type="text" name="roomStandard" id="roomStandard" size="45">
                        </td>
                        <p style="color:red">${erro.get("roomStandard")}</p>
                    </tr>
                    <tr>
                        <th>other</th>
                        <td>
                            <input type="text" name="other" id="other" size="45">
                        </td>
                        <p style="color:red">${erro.get("other")}</p>
                    </tr>
                    <tr>
                        <th>swimmingPoolArea</th>
                        <td>
                            <input type="text" name="swimmingPoolArea" id="swimmingPoolArea" size="45">
                        </td>
                        <p style="color:red">${erro.get("swimmingPoolArea")}</p>
                    </tr>
                    <tr>
                        <th>floorNum</th>
                        <td>
                            <input type="text" name="floorNum" id="floorNum" size="45">
                        </td>
                        <p style="color:red">${erro.get("floorNum")}</p>
                    </tr>
                    <tr>
                        <th>Rental Types</th>
                        <td>
                            <select name="rentalTypeId">
                                <c:forEach items="${rentalTypes}" var="rentalTypes">
                                    <option value="${rentalTypes.rentalTypeId}">
                                            ${rentalTypes.rentalType}
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                        <p style="color:red">${erro.get("rentalTypes")}</p>
                    </tr>
                    <tr>
                        <th>Service Type</th>
                        <td>
                            <select name="serviceTypeId">
                                <c:forEach items="${serviceTypes}" var="serviceTypes">
                                    <option value="${serviceTypes.serviceTypeId}">
                                            ${serviceTypes.serviceType}
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                        <p style="color:red">${erro.get("serviceTypeId")}</p>
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
