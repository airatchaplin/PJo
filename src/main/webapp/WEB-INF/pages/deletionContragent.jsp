<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Удаление контрагента</title>
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
<form:form action="/contragents/deletion/${contragent.id}" method="post">
    <nav class="nav-second">
        <div>
            <a href="/addContragent">Добавить контрагента</a>
            <a href="/contragents/change/${contragent.id}">Изменить контрагента</a>
            <a href="/contragents/deletion/${contragent.id}">Удалить контрагента</a>
        </div>
        <div>
            <input style="background: #f2f2f2; border: 0;cursor: pointer; " type="submit" value="Удалить">
        </div>
    </nav>

    <div class="main">
        <table class="simple-little-table" cellspacing='0'>
            <thead>
            <tr>
                <th>Контрагент</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>${contragent.name}</td>
            </tr>
            </tbody>
        </table>
        <label style="color: red">${contragentError}</label>
    </div>
</form:form>
</body>
</html>