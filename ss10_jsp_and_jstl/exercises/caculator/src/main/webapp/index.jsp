<%--
  Created by IntelliJ IDEA.
  User: lqad1
  Date: 4/12/2022
  Time: 10:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Simple Calculator</title>
</head>
<body>
<form action="/calculate" method="post">
    <fieldset>
        <legend>Calculator</legend>
        <table>
            <tr>
                <td>First operand:</td>
                <td><input type="text" name="first-operand"></td>
            </tr>
            <tr>
                <td>Operator:</td>
                <td>
                    <select name="operator">
                        <option value="+">+</option>
                        <option value="-">-</option>
                        <option value="*">*</option>
                        <option value="/">/</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Second operand:</td>
                <td><input type="text" name="second-operand"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Calculate"/></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
