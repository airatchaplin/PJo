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

<div class="container1">
    <form:form method="post">
    <h1 style="text-align: center">Добавление элемента к заказу</h1>
    <h4>№ заказа ${order.getNumberOrder()}</h4>
    <h4>Объект ${order.getObjectName().getName()}</h4>
    <h4>Менеджер ${order.getManager().getFio_i_o()}</h4>
    <div class="info">
        <input style="display: none" type="text" name="numberOrder" value="${order.getNumberOrder()}">


        <table class="table table-striped table-sm">
            <thead>
            <tr>
                <th scope="col">Элемент</th>
                <th scope="col">Материал</th>
                <th scope="col">Количество</th>
                <th scope="col">Дата запуска в производство</th>
                <th scope="col">Коментарий</th>
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
                    <select class="form-control" name="typeMaterial">
                        <option value="Выбирите материал">Выбирите материал</option>
                        <c:forEach items="${materials}" var="material">
                            <option value="${material.getName()}">${material.getName()}</option>
                        </c:forEach>
                    </select>
                    <div class="error" style="color: red; text-align: center">
                            ${materialError}
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
                        <input type="datetime-local" class="form-control" id="dateStart" name="dateStart"
                        >
                    </div>
                </td>
                <td>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="comment" name="comment"
                               placeholder="Коментарий">
                    </div>
                </td>
            </tr>

            </tbody>
        </table>


        <!-- пока не работает -->
        <!-- <a href="javascript://" onclick="addRow('myTable');return false;">Добавить элемент'</a>-->

        <button class="w-100 btn btn-primary btn-lg" type="submit">Continue to checkout</button>
        </form:form>
    </div>

</div>


</body>
</html>