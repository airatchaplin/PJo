<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Удаление заказа</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
</head>
<body>
<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<jsp:include page="../nav/order_nav_second.jsp"></jsp:include>
<form:form action="/orders/deletion/${order.id}" method="post">
    <jsp:include page="../nav/nav_third_del.jsp"></jsp:include>
</form:form>

<div class="main">
    <table class="simple-little-table" cellspacing='0'>
        <thead>
        <tr>
            <th class="number_orders" style="text-align: center">№</th>
            <th>Контрагент</th>
            <th>Экономист</th>
            <th>Менеджер</th>
            <th>Дата запуска в производство</th>
            <th>Дата готовности заказа</th>
            <th>Коментарий</th>
        </tr>
        </thead>
        <tbody>

        <tr>

            <td class="number_orders" style="text-align: center"> ${order.numberOrder} </td>
            <td> ${order.objectName.name} </td>
            <td>${order.economist.fio_i_o} </td>
            <td>${order.manager.fio_i_o} </td>
            <td>
                ${dateStartOrder}
            </td>
            <td>
                ${dateEnd}
            </td>
            <td>
                ${order.comment}
            </td>
        </tr>
        </tbody>
    </table>

    <table style="margin-top: 8px" class="simple-little-table" cellspacing='0'>
        <thead>
        <tr>
            <th scope="col">Деталь</th>
            <th scope="col">Количество</th>
            <c:if test="${order.calculated}">
            </c:if>
            <c:if test="${!order.calculated}">
                <th scope="col">Удалить</th>
            </c:if>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${order.detailsOrders}" var="ord">
            <tr>
                <td>
                        ${ord.detailOrder.name}
                </td>
                <td>
                        ${ord.count}
                </td>

                <c:if test="${order.calculated}">
                </c:if>
                <c:if test="${!order.calculated}">
                    <td style="padding: 0;width: 1%;">
                        <form method="post" action="/orders/deletion/${order.id}/${ord.increment}">
                            <button style="color: black;width: 150px;height: 50px;background: #d1d1d100;font-variant: all-small-caps;"
                                    type="submit"
                                    onclick="window.location.href = '/orders/deletion/${order.id}/${ord.increment}';">
                                Удалить
                            </button>
                        </form>
                    </td>
                </c:if>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div class="error-text">
    ${errorDelete}
</div>

</body>
</html>