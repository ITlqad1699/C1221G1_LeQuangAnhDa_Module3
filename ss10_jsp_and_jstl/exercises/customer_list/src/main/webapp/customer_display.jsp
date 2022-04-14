<%--
  Created by IntelliJ IDEA.
  User: lqad1
  Date: 4/12/2022
  Time: 9:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Customer</title>
    <style>
        img {
            width: 100px;
            height: 100px;
        }

        /*tr{*/
        /*  border: 1px solid;*/
        /*}*/
        td {
            text-align: center;
            /*border: solid 1px;*/
        }

        table {
            border: burlywood 1px solid;
            width: 500px;
            height: auto;
        }
    </style>
</head>

<body>
<h1>Customer manegement</h1>
<table border="1">
    <tr>
        <th>id</th>
        <th>Họ tên</th>
        <th>Ngày sinh</th>
        <th>Địa Chỉ</th>
        <th>Ảnh</th>
        <th>Giới tính</th>
        <th>Xếp Loại</th>
    </tr>
    <c:forEach var="item" items="${list_customer}">
        <tr>
            <td>${item.id}</td>
            <td>${item.fullName}</td>
            <td>${item.birthDay}</td>
            <td>${item.address}</td>
            <td><img src="${item.image}"></td>
            <td>
                <c:choose>
                    <c:when test="${item.gender == true}">
                        Nam
                    </c:when>
                    <c:when test="${item.gender == false}">
                        Nữ
                    </c:when>
                    <c:otherwise>
                        No gender
                    </c:otherwise>
                </c:choose>
            </td>
                <%--            <c:set var="gender" value="${list_customer.gender}"/>--%>
                <%--            <td><c:out value="${gender eq true ? 'Nam': 'Nu'}"/></td>--%>
            <td>
                <c:choose>
                    <c:when test="${item.score >= 8}">
                        Giỏi
                    </c:when>
                    <c:when test="${item.score >= 6}">
                        Khá
                    </c:when>
                    <c:when test="${item.score >=3}">
                        Trung bình
                    </c:when>
                    <c:otherwise>
                        Yếu
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
