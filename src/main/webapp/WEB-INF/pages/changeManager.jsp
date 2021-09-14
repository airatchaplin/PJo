<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Изменение менеджера</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
    <link rel="stylesheet" href="../../resources/css/table_managers.css">
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
<form:form method="post">
    <nav class="nav-second">
        <div>
            <a href="/addManager">Добавить менеджера</a>
            <a href="/managers/change/${managerById.id}">Изменить менеджера</a>
            <a href="/managers/deletion/${managerById.id}">Удалить менеджера</a>
        </div>
        <div>
            <input style="background: #f2f2f2; border: 0;cursor: pointer; " type="submit" value="Сохранить">
        </div>
    </nav>

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
                <td class="fio">
                    <input type="text" class="form-control" id="fio" name="fio"
                           placeholder="${managerById.fio}" value="${managerById.fio}" required>
                </td>
                <td class="fio">
                    <input type="text" class="form-control" id="name" name="name"
                           placeholder="${managerById.name}" value="${managerById.name}" required>
                </td>
                <td class="fio">
                    <input type="text" class="form-control" id="lastName" name="lastName"
                           placeholder="${managerById.lastName}" value="${managerById.lastName}" required>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</form:form>

</body>
</html>