<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Расчитывание времяни</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
</head>
<body>
<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<jsp:include page="../nav/order_nav_second.jsp"></jsp:include>
<form:form method="post">
    <nav class="nav-third">
        <div>
            <button class="button-nav-second" type="submit">Расчитать</button>
        </div>
    </nav>
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
            <th>Деталь</th>
            <th>Количество</th>
            <th>Станки по очередности производства детали</th>
            <th>Время окончания других заказов на этих станках</th>
            <th>Расчитано Да/нет</th>
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
                <td>
                    <c:forEach items="${ord.detail.detailInfos}" var="workbench">
                        <pre>${workbench.workBenches.name}</pre>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach items="${ord.detail.detailInfos}" var="workbench">
                        <pre>${workbench.workBenches.dateEndDetail}</pre>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach items="${ord.isCalculated}" var="isCalc">
                        <pre> ${isCalc?"Да":"Нет"}</pre>
                    </c:forEach>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>

</body>
</html>