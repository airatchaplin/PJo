<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Контрагенты</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_hover.css">
</head>
<body>

<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<nav class="nav-second">
    <button class="button-nav-second" style="width: 195px;"
            onclick="window.location.href = '/addContragent';">Добавить контрагента
    </button>
</nav>

<div class="main" style="margin-top: 120px">
    <table class="simple-little-table" cellspacing='0'>
        <thead>
        <tr>
            <th class="number" style="text-align: center">№</th>
            <th >Контрагент</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${contragents}" var="contragent">
            <tr>
                <td class="number" style="text-align: center">${count + 1}</td>
                <td><a style="display: block" href="contragents/${contragent.id}">${contragent.name}</a>
                </td>
            </tr>
            <c:set var="count" value="${count + 1}" scope="page"/>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>