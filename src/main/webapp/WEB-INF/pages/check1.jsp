<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Расчитывание времяни</title>
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
    <h4>№ заказа ${order.getNumberOrder()}</h4>
    <h4>Объект ${order.getObjectName().getName()}</h4>
    <h4>Менеджер ${order.getManager().getFio_i_o()}</h4>
    <c:forEach items="${order.getDetailInfos()}" var="ord">
        <table class="table">
            <thead>
            <tr>
                <th scope="col">Деталь</th>
                <th scope="col">Количество</th>
                <th scope="col">Станки по очередности производства детали</th>
                <th scope="col">Время окончания других заказов на этих станках</th>
                <th scope="col">Расчитано Да/нет</th>
                <th scope="col">Расчитать</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>
                        ${ord.getDetail().getName()}
                </td>
                <td>
                        ${ord.getCount()}
                </td>
                <td>
                    <c:forEach items="${ord.getDetail().getWorkBenches()}" var="workbench">
                        <pre>${workbench.getName()}</pre>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach items="${ord.getDetail().getWorkBenches()}" var="workbench">
                        <pre>${workbench.getDateEndDetail()}</pre>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach items="${ord.getIsCalculated()}" var="isCalc">
                        <pre> ${isCalc?"Да":"Нет"}</pre>
                    </c:forEach>
                </td>
                <td>
                    <form:form method="post">
                        <button class="form-control" style="width: auto;background-color: #0d6efd;color: #fff;" type="submit">Расчитать</button>
                    </form:form>
                </td>
            </tr>
            </tbody>
        </table>
    </c:forEach>
</div>

</body>
</html>