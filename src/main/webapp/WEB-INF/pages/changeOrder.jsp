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

<h1 style="text-align: center">Редактирование заказа</h1>
<h4>№ заказа ${order.getNumberOrder()}</h4>
<h4>Объект ${order.getObjectName().getName()}</h4>
<h4>Менеджер ${order.getManager().getFio_i_o()}</h4><br>


<table class="table table-striped table-sm">
    <thead>
    <tr>
        <th scope="col">Элемент</th>
        <th scope="col">Материал</th>
        <th scope="col">Количество</th>
        <th scope="col">Дата запуска в производство</th>
        <th scope="col">Дата готовности заказа</th>
        <th scope="col">Изменить</th>
    </tr>
    </thead>
    <tbody>

    <c:forEach items="${order.getDetailInfos()}" var="ord">
        <tr>
            <td>
                <select class="form-control" name="detailName">
                    <option>Выбранная: ${ord.getDetail().getName()}</option>
                    <c:forEach items="${details}" var="detail">
                        <option value="${detail.getName()}">Изменить на: ${detail.getName()}</option>
                    </c:forEach>
                </select>
            </td>
            <td>
                <select class="form-control" name="detailName">
                    <option>Выбранная: ${ord.getMaterial().getName()}</option>
                    <c:forEach items="${materials}" var="material">
                        <option value="${material.getName()}">Изменить на: ${material.getName()}</option>
                    </c:forEach>
                </select>

            </td>
            <td>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="numberOrder" name="numberOrder"
                           placeholder="${ord.getCount()}" value="${ord.getCount()}" required>
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
                    <input type="datetime-local" class="form-control" id="dateEnd" name="dateEnd"
                    >
                </div>
            </td>

            <td>
                <form:form action="http://localhost:8080/orders/${order.getNumberOrder()}/${ord.getIncrement()}"
                           method="post">
                    <button class="form-control"
                            style="width: auto;background-color: #0d6efd;color: #fff;" type="submit">
                        Удалить
                    </button>
                </form:form>
            </td>

        </tr>



    </c:forEach>
    </tbody>
</table>
<div class="col-sm-6">
    <input style="margin: 10px;" type="text" class="form-control" id="comment" name="comment"
           placeholder="Новый коментарий">
</div>

<form:form method="post">
    <button class="w-100 btn btn-primary btn-lg" type="submit">Удалить заказ</button>
</form:form>
</body>
</html>