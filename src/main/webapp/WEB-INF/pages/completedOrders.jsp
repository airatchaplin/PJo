<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Завершенные заказы</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_hover.css">
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
        <a style="padding: 10px;color: #000000;text-decoration: none;" href="/orders">Действующие заказы</a>
        <a style="padding: 10px;color: #000000;text-decoration: none;" href="/completed_orders">Завершенные заказы</a>
        <a style="padding: 10px;color: #000000;text-decoration: none;" href="/addOrder">Добавить заказ</a>
    </div>
</nav>

<div class="main" >
    <table class="simple-little-table" cellspacing='0'>
        <thead>
        <tr>
            <th class="number_orders" style="text-align: center">№</th>
            <th >Объект</th>
            <th>Менеджер</th>
            <th >Деталь</th>
            <th>Дата запуска в производство</th>
            <th >Дата готовности заказа</th>
            <th>Коментарий</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${completed_order}" var="order">
            <tr>
                <td><a style="display: block" href="orders/${order.id}">${order.numberOrder}</a></td>
                <td><a style="display: block" href="orders/${order.id}">${order.objectName.name}</a></td>
                <td><a style="display: block" href="orders/${order.id}">${order.manager.fio_i_o}</a></td>

                <td>
                    <c:forEach items="${order.detailInfos}" var="detail">
                        <pre> ${detail.detail.name} </pre>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach items="${order.detailInfos}" var="detail">
                        <pre> ${detail.count} </pre>
                    </c:forEach>
                </td>
                <td>
                        ${order.dateStart}
                <td>
                        ${order.dateEnd}
                <td>
                        ${order.comment}
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>