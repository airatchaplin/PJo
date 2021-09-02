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
            <a href="/orders/add/${order.id}">Добавить элемент</a>
            <a href="/orders/change/${order.id}">Изменить заказ</a>
            <a href="/orders/deletion/${order.id}">Удалить заказ</a>
            <a href="/orders/check1/${order.id}">Расчитать время</a>
        </div>
        <div>
            <input style="background: #f2f2f2; border: 0;cursor: pointer" type="submit" value="Сохранить">
        </div>
    </nav>

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

        <table id="tablAdd" style="margin-top: 8px" class="simple-little-table" cellspacing='0'>
            <thead>
            <tr>
                <th>Деталь
                    <input class="input_js" type="button" style="margin: 10px;cursor: pointer" value="+" id="add_more_fields"/>
                    <input class="input_js" type="button" style="cursor: pointer" onclick="deleteRow()" value=" - ">
                </th>
                <th>Количество</th>
                <th>Дата запуска в производство</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>
                    <select class="form-control" name="detailId">
                        <option value="Выбирите деталь">Выбирите деталь</option>
                        <c:forEach items="${details}" var="detail">
                            <option value="${detail.id}">${detail.name}</option>
                        </c:forEach>
                    </select>
                    <div class="error" style="color: red;text-align: center">
                            ${detailError}
                    </div>
                </td>
                <td>
                    <input type="text" class="form-control" id="countDetail" name="countDetail"
                           placeholder="Количество">
                    <div class="error" style="color: red;text-align: center">
                            ${countDetailError}
                    </div>
                </td>
                <td>
                    <div class="col-sm-6">
                        <input type="datetime-local" class="form-control" id="dateStart"
                               name="dateStart">
                    </div>
                </td>

            </tr>
            </tbody>
        </table>

    </div>
</form:form>
</body>
<script>
    $('#add_more_fields').click(function () {
        var html = '';
        html += '<tr id="row1">';
        html += '<td><select class="form-control" name="detailName"> <option value="Выбирите деталь">Выбирите деталь</option><c:forEach items="${details}" var="detail"> <option value="${detail.getName()}">${detail.getName()}</option></c:forEach> </select> </td>';
        html += '<td><input type="text" class="form-control" id="countDetail" name="countDetail" placeholder="Количество"> </td>';
        html += '<td><div class="col-sm-6"> <input type="datetime-local" class="form-control" id="dateStart" name="dateStart"> </div></td>';
        html += '</tr>';
        var tabl = document.getElementById('tablAdd')
        $(tabl).append(html);
    });

    function deleteRow() {
        $("#row1").remove();
    }

</script>
</html>