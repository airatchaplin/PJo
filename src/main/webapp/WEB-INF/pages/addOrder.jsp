<%@ page import="com.example.pozhiloyproject.services.DetailInfoService" %>
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

    <%--    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">--%>
    <%--    <link rel="stylesheet"--%>
    <%--          href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.14/css/bootstrap-select.min.css"/>--%>
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

        .no-results active {
            display: none;
        }

        .table > :not(:last-child) > :last-child > * {
            border-bottom-color: #dee2e6;
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
           href="/managers">Менеджеры </a>
        <a style="padding: 10px;color: #000000;text-decoration: none;"
           href="/contragents">Контрагенты </a>
        <a style="padding: 10px;color: #000000;text-decoration: none;" href="/workbenches">Станки </a>
    </div>
    <div>
        <a style="padding: 10px;color: #000000;text-decoration: none;" href="/personalArea">${user.fio_i_o} </a>
        <a style="padding: 10px;color: #000000;text-decoration: none;" href="/logout">Выход </a>
    </div>
</nav>

<div class="main" style="margin-top: 60px">
    <div class="info">
        <form:form method="post">
            <div class="col-sm-6" style="display: flex">
                <label style="margin-left: 10px;margin-top: 15px;width: 60%;" for="numberOrder" class="form-label">Номер
                    заказа</label>
                <input style="margin: 10px;" type="text" class="form-control" id="numberOrder"
                       name="numberOrder"
                       placeholder="Введите номер детали" value="" required>
            </div>
            <div class="error" style="color: red;">
                    ${numberOrderError}
            </div>
            <div class="col-sm-6" style="display: flex">
                <label style="margin-left: 10px;margin-top: 15px;width: 60%;" for="numberOrder" class="form-label">Выбирете
                    контрагента</label>
                <select style="margin: 10px;" class="form-control" name="objectName">
                    <c:forEach items="${contragents}" var="contragent">
                        <option value="${contragent.getName()}">${contragent.getName()}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-sm-6" style="display: flex">
                <label style="margin-left: 10px;margin-top: 15px;width: 60%;" for="numberOrder" class="form-label">Менеджер</label>
                <select style="margin: 10px;" class="form-control" name="manager">
                    <c:forEach items="${managers}" var="manager">
                    <option value="${manager.getFio_i_o()}">${manager.getFio_i_o()}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-sm-6" style="display: flex">
                <label style="margin-left: 10px;margin-top: 15px;width: 60%;" for="numberOrder" class="form-label">Коментарий</label>
                <input style="margin: 10px;" type="text" class="form-control" id="comment"
                       name="comment"
                       placeholder="Введите коментарий">
            </div>
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
                        <div>
                            <input type="datetime-local" class="form-control" id="dateStart"
                                   name="dateStart">
                        </div>
                    </td>
                    <td>
                        <button class="form-control" style="width: auto;background-color: #0d6efd;color: #fff;"
                                type="submit">Добавить заказ
                        </button>
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
        html += '<td><input type="text" class="form-control" id="countDetail" name="countDetail" placeholder="Количество" required> </td>';
        html += '<td><div> <input type="datetime-local" class="form-control" id="dateStart" name="dateStart"> </div></td>';
        html += '</tr>';
        $('table').append(html);
    });

    function deleteRow() {
        $("#row1").remove();
    }

</script>

</html>