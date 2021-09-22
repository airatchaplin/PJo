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
<nav class="nav-first">
    <div>
        <a href="/">Главная страница</a>
        <a href="/orders">Заказы </a>
        <a href="/details">Детали</a>
        <a href="/materials">Материалы </a>
        <a href="/managers">Менеджеры </a>
        <a href="/contragents">Контрагенты </a>
        <a href="/workbenches">Станки </a>
    </div>
    <div>
        <a style="display: ${user.roles.get(0).name.equalsIgnoreCase("ROLE_ADMIN") ? "contents" : "none"}"
           href="/admin/allUsers">Все пользователи</a>
        <a href="/personalArea">${user.fio_i_o} </a>
        <a href="/logout">Выход</a>
    </div>
</nav>

<%--<form method="post">--%>
    <nav class="nav-second">
        <div>
            <a href="/addDetail">Добавить деталь</a>
        </div>
        <div>
            <input style="background: #f2f2f2; border: 0;cursor: pointer" type="submit" value="Сохрнаить">
        </div>
    </nav>
    <div class="main">
        <table class="simple-little-table" cellspacing='0'>
            <thead>
            <tr>
                <th>Деталь</th>
                <th>Материал</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td class="detail_name">${detail.name}</td>
                <td class="detail_material">${detail.materialName} ${detail.materialThickness}мм</td>
            </tr>
            </tbody>
        </table>

        <table id="tableAdd" class="simple-little-table" cellspacing='0'>
            <thead>
            <tr>
                <th>Станки
                    <input class="input_js" type="button" style="margin: 10px;cursor: pointer" value="+"
                           id="add_more_fields"/>
                    <input class="input_js" type="button" style="cursor: pointer" onclick="deleteRow()" value=" - ">

                    <select onchange="OnSelectionChange (this)" name="" id="123">
                        <option value="">Выберите станок для добавления</option>
                        <c:forEach items="${workbenches}" var="workbench">
                            <option value="${workbench.name}">${workbench.name}</option>
                        </c:forEach>
                    </select>

                </th>
                <th>Приоритет</th>
                <th>Время</th>
                <th>Примечание</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${detail.detailInfoDtos}" var="detailInfo">
                <tr>
                    <td>${detailInfo.workBenchDto.name}</td>
<%--                    <td><input class="inputAdd" type="text" value="${detailInfo.workBenchDto.priority}"></td>--%>
                    <td>${detailInfo.workBenchDto.priority}</td>
                    <td style="text-align: center;">${detailInfo.timeWork}</td>
                    <td style="text-align: center;">${detailInfo.comment}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

    </div>

<%--</form>--%>
<p><button onclick="sortTable()">Sort</button></p>

<table id="myTable">
    <tr>
        <th>ID</th>
        <th>Name</th>
    </tr>
    <tr>
        <td>5</td>
        <td>Berglunds snabbkop</td>
    </tr>
    <tr>
        <td>3</td>
        <td>North/South</td>
    </tr>
    <tr>
        <td>6</td>
        <td>Alfreds Futterkiste</td>
    </tr>
    <tr>
        <td>2</td>
        <td>Koniglich Essen</td>
    </tr>
    <tr>
        <td>1</td>
        <td>Magazzini Alimentari Riuniti</td>
    </tr>
    <tr>
        <td>7</td>
        <td>Paris specialites</td>
    </tr>
    <tr>
        <td>4</td>
        <td>Island Trading</td>
    </tr>

</table>
</body>
<script>
    var count = 1;
    $('#add_more_fields').click(function () {
        if (valueOption !== "") {
            var component1 = '';
            component1 += '<tr id="row1">';
            component1 += '<td>' + valueOption + '</td>';
            component1 += '<td><input class="inputAdd" type="text"></td>';
            component1 += '<td><input class="inputAdd" type="text" value="00:00:00"></td>';
            component1 += '<td><input class="inputAdd" type="text"></td>';
            component1 += '</tr>';
            $('#tableAdd').append(component1);
            count++;
        }
    });

    function deleteRow() {
        $("#row1").remove();
    }

    var valueOption = "";

    var countGilotina = 0;

    function OnSelectionChange(select) {
        var selectedOption = select.options[select.selectedIndex];
        valueOption = selectedOption.value;
    }

    function sortTable() {
        var table, rows, switching, i, x, y, shouldSwitch;
        table = document.getElementById("tableAdd");
        switching = true;
        /*Make a loop that will continue until
        no switching has been done:*/
        while (switching) {
            //start by saying: no switching is done:
            switching = false;
            rows = table.getElementsByTagName("TR");
            /*Loop through all table rows (except the
            first, which contains table headers):*/
            alert(rows.length - 1);
            for (i = 1; i < (rows.length - 1); i++) {
                //start by saying there should be no switching:
                shouldSwitch = false;
                /*Get the two elements you want to compare,
                one from current row and one from the next:*/
                x = rows[i].getElementsByTagName("TD")[1];
                y = rows[i + 1].getElementsByTagName("TD")[1];
                //check if the two rows should switch place:
                if (Number(x.innerHTML) > Number(y.innerHTML)) {
                    //if so, mark as a switch and break the loop:
                    shouldSwitch = true;
                    break;
                }
            }
            if (shouldSwitch) {
                /*If a switch has been marked, make the switch
                and mark that a switch has been done:*/
                rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                switching = true;
            }
        }
    }
</script>
</html>