<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Материалы</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_hover.css">
    <link rel="stylesheet" href="../../resources/css/table_materials.css">
</head>
<body>
<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<c:if test="${setting.get(0).viewing==false && user.roles.get(0).name.equals('ROLE_USER')}">
    <nav class="nav-second">
        <button class="button-nav-second"
                onclick="window.location.href = '/addMaterial';">Добавить материал
        </button>
    </nav>
</c:if>
<c:if test="${user.roles.get(0).name.equals('ROLE_ADMIN')}">
    <nav class="nav-second">
        <button class="button-nav-second"
                onclick="window.location.href = '/addMaterial';">Добавить материал
        </button>
    </nav>
</c:if>


<div class="main">
    <table class="simple-little-table" cellspacing='0'>
        <thead>
        <tr>
            <th class="number" style="text-align: center">№</th>
            <th class="materials">Название материала</th>
            <th class="materials">Толщина</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${materials}" var="material">
            <tr>
                <td class="number" style="text-align: center">${count + 1}</td>
                <td class="materials"><a style="display: block" href="materials/${material.id}">${material.name}</a>
                </td>
                <td class="materials"><a style="display: block"
                                         href="materials/${material.id}">${material.thickness}</a></td>
            </tr>
            <c:set var="count" value="${count + 1}" scope="page"/>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>