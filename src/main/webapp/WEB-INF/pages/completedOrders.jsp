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
<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<jsp:include page="../nav/order_nav_main.jsp"></jsp:include>
<form:form method="post">
    <jsp:include page="../nav/nav_third_completed_orders.jsp"></jsp:include>
</form:form>
<div class="main">
    <table class="simple-little-table" cellspacing='0'>
        <thead>
        <tr>
            <th class="number_orders" style="text-align: center">№</th>
            <th>Объект</th>
            <th>Менеджер</th>
            <th>Экономист</th>
            <th>Дата запуска в производство</th>
            <th>Дата готовности заказа</th>
            <th>Коментарий</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${completed_order}" var="order">
            <tr>
                <td><a style="display: block" href="/completed_orders/${order.id}">${order.numberOrder}</a></td>
                <td><a style="display: block" href="/completed_orders/${order.id}">${order.objectName}</a></td>
                <td><a style="display: block" href="/completed_orders/${order.id}">${order.manager}</a></td>
                <td><a style="display: block" href="/completed_orders/${order.id}">${order.economist}</a></td>

                <td>
                    <a style="display: block" href="/completed_orders/${order.id}">${order.dateStartOrder}</a>
                </td>
                <td>
                    <a style="display: block" href="/completed_orders/${order.id}">${order.dateEndOrder}</a>
                </td>
                <td>
                    <a style="display: block" href="/completed_orders/${order.id}">${order.comment}</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>