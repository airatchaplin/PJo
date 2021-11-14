<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Добавление деталей к заказу</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<jsp:include page="../nav/order_nav_second.jsp"></jsp:include>
<form:form method="post">
    <jsp:include page="../nav/nav_third_save.jsp"></jsp:include>

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

        <c:if test="${order.calculated}">

        <div class="error-text">
            Добавлять детали к заказу можно только к нерасчитанному заказу!
        </div>
        <table id="tablAdd" style="margin-top: 8px;display: none" class="simple-little-table" cellspacing='0'>
            </c:if>
            <c:if test="${!order.calculated}">
            <table id="tablAdd" style="margin-top: 8px" class="simple-little-table" cellspacing='0'>
                </c:if>
                <thead>
                <tr>
                    <th>Деталь
                        <button class="input_js" style="background: #89e1fe;" type="button" id="add_more_fields">
                            <img style="width: 12px" src="../../resources/icon/plus.png" alt=""></button>
                        <button class="input_js" style="background: #89e1fe;" type="button"
                                onclick="deleteRow()">
                            <img style="width: 12px" src="../../resources/icon/minus.png" alt=""></button>
                    </th>
                    <th>Количество</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${order.detailsOrders}" var="detailsOrders">
                    <tr>
                        <td>${detailsOrders.detailOrder.name}</td>
                        <td>${detailsOrders.count}</td>
                    </tr>
                </c:forEach>
                <tr>
                    <td>
                        <select class="form-control" name="detailId">
                            <option value="Выбирите деталь">Выбирите деталь</option>
                            <c:forEach items="${details}" var="detail">
                                <option value="${detail.id}">${detail.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>
                        <input type="text" class="form-control" id="countDetail" name="countDetail"
                               placeholder="Количество" required>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="error-text">
                    ${detailError}
            </div>

    </div>
</form:form>
</body>
<script>
    $('#add_more_fields').click(function () {
        var html = '';
        html += '<tr id="row1">';
        html += '<td><select class="form-control" name="detailId"><option value="Выбирите деталь">Выбирите деталь</option><c:forEach items="${details}" var="detail"><option value="${detail.id}">${detail.name}</option></c:forEach> </select></td>';
        html += '<td><input type="text" class="form-control" id="countDetail" name="countDetail" placeholder="Количество"> </td>';
        html += '</tr>';
        var tabl = document.getElementById('tablAdd')
        $(tabl).append(html);
    });

    function deleteRow() {
        $("#row1").remove();
    }

</script>
</html>