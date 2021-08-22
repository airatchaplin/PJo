<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Детали</title>
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
        <a style="padding: 10px;color: #000000;text-decoration: none;" href="/addDetail">Добавить деталь</a>
    </div>
</nav>

<div class="main" style="margin-top: 120px">
    <table class="table">
        <thead>
        <tr>
            <th scope="col">Деталь</th>
            <th scope="col">Длина</th>
            <th scope="col">Ширина</th>
            <th scope="col">Материал</th>
            <th scope="col">Станки</th>
            <th scope="col">Время детали на этом станке</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${details}" var="detail">
            <tr>
                <td><a style="display: block" href="details/${detail.id}">${detail.name}</a></td>
                <td>${detail.length}</td>
                <td>${detail.width}</td>
                <td>${detail.material.name}</td>
                <td>
                    <c:set var="count" value="0" scope="page"/>
                    <% int count = 0; %>
                    <c:forEach items="${detail.workBenchDtos}" var="workbench">
                        <c:if test="${workbench.typeOperation.name.equals('ГИБКА')}">
                            <c:if test="${count>0}">
                                <pre style="font-size: 14px; color: red">Альтернатива: ${workbench.name}</pre>
                            </c:if>
                            <c:if test="${count==0}">
                                <pre style="font-size: 14px">${workbench.name}</pre>
                                <c:set var="count" value="${count + 1}" scope="page"/>
                            </c:if>
                        </c:if>
                        <c:if test="${!workbench.typeOperation.name.equals('ГИБКА')}">
                            <pre style="font-size: 14px">${workbench.name}</pre>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach items="${detail.timeWorkDetailsDtos}" var="timeWork">
                        <pre style="font-size: 14px">${timeWork.timeWork}</pre>
                    </c:forEach>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>