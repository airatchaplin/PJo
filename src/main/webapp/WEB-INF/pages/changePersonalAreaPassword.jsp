<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Изменение пароля</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
    <link rel="stylesheet" href="../../resources/css/table_personalArea.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
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
                <th class="personal_areaPassword">Пароль</th>
                <th class="personal_areaPassword">Повторите пароль</th>
                <th>Показать</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td class="personal_areaPassword">
                    <input type="password" class="form-control" id="password-input1" name="password"
                           placeholder="Введите новый пароль" value="" required>
                    <label style="color: red;text-align: center">${passwordError}</label>
                </td>
                <td class="personal_areaPassword">
                    <input type="password" class="form-control" id="password-input2" name="passwordConfirm"
                           placeholder="Повторите новый пароль" value="" required>
                    <label style="color: red;text-align: center">${passwordError}</label>
                </td>
                <td>
                    <input type="checkbox" class="form-check-input" style="font-size: x-large;">
                </td>

            </tr>
            </tbody>
        </table>
    </div>
</form:form>

</body>
<script>
    $('body').on('click', '.form-check-input', function () {
        if ($(this).is(':checked')) {
            $('#password-input1').attr('type', 'text');
            $('#password-input2').attr('type', 'text');
        } else {
            $('#password-input1').attr('type', 'password');
            $('#password-input2').attr('type', 'password');
        }
    });
</script>
</html>