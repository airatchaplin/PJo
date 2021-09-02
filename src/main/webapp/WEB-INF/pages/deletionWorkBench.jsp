<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Удаление станка</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
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
<form:form action="/workbenches/deletion/${workbench.id}">
    <nav class="nav-second">
        <div>
            <a href="/addWorkBench">Добавить станок</a>
            <a href="/workbenches/change/${workbench.id}">Изменить станок</a>
            <a href="/workbenches/deletion/${workbench.id}">Удалить станок</a>
        </div>
        <div>
            <input style="background: #f2f2f2; border: 0;cursor: pointer; " type="submit" value="Удалить">
        </div>
    </nav>

    <div class="main" style="margin-top: 120px">
        <table class="simple-little-table" cellspacing='0'>
            <thead>
            <tr>
                <th>Станок</th>
                <th>Операция</th>
                <th>Время окончния</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>${workbench.name}</td>
                <td>${workbench.typeOperation.name}</td>
                <td>${workbench.dateEndDetail}</td>
            </tr>
            </tbody>
        </table>
        <label style="color: red">${workBenchError}</label>
    </div>
</form:form>
</body>
</html>