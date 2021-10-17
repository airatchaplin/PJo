<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Менеджер ${managerById.fio_i_o}</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
    <link rel="stylesheet" href="../../resources/css/table_managers.css">
</head>
<body>

<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<c:if test="${setting.get(0).viewing==false && user.roles.get(0).name.equals('ROLE_USER')}">
    <jsp:include page="../nav/manager_nav_second.jsp"></jsp:include>
</c:if>
<c:if test="${user.roles.get(0).name.equals('ROLE_ADMIN')}">
    <jsp:include page="../nav/manager_nav_second.jsp"></jsp:include>
</c:if>


<div class="main">
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