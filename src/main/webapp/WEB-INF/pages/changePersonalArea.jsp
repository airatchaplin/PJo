<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Редактирование профиля</title>
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
<form:form method="post">
    <nav class="nav-second">
        <div>
            <a href="/change/personalArea">Редактировать профиль</a>
            <a href="/change/personalAreaPassword">Изменить пароль</a>
        </div>
        <div>
            <input style="background: #f2f2f2; border: 0;" type="submit" value="Сохрнаить">
        </div>
    </nav>

    <div class="main">
        <table class="simple-little-table" cellspacing='0'>
            <thead>
            <tr>
                <th>Логин</th>
                <th>Фамилия</th>
                <th>Имя</th>
                <th>Отчество</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>
                    <input type="text" class="form-control" id="username" name="username"
                           placeholder="Введите фамилию" value=" ${user.username}" required>
                </td>
                <td>
                    <input type="text" class="form-control" id="fio" name="fio"
                           placeholder="Введите фамилию" value=" ${user.fio}" required>
                </td>
                <td>
                    <input type="text" class="form-control" id="name" name="name"
                           placeholder="Введите имя" value="${user.name}" required>
                </td>
                <td>
                    <input type="text" class="form-control" id="LastName" name="lastName"
                           placeholder="Введите отчество" value="${user.lastName}" required>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</form:form>

</body>
</html>