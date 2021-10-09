<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Личный кабинет</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
    <link rel="stylesheet" href="../../resources/css/table_personalArea.css">
</head>
<body>
<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<jsp:include page="../nav/personalArea_nav_second.jsp"></jsp:include>

<div class="main">
    <table class="simple-little-table" cellspacing='0'>
        <thead>
        <tr>
            <th class="personal_area">Логин</th>
            <th class="personal_area">Фамилия</th>
            <th class="personal_area">Имя</th>
            <th class="personal_area">Отчество</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td class="personal_area">${user.username}</td>
            <td class="personal_area">${user.fio}</td>
            <td class="personal_area">${user.name}</td>
            <td class="personal_area">${user.lastName}</td>
        </tr>
        </tbody>
    </table>
</div>

</body>
</html>