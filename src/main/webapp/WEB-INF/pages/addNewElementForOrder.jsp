<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Добавление деталей к заказу</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
            integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
            crossorigin="anonymous"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <style>
        a {
            color: #000000;
            text-decoration: none;
        }

        .table {
            width: 100%;
            border: none;
            margin-bottom: 20px;
        }

        .table thead th {
            font-weight: bold;
            text-align: left;
            border: none;
            padding: 10px 15px;
            background: #d8d8d8;
            font-size: 14px;
            border-left: 1px solid #ddd;
            border-right: 1px solid #ddd;
        }

        .table tbody td {
            text-align: left;
            border-left: 1px solid #ddd;
            border-right: 1px solid #ddd;
            padding: 10px 15px;
            font-size: 14px;
            vertical-align: top;
        }

        .table thead tr th:first-child, .table tbody tr td:first-child {
            border-left: none;
        }

        .table thead tr th:last-child, .table tbody tr td:last-child {
            border-right: none;
        }

        .table tbody tr:nth-child(even) {
            background: #f3f3f3;
        }

        .table > :not(caption) > * > * {
            border-bottom-width: 0px;
        }
    </style>
</head>
<body>
<nav style="position: fixed;
    box-shadow: 0 0 5px;
    display: flex;
    justify-content: space-between;
    right: 0;
    left: 0;
    padding: 15px;
    background: #d1d1d1;
    top: 0;">

    <div>
        <a style="padding: 10px;color: #000000;text-decoration: none;" href="/">Главная страница</a>
        <a style="padding: 10px;color: #000000;text-decoration: none;" href="/orders">Заказы </a>
        <a style="padding: 10px;color: #000000;text-decoration: none;" href="/details">Детали</a>
        <a style="padding: 10px;color: #000000;text-decoration: none;" href="/materials">Материалы </a>
        <a style="padding: 10px;color: #000000;text-decoration: none;display: ${manager.roles.get(0).name.equals("ROLE_USER")?"none":"contents"}"
           href="/admin/managers">Менеджеры </a>
        <a style="padding: 10px;color: #000000;text-decoration: none;"
           href="/contragents">Контрагенты </a>
        <a style="padding: 10px;color: #000000;text-decoration: none;" href="/workbenches">Станки </a>
    </div>
    <div>
        <a style="padding: 10px;color: #000000;text-decoration: none;" href="/personalArea">${manager.fio_i_o} </a>
        <a style="padding: 10px;color: #000000;text-decoration: none;" href="/logout">Выход </a>
    </div>
</nav>

<nav style="position: fixed;
    box-shadow: 0 5px 5px -5px;
    display: flex;
    justify-content: space-between;
    right: 0;
    left: 0;
    background: #f2f2f2;
    padding: 15px;
    top: 0;
    margin-top: 60px;">
    <div>
        <a style="padding: 10px;color: #000000;text-decoration: none;"
           href="/orders/add/${order.getNumberOrder()}">Добавить
            элемент</a>
        <a style="padding: 10px;color: #000000;text-decoration: none;"
           href="/orders/change/${order.getNumberOrder()}">Изменить
            заказ</a>
        <a style="padding: 10px;color: #000000;text-decoration: none;"
           href="/orders/deletion/${order.getNumberOrder()}">Удалить
            заказ</a>
        <a style="padding: 10px;color: #000000;text-decoration: none;"
           href="/orders/check1/${order.getNumberOrder()}">Расчитать
            время</a>
    </div>
</nav>

<div class="main" style="margin-top: 120px">
    <form:form method="post">
    <h4>№ заказа ${order.getNumberOrder()}</h4>
    <h4>Объект ${order.getObjectName().getName()}</h4>
    <h4>Менеджер ${order.getManager().getFio_i_o()}</h4>

    <div class="info">
        <input style="display: none" type="text" name="numberOrder"
               value="${order.getNumberOrder()}">
        <table class="table">
            <thead>
            <tr>
                <th scope="col">
                    Деталь
                    <input type="button" style="margin: 10px" value="+" id="add_more_fields"/>
                    <input type="button" onclick="deleteRow()" value=" - ">
                </th>
                <th scope="col">Количество</th>
                <th scope="col">Дата запуска в производство</th>
                <th scope="col">Добавить</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>
                    <select class="form-control" name="detailName">
                        <option value="Выбирите деталь">Выбирите деталь</option>
                        <c:forEach items="${details}" var="detail">
                            <option value="${detail.getName()}">${detail.getName()}</option>
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
                <td>
                    <button class="form-control" style="width: auto;background-color: #0d6efd;color: #fff;" type="submit">Добавить</button>
                </td>
            </tr>
            </tbody>
        </table>
        </form:form>
    </div>
</div>

</body>
<script>
    $('#add_more_fields').click(function () {
        var html = '';
        html += '<tr id="row1">';
        html += '<td><select class="form-control" name="detailName"> <option value="Выбирите деталь">Выбирите деталь</option><c:forEach items="${details}" var="detail"> <option value="${detail.getName()}">${detail.getName()}</option></c:forEach> </select> </td>';
        html += '<td><input type="text" class="form-control" id="countDetail" name="countDetail" placeholder="Количество"> </td>';
        html += '<td><div class="col-sm-6"> <input type="datetime-local" class="form-control" id="dateStart" name="dateStart"> </div></td>';
        html += '</tr>';
        $('table').append(html);
    });

    function deleteRow() {
        $("#row1").remove();
    }

</script>
</html>