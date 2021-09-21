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
<form:form method="post">
    <nav class="nav-second">
        <div>
            <a href="/orders">Действующие заказы</a>
            <a href="/completed_orders">Завершенные заказы</a>
            <a href="/addOrder">Добавить заказ</a>
        </div>
        <div>
            <input style="background: #f2f2f2; border: 0;" type="submit" value="Сохрнаить">
        </div>
    </nav>
    <div class="main">


<%--        <div class="col-sm-6" style="display: flex">--%>
<%--            <label style="margin-left: 10px;margin-top: 15px;width: 60%;" for="numberOrder" class="form-label">Номер--%>
<%--                заказа</label>--%>
<%--            <input style="margin: 10px;" type="text" class="form-control" id="numberOrder"--%>
<%--                   name="numberOrder"--%>
<%--                   placeholder="Введите номер детали" value="" required>--%>
<%--        </div>--%>
<%--        <div class="error" style="color: red;">--%>
<%--                ${numberOrderError}--%>
<%--        </div>--%>
<%--        <div class="col-sm-6" style="display: flex">--%>
<%--            <label style="margin-left: 10px;margin-top: 15px;width: 60%;" for="numberOrder" class="form-label">Выбирете--%>
<%--                контрагента</label>--%>
<%--            <select style="margin: 10px;" class="form-control" name="contragentId">--%>
<%--                <c:forEach items="${contragents}" var="contragent">--%>
<%--                    <option value="${contragent.id}">${contragent.name}</option>--%>
<%--                </c:forEach>--%>
<%--            </select>--%>
<%--        </div>--%>
<%--        <div class="col-sm-6" style="display: flex">--%>
<%--            <label style="margin-left: 10px;margin-top: 15px;width: 60%;" for="numberOrder"--%>
<%--                   class="form-label">Менеджер</label>--%>
<%--            <select style="margin: 10px;" class="form-control" name="managerId">--%>
<%--                <c:forEach items="${managers}" var="manager">--%>
<%--                    <option value="${manager.id}">${manager.fio_i_o}</option>--%>
<%--                </c:forEach>--%>
<%--            </select>--%>
<%--        </div>--%>
<%--        <div class="col-sm-6" style="display: flex">--%>
<%--            <label style="margin-left: 10px;margin-top: 15px;width: 60%;" for="numberOrder" class="form-label">Коментарий</label>--%>
<%--            <input style="margin: 10px;" type="text" class="form-control" id="comment"--%>
<%--                   name="comment"--%>
<%--                   placeholder="Введите коментарий">--%>
<%--        </div>--%>
        <table class="simple-little-table" cellspacing='0'>
            <thead>
            <tr>
                <th class="number_orders" >№</th>
                <th>Контрагент</th>
                <th>Менеджер</th>
                <th>
                    Деталь
                    <input class="input_js" type="button" style="margin: 10px" value="+" id="add_more_fields"/>
                    <input class="input_js" type="button" onclick="deleteRow()" value=" - ">
                </th>
                <th>Количество</th>
                <th>Дата запуска в производство</th>
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
                    <select  class="form-control" name="managerId">
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
                        <%--                        <select class="selectpicker" data-show-subtext="true" data-live-search="true" name="detailName">--%>
                        <%--                            <option value="Выбирите деталь">Выбирите деталь</option>--%>
                        <%--                            <c:forEach items="${details}" var="detail">--%>
                        <%--                                <option data-subtext="Длина:${detail.length} Ширина:${detail.width} Толщина:${detail.thickness}"--%>
                        <%--                                        value="${detail.getName()}">${detail.getName()}</option>--%>
                        <%--                            </c:forEach>--%>
                        <%--                        </select>--%>
                </td>
                <td>
                    <input type="text" class="form-control" id="countDetail" name="countDetail"
                           placeholder="Количество" required>
                </td>
                <td>
                    <input type="datetime-local" class="form-control" id="dateStart"
                           name="dateStart">
                </td>
                <td>
                    <input type="text" class="form-control" id="comment"
                           name="comment"
                           placeholder="Введите комментарий">
                </td>
            </tr>
            </tbody>
        </table>
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
        if (count%2===0){
            html += '<td><select class="form-control" name="detailId"> <option value="Выбирите деталь">Выбирите деталь</option><c:forEach items="${details}" var="detail"> <option value="${detail.id}">${detail.name}</option></c:forEach> </select> </td>';
        }else{
            html += '<td><select style="background: -webkit-gradient(linear, left top, left bottom, from(#f8f8f8), to(#f6f6f6));" class="form-control" name="detailId"> <option value="Выбирите деталь">Выбирите деталь</option><c:forEach items="${details}" var="detail"> <option value="${detail.id}">${detail.name}</option></c:forEach> </select> </td>';
        }
        if (count%2===0){
            html += '<td><input type="text" class="form-control" id="countDetail" name="countDetail" placeholder="Количество" required> </td>';
        }else{
            html += '<td><input style="background: -webkit-gradient(linear, left top, left bottom, from(#f8f8f8), to(#f6f6f6));" type="text" class="form-control" id="countDetail" name="countDetail" placeholder="Количество" required> </td>';
        }
        if (count%2===0){
            html += '<td><div> <input type="datetime-local" class="form-control" id="dateStart" name="dateStart"> </div></td>';
        }else{
            html += '<td><div> <input style="background: -webkit-gradient(linear, left top, left bottom, from(#f8f8f8), to(#f6f6f6));" type="datetime-local" class="form-control" id="dateStart" name="dateStart"> </div></td>';
        }
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