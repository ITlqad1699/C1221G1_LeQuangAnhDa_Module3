<%--
  Created by IntelliJ IDEA.
  User: lqad1
  Date: 4/19/2022
  Time: 4:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
<div align="center">
    <form method="post">
        <table class="table table-light">
            <c:if test="${employee != null}">
                <input type="hidden" name="id" value="<c:out value='${employee.id}' />"
                />
            </c:if>
            <tr>
                <th> Name</th>
                <td>
                    <input type="text" name="name" size="45"
                           value="<c:out value='${employee.name}' />"
                    />
                    <p style="color:red">${erro.get("name")}</p>
                </td>
            </tr>
            <tr>
                <th> Day of birth</th>
                <td>
                    <input type="date" name="birthDay" size="45"
                           value="<c:out value='${employee.birthDay}' />"
                    />
                    <p style="color:red">${erro.get("birthDay")}</p>
                </td>
            </tr>
            <tr>
                <th>citizenId</th>
                <td>
                    <input type="text" name="citizenId" size="45"
                           value="<c:out value='${employee.citizenId}' />"
                    />
                    <p style="color:red">${erro.get("citizenId")}</p>
                </td>
            </tr>
            <tr>
                <th> Salary</th>
                <td>
                    <fmt:parseNumber var="salary" value="${employee.getSalary()}"
                                     type="number"/>
                    <input type="text" name="salary" size="45"
                           value="${salary}"
                    />

                    <p style="color:red">${erro.get("salary")}</p>
                </td>
            </tr>
            <tr>
                <th>numberPhone</th>
                <td>
                    <input type="text" name="numberPhone" size="15"
                           value="<c:out value='${employee.numberPhone}' />"
                    />
                    <p style="color:red">${erro.get("numberPhone")}</p>
                </td>
            </tr>
            <tr>
                <th>email</th>
                <td>
                    <input type="text" name="email" size="15"
                           value="<c:out value='${employee.email}' />"
                    />
                    <p style="color:red">${erro.get("email")}</p>
                </td>
            </tr>
            <tr>
                <th>address</th>
                <td>
                    <input type="text" name="address" size="15"
                           value="<c:out value='${employee.address}' />"
                    />
                    <p style="color:red">${erro.get("address")}</p>
                </td>
            </tr>
            <tr>
                <th>Level</th>
                <td>
                    <select name="levels">
                        <c:forEach items="${levels}" var="levels">
                            <option value="${levels.levelId}">
                                    ${levels.level}
                            </option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>position</th>
                <td>
                    <select name="positions">
                        <c:forEach items="${positions}" var="positions">
                            <option value="${positions.positionlId}">
                                    ${positions.position}
                            </option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Devision</th>
                <td>
                    <select name="devisions">
                        <c:forEach items="${devisions}" var="devisions">
                            <option value="${devisions.devisionId}">
                                    ${devisions.devision}
                            </option>
                        </c:forEach>
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
