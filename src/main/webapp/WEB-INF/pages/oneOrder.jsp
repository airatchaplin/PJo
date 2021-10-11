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

                <td class="number_orders" style="text-align: center"> ${order.numberOrder}</td>
                <td> ${order.objectName}</td>
                <td>${order.manager}</td>
                <td>${order.manager}</td>
                <td>
                        ${order.dateStartOrder}
                </td>
                <td>
                        ${order.dateEnd}
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
                <th></th>
                <th>Дата запуска</th>
                <th>Дата окончания</th>
            </tr>
            </thead>
            <tbody>

            <tr>
                <td>Производство</td>
                <td>${order.dateStartOrder}</td>
                <td>${order.dateEndOrder}</td>
            </tr>
            <tr>
                <td>Упаковка</td>
                <td>${order.dateStartFirstPackage}</td>
                <td>${order.dateEndFirstPackage}</td>
            </tr>
            <tr>
                <td>Покраска</td>
                <td>${order.dateStartPainting}</td>
                <td>${order.dateEndPainting}</td>
            </tr>
            <tr>
                <td>Упаковка после покраски</td>
                <td>${order.dateStartSecondPackage}</td>
                <td>${order.dateEndSecondPackage}</td>
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
            <c:forEach items="${order.detailsOrders}" var="ord">
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
</form:form>
</body>
</html>