<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Материал ${material.name} ${material.thickness}мм</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
    <link rel="stylesheet" href="../../resources/css/table_materials.css">
</head>
<body>
<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<c:if test="${setting.get(0).viewing==false && user.roles.get(0).name.equals('ROLE_USER')}">
    <jsp:include page="../nav/material_nav_second.jsp"></jsp:include>
</c:if>
<c:if test="${user.roles.get(0).name.equals('ROLE_ADMIN')}">
    <jsp:include page="../nav/material_nav_second.jsp"></jsp:include>
</c:if>


<div class="main">
    <table class="simple-little-table" cellspacing='0'>
        <thead>
        <tr>
            <th class="materials">Название материала</th>
            <th class="materials">Толщина</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td class="materials">${material.name}</td>
            <td class="materials">${material.thickness}</td>
        </tr>
        </tbody>
    </table>
</div>

</body>
</html>