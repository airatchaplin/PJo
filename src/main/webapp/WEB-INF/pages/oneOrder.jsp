<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Заказ</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
</head>
<body>
<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<jsp:include page="../nav/order_nav_second.jsp"></jsp:include>
<form:form action="/orders/${order.id}" method="post">
    <jsp:include page="../nav/nav_third_complete.jsp"></jsp:include>

    <div class="main">
        <table class="simple-little-table" cellspacing='0'>
            <thead>
            <tr>
                <th>№ заказа</th>
                <th>Контрагент</th>
                <th>Экономист</th>
                <th>Менеджер</th>
<%--                <th>Дата запуска в производство</th>--%>
<%--                <th>Дата готовности заказа</th>--%>
                <th>Покраска Н/Д/Ч/М</th>
                <th>Упаковка Н/Д/Ч/М</th>
                <th>Коментарий</th>
            </tr>
            </thead>
            <tbody>

            <tr>

                <td> ${order.numberOrder} </td>
                <td> ${order.objectName.name} </td>
                <td>${order.manager.fio_i_o} </td>
                <td>${order.manager.fio_i_o} </td>
<%--                <td>--%>
<%--                        ${order.dateStart}--%>
<%--                </td>--%>
<%--                <td>--%>
<%--                        ${order.dateEnd}--%>
<%--                </td>--%>

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
                <th>Деталь</th>
                <th>Материал</th>
                <th>Количество</th>
<%--                <th>Дата запуска детали</th>--%>
<%--                <th>Дата готовности детали</th>--%>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${order.detailsOrders}" var="ord">
                <tr>
                    <td>
                            ${ord.detail.name}
                    </td>
                    <td>
                            ${ord.detail.material.name} ${ord.detail.material.thickness}мм
                    </td>
                    <td>
                            ${ord.count}
                    </td>
<%--                    <td>--%>
<%--                            ${ord.dateStart}--%>
<%--                    </td>--%>
<%--                    <td>--%>
<%--                            ${ord.dateEnd}--%>
<%--                    </td>--%>
                </tr>
                <c:set var="count" value="${count + 1}" scope="page"/>
            </c:forEach>
            </tbody>
        </table>
    </div>
</form:form>
</body>
</html>