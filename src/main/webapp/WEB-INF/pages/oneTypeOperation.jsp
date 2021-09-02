<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Операция</title>
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

<nav class="nav-second">
    <div>
        <a href="/typeOperations/addTypeOperation">Добавить операцию</a>
        <a href="/typeOperations/change/${operation.id}">Изменить
            операцию</a>
        <a href="/typeOperations/deletion/${operation.id}">Удалить
            операцию</a>
    </div>
</nav>

<div class="main">
    <table class="simple-little-table" cellspacing='0'>
        <thead>
        <tr>
            <th>Операция</th>
            <th>Станки операции</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${operation.name}</td>
            <td>
                <c:forEach items="${workbenches}" var="workbench">
                    <pre>${workbench.name}</pre>
                </c:forEach>
            </td>
        </tr>
        </tbody>
    </table>
</div>

</body>
</html>