<%@ page import="com.example.pozhiloyproject.services.DetailsOrderService" %>
<%@ page import="com.example.pozhiloyproject.services.OrderService" %>
<%@ page import="com.example.pozhiloyproject.repository.OrderRepository" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Добавление заказа</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<jsp:include page="../nav/order_nav_main.jsp"></jsp:include>
<form:form method="post">
    <jsp:include page="../nav/nav_third_save.jsp"></jsp:include>

    <div class="main">

        <table class="simple-little-table" cellspacing='0'>
            <thead>
            <tr>
                <th class="number_orders">№</th>
                <th>Контрагент</th>
                <th>Менеджер</th>
                <th>
                    Деталь
                        <%--                    <input class="input_js" type="button" style="margin: 10px" value="+" id="add_more_fields"/>--%>
                        <%--                    <input class="input_js" type="button" onclick="deleteRow()" value=" - ">--%>
                    <button class="input_js" type="button" id="add_more_fields">
                        <img style="width: 12px" src="../../resources/icon/plus.png" alt=""></button>
                    <button class="input_js" type="button" onclick="deleteRow()">
                        <img style="width: 12px" src="../../resources/icon/minus.png" alt=""></button>
                </th>
                <th>Количество</th>
                <th>Комментарий</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>
                    <input class="number_orders" style="width: 50px;" type="text" class="form-control" id="numberOrder"
                           name="numberOrder"
                           placeholder="№" value="" required>
                </td>
                <td>
                    <select class="form-control" name="contragentId">
                        <c:forEach items="${contragents}" var="contragent">
                            <option value="${contragent.id}">${contragent.name}</option>
                        </c:forEach>
                    </select>
                </td>
                <td>
                    <select class="form-control" name="managerId">
                        <c:forEach items="${managers}" var="manager">
                            <option value="${manager.id}">${manager.fio_i_o}</option>
                        </c:forEach>
                    </select>
                </td>
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
                <td>
                    <input type="text" class="form-control" id="comment"
                           name="comment"
                           placeholder="Введите комментарий">
                </td>
            </tr>
            </tbody>
        </table>
        <div class="error-text">
                ${numberOrderError}
        </div>
    </div>
</form:form>


</body>

<script>
    var count = 1;
    $('#add_more_fields').click(function () {
        var html = '';
        html += '<tr id="row1">';
        html += '<td></td>';
        html += '<td></td>';
        html += '<td></td>';
        html += '<td><select class="form-control" name="detailId"> <option value="Выбирите деталь">Выбирите деталь</option><c:forEach items="${details}" var="detail"> <option value="${detail.id}">${detail.name}</option></c:forEach> </select> </td>';
        html += '<td><input type="text" class="form-control" id="countDetail" name="countDetail" placeholder="Количество" required> </td>';
        html += '<td></td>';
        html += '</tr>';
        $('table').append(html);
        count++;
    });

    function deleteRow() {
        $("#row1").remove();
    }

</script>

</html>