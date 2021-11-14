<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Добавление детали</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

</head>
<body id="bod">
<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<nav class="nav-second">
    <button class="button-nav-second"
            onclick="window.location.href = '/addDetail';">Добавить деталь
    </button>
</nav>
<form method="post">
    <jsp:include page="../nav/nav_third_save.jsp"></jsp:include>

    <div class="main">
        <table class="simple-little-table" cellspacing='0'>
            <thead>
            <tr>
                <th>Деталь</th>
                <th>Материал</th>
                <th>Упаковка</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>
                    <textarea name="detailName" placeholder="Введите название детали" required></textarea>
                </td>
                <td>
                    <select class="form-control" name="materialId">
                        <option selected value="Выберите материал">Выбирите материал</option>
                        <c:forEach items="${materials}" var="material">
                            <option value="${material.id}">${material.name} ${material.thickness}мм</option>
                        </c:forEach>
                    </select>
                </td>
                <td>
                    <div id="forDeleteTimeWork1' + countTimeWork1 + '">
                        <input id="inp2' + countTimeWork1 + '" type="text" class="form-control" value="00:00:00"
                               name="timePacking" placeholder="Введите время детали">
                    </div>
                </td>
            </tr>
            </tbody>
        </table>

        <table id="tableAdd" class="simple-little-table" cellspacing='0' style="margin-top: 10px">
            <thead>
            <tr>
                <th>Основной</th>
                <th></th>
                <th></th>
            </tr>
            <tr>
                <th style="width: 50%;">Станки
                    <select style="width: 60%;margin-left: 10px;" onchange="OnSelectionChange (this)">
                        <option value="">Выберите станок для добавления</option>
                        <c:forEach items="${workbenches}" var="workbench">
                            <option value="${workbench.name}">${workbench.name}</option>
                        </c:forEach>
                    </select>
                    <button class="input_js" style="background: #89e1fe;" type="button" id="add_more_fields">
                        <img style="width: 12px" src="../../resources/icon/plus.png" alt=""></button>
                    <button class="input_js" style="background: #89e1fe;" type="button"
                            onclick="deleteRow()">
                        <img style="width: 12px" src="../../resources/icon/minus.png" alt=""></button>
                </th>
                <th>Время</th>
                <th style="width: 40%;">Примечание</th>
            </tr>
            </thead>
            <tbody>
            <tr>
            </tr>
            </tbody>
        </table>

        <table id="tableAdd1" class="simple-little-table" cellspacing='0' style="margin-top: 10px">
            <thead>
            <tr>
                <th>Запасной</th>
                <th></th>
                <th></th>
            </tr>
            <tr>
                <th style="width: 50%;">Станки
                    <select style="width: 60%;margin-left: 10px;" onchange="OnSelectionChange1 (this)">
                        <option value="">Выберите станок для добавления</option>
                        <c:forEach items="${workbenches}" var="workbench">
                            <option value="${workbench.name}">${workbench.name}</option>
                        </c:forEach>
                    </select>
                    <button class="input_js" style="background: #89e1fe;" type="button" id="add_more_fields1">
                        <img style="width: 12px" src="../../resources/icon/plus.png" alt=""></button>
                    <button class="input_js" style="background: #89e1fe;" type="button"
                            onclick="deleteRow1()">
                        <img style="width: 12px" src="../../resources/icon/minus.png" alt=""></button>
                </th>
                <th>Время</th>
                <th style="width: 40%;">Примечание</th>
            </tr>
            </thead>
            <tbody>
            <tr>
            </tr>
            </tbody>
        </table>
        <div class="error-text">
            ${detailError}
        </div>
    </div>
</form>
</body>
<script>
    var count = 1;
    var a = 0;

    $('#add_more_fields').click(function () {
        if (valueOption !== "") {
            var component1 = '';
            component1 += '<tr id="row1">';
            component1 += '<td style="width: 50%;"><input style="color: black;" type="text" name="workBenchId" value="' + valueOption + '" readonly></td>';
            component1 += '<td><input class="inputAdd" type="text" name="timeWork" value="00:00:00"></td>';
            component1 += '<td style="width: 40%;"><input class="inputAdd"  type="text" name="comment"></td>';
            component1 += '</tr>';
            $('#tableAdd').append(component1);
            count++;
            a++;
        }
    });

    function deleteRow() {
        $("#row1").remove();
        if (a > 0) {
            a--;
        }
    }

    var valueOption = "";

    function OnSelectionChange(select) {
        var selectedOption = select.options[select.selectedIndex];
        valueOption = selectedOption.value;
    }

    var count1 = 1;
    var a1 = 0;

    $('#add_more_fields1').click(function () {
        if (valueOption1 !== "") {
            var component1 = '';
            component1 += '<tr id="row2">';
            component1 += '<td style="width: 50%;"><input  style="color: black;" type="text" name="workBenchId1" value="' + valueOption1 + '" readonly></td>';
            component1 += '<td><input class="inputAdd" type="text" name="timeWork1" value="00:00:00"></td>';
            component1 += '<td style="width: 40%;"><input class="inputAdd" style="width: 40%;" type="text" name="comment1"></td>';
            component1 += '</tr>';
            $('#tableAdd1').append(component1);
            count1++;
            a1++;
        }
    });

    function deleteRow1() {
        $("#row2").remove();
        if (a1 > 0) {
            a1--;
        }
    }

    var valueOption1 = "";

    function OnSelectionChange1(select) {
        var selectedOption = select.options[select.selectedIndex];
        valueOption1 = selectedOption.value;
    }
</script>
</html>