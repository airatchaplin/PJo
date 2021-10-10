<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Завершенный заказ</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
</head>
<body>
<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<jsp:include page="../nav/order_nav_main.jsp"></jsp:include>


<div class="main">
    <table class="simple-little-table" cellspacing='0'>
        <thead>
        <tr>
            <th>№ заказа</th>
            <th>Контрагент</th>
            <th>Экономист</th>
            <th>Менеджер</th>
            <th>Дата запуска в производство</th>
            <th>Дата готовности заказа</th>
            <%--                <th>Покраска Н/Д/Ч/М</th>--%>
            <%--                <th>Упаковка Н/Д/Ч/М</th>--%>
            <th>Коментарий</th>
        </tr>
        </thead>
        <tbody>

        <tr>
            <td> ${completed_order.numberOrder} </td>
            <td> ${completed_order.objectName} </td>
            <td>${completed_order.manager} </td>
            <td>${completed_order.economist} </td>
            <td>
                ${completed_order.dateStartOrder}
            </td>
            <td>
                ${completed_order.dateEndOrder}
            </td>
            <td>
                ${completed_order.comment}
            </td>
        </tr>
        </tbody>
    </table>


    <table style="margin-top: 8px" class="simple-little-table" cellspacing='0'>
        <thead>
        <tr>
            <th>Деталь</th>
            <th>Материал</th>
            <th>Количество</th>
            <th>Дата запуска детали</th>
            <th>Дата готовности детали</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${completed_order.detailsOrders}" var="ord">
            <tr>
                <td>
                        ${ord.detailOrder.name}
                </td>
                <td>
                        ${ord.detailOrder.material.name} ${ord.detailOrder.material.thickness}мм
                </td>
                <td>
                        ${ord.count}
                </td>
                <td>
                        ${ord.detailOrder.dateStartDetail}
                </td>
                <td>
                        ${ord.detailOrder.dateEndDetail}
                </td>
            </tr>
            <c:set var="count" value="${count + 1}" scope="page"/>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>