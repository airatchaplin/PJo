<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Добавление детали</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
            integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
            crossorigin="anonymous"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

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
           href="/admin/managers">Менеджеры </a>
        <a style="padding: 10px;color: #000000;text-decoration: none;"
           href="/contragents">Контрагенты </a>
        <a style="padding: 10px;color: #000000;text-decoration: none;" href="/workbenches">Станки </a>
    </div>
    <div>
        <a style="padding: 10px;color: #000000;text-decoration: none;" href="/personalArea">${manager.fio_i_o} </a>
        <a style="padding: 10px;color: #000000;text-decoration: none;" href="/logout">Выход </a>
    </div>
</nav>

<div class="main" style="margin-top: 60px">
    <div class="info">
        <form method="post">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">Деталь</th>
                    <th scope="col">Длина</th>
                    <th scope="col">Ширина</th>
                    <th scope="col">Толщина</th>
                    <th scope="col">Материал</th>
                    <th scope="col">Станок
                        <input type="button" style="margin: 10px" value="+" id="add_more_fields"/>
                        <input type="button" onclick="deleteRow()" value=" - ">
                    </th>
                    <th scope="col">Время детали на этом станке</th>
                    <th scope="col">Добавить</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>
                        <div>
                            <input type="text" class="form-control" id="detailName" name="detailName"
                                   placeholder="Введите название детали" value="" required>
                        </div>
                        <div class="error" style="color: red;">
                            ${detailError}
                        </div>
                    </td>
                    <td>
                        <div>
                            <input type="text" class="form-control" id="length" name="length"
                                   placeholder="Введите длину" value="" required>
                        </div>
                    </td>
                    <td>
                        <div>
                            <input type="text" class="form-control" id="width" name="width"
                                   placeholder="Введите ширину" value="" required>
                        </div>
                    </td>
                    <td>
                        <div>
                            <input type="text" class="form-control" id="thickness" name="thickness"
                                   placeholder="Введите толщину" value="" required>
                        </div>
                    </td>
                    <td>
                        <div>
                            <select class="form-control" name="materialName">
                                <option selected value="Выбирите станок">Выбирите материал</option>
                                <c:forEach items="${materials}" var="material">
                                    <option value="${material.getName()}">${material.getName()}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </td>
                    <td id="columnWorkBench">
                        <div>
                            <select class="form-control" name="workBenchName">
                                <option selected value="Выбирите станок">Выбирите станок</option>
                                <c:forEach items="${workbenches}" var="workbench">
                                    <option value="${workbench.getName()}">${workbench.getName()}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </td>
                    <td id="columnTimeWork">
                        <input type="text" class="form-control" id="timeWork" name="timeWork"
                               placeholder="Введите время детали">
                    </td>
                    <td>
                        <button class="form-control" style="width: auto;background-color: #0d6efd;color: #fff;" type="submit">Добавить деталь</button>
                    </td>
                </tr>
                </tbody>
            </table>

        </form>
    </div>
</div>


</body>
<script>
    $('#add_more_fields').click(function () {
        var component1 = '';
        component1 += '<div id="forDeleteWorkBench">';
        component1 += '<select class="form-control" name="workBenchName">';
        component1 += '<option selected value="Выбирите станок">Выбирите станок</option>';
        component1 += '<c:forEach items="${workbenches}" var="workbench">';
        component1 += '<option value="${workbench.getName()}">${workbench.getName()}</option>';
        component1 += '</c:forEach>';
        component1 += '</select>';
        component1 += '</div>';

        var component2 = '';
        component2 += '<input type="text" class="form-control" id="forDeleteTimeWork" name="timeWork" placeholder="Введите время детали">';

        $('#columnWorkBench').append(component1);
        $('#columnTimeWork').append(component2);
    });

    function deleteRow() {
        $("#forDeleteWorkBench").remove();
        $("#forDeleteTimeWork").remove();
    }

</script>
</html>