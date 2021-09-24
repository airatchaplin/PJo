<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Менеджеры</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_hover.css">
    <link rel="stylesheet" href="../../resources/css/table_managers.css">
</head>
<body>
<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<nav class="nav-second">
    <button class="button-nav-second" style="width: 195px;"
            onclick="window.location.href = '/addManager';">Добавить менеджера
    </button>
</nav>

<div class="main" style="margin-top: 120px">
    <table class="simple-little-table" cellspacing='0'>
        <thead>
        <tr>
            <th class="number" style="text-align: center">№</th>
            <th class="fio">Фамилия</th>
            <th class="fio">Имя</th>
            <th class="fio">Отчество</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${managers}" var="manager">
            <tr>
                <td class="number" style="text-align: center">${count + 1}</td>
                <td class="fio"><a style="display: block"
                       href="managers/${manager.getId()}">${manager.getFio()}</a>
                </td>
                <td class="fio"><a style="display: block"
                       href="managers/${manager.getId()}">${manager.getName()}</a>
                </td>
                <td class="fio"><a style="display: block"
                       href="managers/${manager.getId()}">${manager.getLastName()}</a>
                </td>
            </tr>
            <c:set var="count" value="${count + 1}" scope="page"/>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>