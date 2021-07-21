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

    <h4 class="mb-3">Добавление детали</h4>
    <div class="info">
        <form action="addDetail" method="post">


            <table class="table table-striped table-sm">
                <thead>
                <tr>
                    <th scope="col">Деталь</th>
                    <th scope="col">Материал</th>
                    <th scope="col">Станок</th>
                    <th scope="col">Время детали на этом станке</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="detailName" name="detailName"
                                   placeholder="Деталь" value="">
                        </div>
                    </td>
                    <td>
                        <div class="col-sm-6">
                            <select class="form-control" name="materialName">
                                <option selected value="Выбирите станок">Выбирите материал</option>
                                <c:forEach items="${materials}" var="material">
                                    <option value="${material.getName()}">${material.getName()}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </td>
                    <td>
                        <div class="col-sm-6">
                            <select class="form-control" name="workBenchName">
                                <option selected value="Выбирите станок">Выбирите станок</option>
                                <c:forEach items="${workbenches}" var="workbench">
                                    <option value="${workbench.getName()}">${workbench.getName()}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-sm-6">
                            <select class="form-control" name="workBenchName1">
                                <option selected value="Выбирите станок">Выбирите станок</option>
                                <c:forEach items="${workbenches}" var="workbench">
                                    <option value="${workbench.getName()}">${workbench.getName()}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-sm-6">
                            <select class="form-control" name="workBenchName2">
                                <option selected value="Выбирите станок">Выбирите станок</option>
                                <c:forEach items="${workbenches}" var="workbench">
                                    <option value="${workbench.getName()}">${workbench.getName()}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </td>
                    <td>
                        <div class="col-sm-6">
                            <input style="margin: 10px;" type="text" class="form-control" id="timeWork"
                                   name="timeWork"
                                   placeholder="Введите время детали">
                        </div>
                        <div class="col-sm-6">
                            <input style="margin: 10px;" type="text" class="form-control" id="timeWork1"
                                   name="timeWork1"
                                   placeholder="Введите время детали">
                        </div>
                        <div class="col-sm-6">
                            <input style="margin: 10px;" type="text" class="form-control" id="timeWork2"
                                   name="timeWork2"
                                   placeholder="Введите время детали">
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>


            <!--   пока не работает         -->
            <!--            <a href="javascript://" onclick="addRow('myTable');return false;">Добавить элемент'</a>-->

            <button class="w-100 btn btn-primary btn-lg" type="submit">Добавить деталь</button>
        </form>
    </div>

</div>


</body>
</html>