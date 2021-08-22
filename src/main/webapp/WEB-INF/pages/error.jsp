<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Ошибка</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
            integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
            crossorigin="anonymous"></script>
</head>
<body>
<nav style="position: fixed;
    box-shadow: 0 0 5px;
    display: flex;
    justify-content: space-between;
    right: 0;
    left: 0;
    padding: 15px;
    background: #d1d1d1;
    top: 0;">
    <div>
        <a style="padding: 10px;color: #000000;text-decoration: none;" href="/">Главная страница</a>
        <a style="padding: 10px;color: #000000;text-decoration: none;" href="/orders">Заказы </a>
        <a style="padding: 10px;color: #000000;text-decoration: none;" href="/details">Детали</a>
        <a style="padding: 10px;color: #000000;text-decoration: none;" href="/materials">Материалы </a>
        <a style="padding: 10px;color: #000000;text-decoration: none;display: ${manager.roles.get(0).name.equals("ROLE_USER")?"none":"contents"}"
           href="/managers">Менеджеры </a>
        <a style="padding: 10px;color: #000000;text-decoration: none;"
           href="/contragents">Контрагенты </a>
        <a style="padding: 10px;color: #000000;text-decoration: none;" href="/workbenches">Станки </a>
    </div>
    <div>
        <a style="padding: 10px;color: #000000;text-decoration: none;display: ${user.roles.get(0).name.equalsIgnoreCase("ROLE_ADMIN") ? "contents" : "none"}" href="/admin/allUsers">Все
            пользователи
        </a>
        <a style="padding: 10px;color: #000000;text-decoration: none;" href="/personalArea">${user.fio_i_o} </a>
        <a style="padding: 10px;color: #000000;text-decoration: none;" href="/logout">Выход </a>
    </div>
</nav>
<h1 style="height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;">Нет доступа</h1>
</body>
</html>


