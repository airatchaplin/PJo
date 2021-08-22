<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Изменение заказа</title>
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
           href="/managers">Менеджеры </a>
        <a style="padding: 10px;color: #000000;text-decoration: none;"
           href="/contragents">Контрагенты </a>
        <a style="padding: 10px;color: #000000;text-decoration: none;" href="/workbenches">Станки </a>
    </div>
    <div>
        <a style="padding: 10px;color: #000000;text-decoration: none;display: ${user.roles.get(0).name.equalsIgnoreCase("ROLE_ADMIN") ? "contents" : "none"}" href="/admin/allUsers">Все
            пользователи
        </a>
        <a style="padding: 10px;color: #000000;text-decoration: none;" href="/personalArea">${user.fio_i_o} </a>
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
        <a style="padding: 10px;color: #000000;text-decoration: none;" href="/orders/add/${order.id}">Добавить
            элемент</a>
        <a style="padding: 10px;color: #000000;text-decoration: none;"
           href="/orders/change/${order.id}">Изменить заказ</a>
        <a style="padding: 10px;color: #000000;text-decoration: none;"
           href="/orders/deletion/${order.id}">Удалить заказ</a>
        <a style="padding: 10px;color: #000000;text-decoration: none;" href="/orders/check1/${order.id}">Расчитать
            время</a>
    </div>
</nav>

<div class="main" style="margin-top: 120px">
    <h4>№ заказа ${order.numberOrder}</h4>
    <h4>Объект ${order.objectName.name}</h4>
    <h4>Менеджер ${order.manager.fio_i_o}</h4><br>

    <table class="table">
        <thead>
        <tr>
            <th scope="col">Деталь</th>
            <th scope="col">Количество</th>
            <th scope="col">Дата запуска в производство</th>
            <th scope="col">Дата готовности заказа</th>
            <th scope="col">Покраска</th>
            <th scope="col">Упаковка</th>
            <th scope="col">Изменить</th>
        </tr>
        </thead>
        <tbody>
        <form:form method="post">
        <c:forEach items="${order.detailInfos}" var="ord">
            <tr>
                <td>
                    <select class="form-control" name="detailId">
                        <option>Выбранная: ${ord.detail.name}</option>
                        <c:forEach items="${details}" var="detail">
                            <option value="${detail.id}">${detail.name}</option>
                        </c:forEach>
                    </select>
                </td>
                <td>
                    <div>
                        <input type="text" class="form-control" id="countDetail" name="countDetail"
                               placeholder="${ord.getCount()}" value="${ord.getCount()}" required>
                    </div>
                </td>
                <td>
                    <div>
                        <input type="datetime-local" class="form-control" id="dateStart"
                               name="dateStart">
                    </div>
                </td>
                <td>
                    <div>
                        <input type="datetime-local" class="form-control" id="dateEnd" name="dateEnd"
                        >
                    </div>
                </td>
                <td>
                    <div>
                        <input type="time" class="form-control" value="00:00" id="painting" name="painting">
                    </div>
                </td>
                <td>
                    <div>
                        <input type="time" class="form-control" value="00:00" id="packing" name="packing">
                    </div>
                </td>
                <td>
                    <button class="form-control" style="width: auto;background-color: #0d6efd;color: #fff;display: ${ord.getIncrement()== 0 ?"block":"none"}" type="submit">Изменить заказ</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div>
        <input style="margin: 10px;" type="text" class="form-control" id="comment" name="comment"
               placeholder="Новый коментарий">
    </div>
    </form:form>
</div>
</body>
</html>