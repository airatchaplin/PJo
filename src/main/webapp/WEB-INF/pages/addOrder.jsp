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
    <title>Getting Started: Serving Web Content</title>
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
</head>
<body>
<header style="height: 50px;
    text-align: center;background: #d1d1d1;">
    <a style="padding: 10px;color: #000000;text-decoration: none;" href="/">Главная страница</a>
    <a style="padding: 10px;color: #000000;text-decoration: none;" href="/orders">Заказы </a>
    <a style="padding: 10px;color: #000000;text-decoration: none;" href="/details">Детали</a>
    <a style="padding: 10px;color: #000000;text-decoration: none;" href="/materials">Материалы </a>
    <a style="padding: 10px;color: #000000;text-decoration: none;" href="/managers">Менеджеры </a>
    <a style="padding: 10px;color: #000000;text-decoration: none;"
       href="/contragents">Контрагенты </a>
    <a style="padding: 10px;color: #000000;text-decoration: none;" href="/workbenches">Станки </a>
</header>

<div class="container1">
    <h4 class="mb-3">Добавление заказа</h4>
    <div class="info">
        <form:form method="post">
            <div class="col-sm-6">
                <label style="margin-left: 10px;" for="numberOrder" class="form-label">Номер
                    заказа</label>
                <input style="margin: 10px;" type="text" class="form-control" id="numberOrder"
                       name="numberOrder"
                       placeholder="Введите Номер детали" value="" required>
                <div class="error" style="color: red;">
                        ${numberOrderError}
                </div>
            </div>
            <div class="col-sm-6">
                <label style="margin-left: 10px;" for="numberOrder" class="form-label">Выбирете
                    контрагента</label>
                <select style="margin: 10px;" class="form-control" name="objectName">
                    <c:forEach items="${contragents}" var="contragent">
                        <option value="${contragent.getName()}">${contragent.getName()}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-sm-6">
                <label style="margin-left: 10px;" for="numberOrder" class="form-label">Выберете
                    менеджера</label>
                <select style="margin: 10px;" class="form-control" name="manager">
                    <c:forEach items="${managers}" var="manager">
                        <option value="${manager.getFio_i_o()}">${manager.getFio_i_o()}</option>
                    </c:forEach>
                </select>
            </div>
            <table class="table table-striped table-sm">
                <thead>
                <tr>
                    <th scope="col">Деталь</th>
                    <th scope="col">Количество</th>
                    <th scope="col">Дата запуска в производство</th>
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
                    </td>
                    <td>
                        <input type="text" class="form-control" id="countDetail" name="countDetail"
                               placeholder="Количество">
                    </td>
                    <td>
                        <div class="col-sm-6">
                            <input type="datetime-local" class="form-control" id="dateStart"
                                   name="dateStart">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <select class="form-control" name="detailName1">
                            <option value="Выбирите деталь">Выбирите деталь</option>
                            <c:forEach items="${details}" var="detail">
                                <option value="${detail.getName()}">${detail.getName()}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>
                        <input type="text" class="form-control" id="countDetail1"
                               name="countDetail1"
                               placeholder="Количество">
                    </td>
                    <td>
                        <div class="col-sm-6">
                            <input type="datetime-local" class="form-control" id="dateStart1"
                                   name="dateStart1">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <select class="form-control" name="detailName2">
                            <option value="Выбирите деталь">Выбирите деталь</option>
                            <c:forEach items="${details}" var="detail">
                                <option value="${detail.getName()}">${detail.getName()}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>
                        <input type="text" class="form-control" id="countDetail2"
                               name="countDetail2"
                               placeholder="Количество">
                    </td>
                    <td>
                        <div class="col-sm-6">
                            <input type="datetime-local" class="form-control" id="dateStart2"
                                   name="dateStart2">
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>

            <div class="col-sm-6">
                <input style="margin: 10px;" type="text" class="form-control" id="comment"
                       name="comment"
                       placeholder="Коментарий">
            </div>

            <button class="w-100 btn btn-primary btn-lg" type="submit">Добавить заказ</button>
        </form:form>

    </div>
</div>

<%--<form:form action="http://localhost:8080/check/деталь1" method="post">--%>
<%--    <button class="w-100 btn btn-primary btn-lg" type="submit">Проверить</button>--%>
<%--</form:form>--%>

</body>
<%--<script>--%>

<%--    function check() {--%>
<%--        let form = document.getElementById('formId')--%>
<%--        let btn = document.createElement('button')--%>
<%--        let form1 = document.createElement('form:form')--%>
<%--        btn.formAction = 'http://localhost:8080/check/деталь1'--%>
<%--        form1.method = 'POST';--%>
<%--        form.method = 'POST';--%>
<%--        form.innerHTML--%>
<%--        form1.innerHTML--%>
<%--        btn.innerHTML;--%>
<%--        form.append(btn)--%>
<%--        form1.id = 'lal'--%>
<%--        form1.ac--%>
<%--        form1.append(btn)--%>
<%--        form.append(btn)--%>
<%--        document.body.append(form1)--%>
<%--        document.body.append(form)--%>
<%--        // document.body.append(btn);--%>

<%--    }--%>

<%--</script>--%>
</html>