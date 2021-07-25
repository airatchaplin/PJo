<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Getting Started: Serving Web Content</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../css/style.css" type="text/css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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
        .table tbody tr:nth-child(even){
            background: #f3f3f3;
        }
        .table>:not(caption)>*>* {
            border-bottom-width: 0px;
        }
    </style>
</head>
<body>
<header style="height: 50px;
    text-align: center;background: #d1d1d1;">
    <a style="padding: 10px;color: #000000;text-decoration: none;" href="/">Главная страница</a>
    <a style="padding: 10px;color: #000000;text-decoration: none;" href="/orders">Заказы </a>
    <a style="padding: 10px;color: #000000;text-decoration: none;" href="/details">Детали</a>
    <a style="padding: 10px;color: #000000;text-decoration: none;" href="/materials">Материалы </a>
    <a style="padding: 10px;color: #000000;text-decoration: none;" href="/managers">Менеджеры </a>
    <a style="padding: 10px;color: #000000;text-decoration: none;" href="/contragents">Контрагенты </a>
    <a style="padding: 10px;color: #000000;text-decoration: none;" href="/workbenches">Станки </a>
</header>

<div class="postHeader" style="background: #f2f2f2;text-align: center;padding: 5px;">
    <a style="padding: 10px;color: #000000;text-decoration: none;" href="/orders">Действующие заказы</a>
    <a style="padding: 10px;color: #000000;text-decoration: none;" href="/completed_orders">Завершенные заказы</a>
    <a style="padding: 10px;color: #000000;text-decoration: none;" href="/addOrder">Добавить заказ</a>
</div>

<h1>Завершенные заказы</h1>


<table class="table">
    <thead>
    <tr>

        <th scope="col">№ заказа</th>
        <th scope="col">Объект</th>
        <th scope="col">Менеджер</th>
        <th scope="col">Деталь</th>
        <th scope="col">Количество</th>
        <th scope="col">Дата запуска в производство</th>
        <th scope="col">Дата готовности заказа</th>
        <th scope="col">Коментарий</th>
    </tr>
    </thead>
    <tbody>

    <c:forEach items="${completed_order}" var="order">

        <tr>
            <td>${order.getNumberOrder()}</td>
            <td>${order.getObjectName().getName()}</td>
            <td>${order.getManager().getFio_i_o()}</td>
            <td>
                <c:forEach items="${order.getDetailInfos()}" var="detail">
                    <pre> ${detail.getDetail().getName()} </pre>
                </c:forEach>
            </td>
            <td>
                <c:forEach items="${order.getDetailInfos()}" var="detail">
                    <pre> ${detail.getCount()} </pre>
                </c:forEach>
            </td>
            <td>
                    ${order.getDateStart()}
            <td>

                    ${order.getDateEnd()}

            <td>
                    ${order.getComment()}
            </td>
        </tr>

    </c:forEach>


    </tbody>
</table>


</body>
</html>