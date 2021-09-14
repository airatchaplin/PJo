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
<nav class="nav-first">
    <div>
        <a href="/">Главная страница</a>
        <a href="/orders">Заказы </a>
        <a href="/details">Детали</a>
        <a href="/materials">Материалы </a>
        <a href="/managers">Менеджеры </a>
        <a href="/contragents">Контрагенты </a>
        <a href="/workbenches">Станки </a>
    </div>
    <div>
        <a style="display: ${user.roles.get(0).name.equalsIgnoreCase("ROLE_ADMIN") ? "contents" : "none"}"
           href="/admin/allUsers">Все пользователи</a>
        <a href="/personalArea">${user.fio_i_o} </a>
        <a href="/logout">Выход</a>
    </div>
</nav>


<form:form action="/admin/allUsers/change"
           method="post">

    <nav class="nav-second">
        <div>
            <a href="/admin/allUsers/change">Изменить права</a>
        </div>
        <div>
            <input style="background: #f2f2f2; border: 0;" type="submit" value="Сохрнаить">
        </div>
    </nav>

    <div class="main">
        <div style="margin: 10px ; font-size: 15px">
            Экономисты
        </div>
        <table class="simple-little-table" cellspacing='0'>
            <thead>
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

        <div style="margin: 10px ; font-size: 15px">
            Менеджеры
        </div>
        <table class="simple-little-table" cellspacing='0'>
            <thead>
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