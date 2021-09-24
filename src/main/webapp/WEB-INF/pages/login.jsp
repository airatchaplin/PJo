<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Вход</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../../resources/css/login.css">
    <link rel="stylesheet" href="../../resources/css/main.css">

</head>
<body style="margin: 1px">
<div class="login-box">
    <h2>Вход</h2>
    <form method="post">
        <div class="user-box">
            <input class="input-login" type="text" name="username" placeholder="Введите логин" required="">
        </div>
        <div class="user-box">
            <input class="input-login" type="password" name="password" placeholder="Введите пароль" required="">
        </div>
        <button class="button-login">Вход</button>
    </form>
    <button class="button-login"
            onclick="window.location.href = '/registration';">Регистрация
    </button>
</div>
</body>
</html>