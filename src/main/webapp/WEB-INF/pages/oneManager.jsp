<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Менеджер</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
    <link rel="stylesheet" href="../../resources/css/table_managers.css">
</head>
<body>

<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<jsp:include page="../nav/manager_nav_second.jsp"></jsp:include>

<div class="main" style="margin-top: 120px;">
    <table class="simple-little-table" cellspacing='0'>
        <thead>
        <tr>
            <th class="fio">Фамилия</th>
            <th class="fio">Имя</th>
            <th class="fio">Отчество</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td class="fio">${managerById.fio}</td>
            <td class="fio">${managerById.name}</td>
            <td class="fio">${managerById.lastName}</td>
        </tr>
        </tbody>
    </table>
</div>

</body>
</html>