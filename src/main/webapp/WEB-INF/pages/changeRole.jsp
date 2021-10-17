<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Изменение прав</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
    <link rel="stylesheet" href="../../resources/css/table_allUsers.css">
</head>
<body>
<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<jsp:include page="../nav/admin_nav_second.jsp"></jsp:include>
<form:form action="/admin/allUsers/change"
           method="post">
    <jsp:include page="../nav/nav_third_save.jsp"></jsp:include>

    <div class="main">
        <table class="simple-little-table" cellspacing='0' style="margin-bottom: 10px;">
            <thead>
            <tr>
                <th>Экономисты</th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
            </tr>
            <tr>
                <th class="number_orders" style="text-align: center">№</th>
                <th class="name">Логин</th>
                <th class="name">Фамилия</th>
                <th class="name">Имя</th>
                <th class="name">Отчество</th>
                <th class="name">Права</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${allAdmins}" var="user">
                <tr>
                    <td class="number" style="text-align: center">${count1 + 1}</td>
                    <td class="name">${user.username}</td>
                    <td class="name">
                        <input type="text" class="form-control" name="id"
                               placeholder="Введите новый пароль" style="display: none" value="${user.id}">
                            ${user.fio}
                    </td>
                    <td class="name">${user.name}</td>
                    <td class="name">${user.lastName}</td>
                    <td class="name">
                        <div>
                            <select class="form-control" name="role">
                                <option value="${user.roles.get(0).name}">
                                    Выбрано: ${user.roles.get(0).name.equals("ROLE_USER")?"Менеджер":"Экономист"}</option>
                                <c:forEach items="${roles}" var="role">
                                    <option value="${role.name}">${role.name.equals("ROLE_USER")?"Менеджер":"Экономист"}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </td>
                </tr>
                <c:set var="count1" value="${count1 + 1}" scope="page"/>
            </c:forEach>
            </tbody>
        </table>


        <table class="simple-little-table" cellspacing='0'>
            <thead>
            <tr>
                <th>Менеджеры</th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
            </tr>
            <tr>
                <th class="number_orders" style="text-align: center">№</th>
                <th class="name">Логин</th>
                <th class="name">Фамилия</th>
                <th class="name">Имя</th>
                <th class="name">Отчество</th>
                <th class="name">Права</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${allManagers}" var="user">
                <tr>
                    <td class="number" style="text-align: center">${count2 + 1}</td>
                    <td class="name">${user.username}</td>
                    <td class="name">
                        <input type="text" class="form-control" name="id"
                               placeholder="Введите новый пароль" style="display: none" value="${user.id}">
                            ${user.fio}
                    </td>
                    <td class="name">${user.name}</td>
                    <td class="name">${user.lastName}</td>
                    <td class="name">
                        <div>
                            <select class="form-control" name="role">
                                <option value="${user.roles.get(0).name}">
                                    Выбрано: ${user.roles.get(0).name.equals("ROLE_USER")?"Менеджер":"Экономист"}</option>
                                <c:forEach items="${roles}" var="role">
                                    <option value="${role.name}">${role.name.equals("ROLE_USER")?"Менеджер":"Экономист"}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </td>
                </tr>
                <c:set var="count2" value="${count2 + 1}" scope="page"/>
            </c:forEach>
            </tbody>
        </table>
    </div>
</form:form>
</body>
</html>