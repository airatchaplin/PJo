<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Регистрация</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../../resources/css/login.css">
    <link rel="stylesheet" href="../../resources/css/main.css">

</head>
<body style="margin: 1px">
<div class="login-box">
    <h2>Регистрация</h2>
    <form method="post">
        <div class="user-box">
            <input class="input-login" type="text" name="username" placeholder="Введите логин" required="">
        </div>
        <div class="user-box">
            <input class="input-login" type="text" name="fio" placeholder="Введите фамилию" required="">
        </div>
        <div class="user-box">
            <input class="input-login" type="text" name="name" placeholder="Введите имя" required="">
        </div>
        <div class="user-box">
            <input class="input-login" type="text" name="lastName" placeholder="Введите отчество" required="">
        </div>
        <div class="user-box">
            <input class="input-login" type="password" name="password" placeholder="Введите пароль" required="">
        </div>
        <div class="user-box">
            <input class="input-login" type="password" name="passwordConfirm" placeholder="Повторите пароль" required="">
        </div>
        <button class="button-login">Регистрация</button>
    </form>
</div>
</body>
</html>

