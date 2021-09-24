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
            <th>№ заказа</th>
            <th>Контрагент</th>
            <th>Экономист</th>
            <th>Менеджер</th>
            <th>Дата запуска в производство</th>
            <th>Дата готовности заказа</th>
            <th>Покраска</th>
            <th>Упаковка</th>
            <th>Коментарий</th>
        </tr>
        </thead>
        <tbody>

        <tr>

            <td> ${order.numberOrder} </td>
            <td> ${order.objectName.name} </td>
            <td>${order.manager.fio_i_o} </td>
            <td>${order.manager.fio_i_o} </td>
            <td>
                ${order.dateStart}
            </td>
            <td>
                ${order.dateEnd}
            </td>

            <td>
                ${order.painting}
            </td>
            <td>
                ${order.packing}
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
            <th scope="col">Удалить</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${order.detailsOrders}" var="ord">
            <tr>
                <td>
                        ${ord.detail.name}
                </td>
                <td>
                        ${ord.count}
                </td>

                <td class="deletElem">
                    <form:form action="/orders/deletion/${order.id}/${ord.increment}"
                               method="post">
                        <input style="border: 0;cursor: pointer" type="submit" value="&#128937;">
                    </form:form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>