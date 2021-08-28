<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Изменение прав</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
            integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
            crossorigin="anonymous"></script>
    <style>
        a {
            color: #000000;
            text-decoration: none;
        }

        .table {
            width: 100%;
            border: none;
            margin-bottom: 20px;
        }

        .table thead th {
            font-weight: bold;
            text-align: left;
            border: none;
            padding: 10px 15px;
            background: #d8d8d8;
            font-size: 14px;
            border-left: 1px solid #ddd;
            border-right: 1px solid #ddd;
        }

        .table tbody td {
            text-align: left;
            border-left: 1px solid #ddd;
            border-right: 1px solid #ddd;
            padding: 10px 15px;
            font-size: 14px;
            vertical-align: top;
        }

        .table thead tr th:first-child, .table tbody tr td:first-child {
            border-left: none;
        }

        .table thead tr th:last-child, .table tbody tr td:last-child {
            border-right: none;
        }

        .table tbody tr:nth-child(even) {
            background: #f3f3f3;
        }

        .table > :not(caption) > * > * {
            border-bottom-width: 0px;
        }

    </style>
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
        <a style="padding: 10px;color: #000000;text-decoration: none;display: ${user.roles.get(0).name.equalsIgnoreCase("ROLE_ADMIN") ? "contents" : "none"}"
           href="/admin/allUsers">Все
            пользователи
        </a>
        <a style="padding: 10px;color: #000000;text-decoration: none;" href="/personalArea">${user.fio_i_o} </a>
        <a style="padding: 10px;color: #000000;text-decoration: none;" href="/logout">Выход </a>
    </div>
</nav>
<form:form action="/admin/allUsers/change"
           method="post">

    <nav style="position: fixed;
    box-shadow: 0 5px 5px -5px;
   display: flex;
    justify-content: space-between;
    right: 0;
    left: 0;
    background: #f2f2f2;
    padding: 15px;
    top: 0;
    margin-top: 60px;">
        <div>
            <a style="padding: 10px;color: #000000;text-decoration: none;" href="/admin/allUsers/change">Изменить права
            </a>
        </div>

        <div>
            <input style="background: #f2f2f2; border: 0;" type="submit" value="Сохрнаить">

        </div>
    </nav>

    <div class="main" style="margin-top: 120px">
        <div style="margin: 10px ; font-size: 15px">
            Экономисты
        </div>
        <table class="table">
            <thead>
            <tr>
                <th scope="col">№</th>
                <th scope="col">Логин</th>
                <th scope="col">Фамилия</th>
                <th scope="col">Имя</th>
                <th scope="col">Отчество</th>
                <th scope="col">Права</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${allAdmins}" var="user">
                <tr>
                    <td>${count1 + 1}</td>
                    <td>${user.username}</td>
                    <td>
                        <input type="text" class="form-control" name="id"
                               placeholder="Введите новый пароль" style="display: none" value="${user.id}">
                            ${user.fio}
                    </td>
                    <td>${user.name}</td>
                    <td>${user.lastName}</td>
                    <td>
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
        <table class="table">
            <thead>
            <tr>
                <th scope="col">№</th>
                <th scope="col">Логин</th>
                <th scope="col">Фамилия</th>
                <th scope="col">Имя</th>
                <th scope="col">Отчество</th>
                <th scope="col">Права</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${allManagers}" var="user">
                <tr>
                    <td>${count2 + 1}</td>
                    <td>${user.username}</td>
                    <td>
                        <input type="text" class="form-control" name="id"
                               placeholder="Введите новый пароль" style="display: none" value="${user.id}">
                            ${user.fio}
                    </td>
                    <td>${user.name}</td>
                    <td>${user.lastName}</td>
                    <td>
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