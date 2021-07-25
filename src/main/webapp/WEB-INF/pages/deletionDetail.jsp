<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Getting Started: Serving Web Content</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
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
    <a style="padding: 10px;color: #000000;text-decoration: none;" href="/addDetail">Добавить деталь</a>
    <a style="padding: 10px;color: #000000;text-decoration: none;"
       href="/details/change/${detail.getName()}">Изменить
        деталь</a>
    <a style="padding: 10px;color: #000000;text-decoration: none;"
       href="/details/deletion/${detail.getName()}">Удалить
        деталь</a>
</div>


<h1>Удаление детали</h1>

<table class="table">
    <thead>
    <tr>
        <th scope="col">Деталь</th>
        <th scope="col">Материал</th>
        <th scope="col">Станки</th>
        <th scope="col">Время детали на этом станке</th>
        <th scope="col">Удалить</th>
    </tr>
    </thead>
    <tbody>


    <tr>

        <td>${detail.getName()}</td>
        <td>${detail.getMaterial().getName()}</td>
        <td>
            <c:forEach items="${detail.getWorkBenches()}" var="workbench">
                <pre>${workbench.getName()}</pre>
            </c:forEach>
        </td>
        <td>
            <c:forEach items="${detail.getTimeWorkDetails()}" var="timeWork">
                <pre>${timeWork.getTimeWork()}</pre>
            </c:forEach>
        </td>
        <td>
            <form:form action="/details/deletion/${detail.getName()}"
                       method="post">
                <button class="form-control" style="width: auto;background-color: #0d6efd;color: #fff;" type="submit">
                    Удалить
                </button>
            </form:form>
        </td>

    </tr>


    </tbody>
</table>
<label style="color: red">${detailError}</label>
</body>

</html>