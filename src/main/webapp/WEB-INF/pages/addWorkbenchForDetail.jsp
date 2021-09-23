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

<form method="post">
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

        <table id="tableAdd" class="simple-little-table" cellspacing='0' style="margin-top: 10px;">
            <thead>
            <tr>
                <th>Станки
                    <input class="input_js" type="button" style="margin: 10px;cursor: pointer" value="+"
                           id="add_more_fields"/>
                    <input class="input_js" type="button" style="cursor: pointer" onclick="deleteRow()" value=" - ">

                    <select style="width: 60%;margin-left: 10px;" onchange="OnSelectionChange (this)">
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
                    <td><input style="color: black" type="text" name="workbenchName"
                               value="${detailInfo.workBenchDto.name}" readonly>
                    </td>
                    <td id="tdId${detail.detailInfoDtos.indexOf(detailInfo)}"><input class="inputAdd"
                                                                                     id="inputId${detail.detailInfoDtos.indexOf(detailInfo)}"
                                                                                     type="text"
                                                                                     value="${detailInfo.workBenchDto.priority}">
                    </td>
                    <td><input class="inputAdd" type="text" name="timeWork" value="${detailInfo.timeWork}"></td>
                    <td style="text-align: center;"><input type="text" name="comment"> ${detailInfo.comment}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

    </div>

</form>
<%--    <button onclick="sortTable()">Sort</button>--%>
<button onclick="changeTable()">Применить</button>
<button onclick="changeTableAfterChange()">Оичстить приоритет и заполнить заново</button>

</body>
<script>
    var count = 1;
    var a = ${detail.detailInfoDtos.size()};
    $('#add_more_fields').click(function () {
        if (valueOption !== "") {
            var component1 = '';
            component1 += '<tr id="row1">';
            component1 += '<td><input style="color: black;" type="text" name="workbenchName" value="' + valueOption + '" readonly></td>';
            // component1 += '<td>' + valueOption + '</td>';
            component1 += '<td id="tdId' + a + '"><input id="inputId' + a + '" class="inputAdd" name="priority" type="text" value=""></td>';
            component1 += '<td><input class="inputAdd" type="text" name="timeWork" value="00:00:00"></td>';
            component1 += '<td><input class="inputAdd" type="text" name="comment"></td>';
            component1 += '</tr>';
            $('#tableAdd').append(component1);
            count++;
            a++;
        }
    });

    function deleteRow() {
        $("#row1").remove();
        a--;
    }

    var valueOption = "";

    var countGilotina = 0;

    function OnSelectionChange(select) {
        var selectedOption = select.options[select.selectedIndex];
        valueOption = selectedOption.value;
    }

    /**
     * Сортировка таблицы
     */
    function sortTable() {
        var table, rows, switching, i, x, y, shouldSwitch;
        table = document.getElementById("tableAdd");
        switching = true;
        while (switching) {
            switching = false;
            rows = table.getElementsByTagName("TR");
            for (i = 1; i < (rows.length - 1); i++) {
                shouldSwitch = false;
                x = rows[i].getElementsByTagName("TD")[1];
                y = rows[i + 1].getElementsByTagName("TD")[1];
                if (Number(x.innerHTML) > Number(y.innerHTML)) {
                    shouldSwitch = true;
                    break;
                }
            }
            if (shouldSwitch) {
                rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                switching = true;
            }
        }
    }

    /**
     * Изменение таблицы. Замена <td>
     */
    function changeTable() {
        table = document.getElementById("tableAdd");
        rows = table.getElementsByTagName("TR");
        var isCheck = true;
        for (i = 0; i < (rows.length - 1); i++) {
            var inputValue = document.getElementById("inputId" + i).value;
            // document.getElementById("tdId" + i).innerHTML = '<input id="inputId' + i + '" class="inputAdd"  type="text" name="priority" value="' + inputValue + '">';
            document.getElementById("tdId" + i).innerHTML = inputValue;
            if (inputValue === "") {
                isCheck = false;
            }
        }
        if (isCheck === true) {
            sortTable();
        }
        if (isCheck === false) {
            // changeTableAfterChange();
            // alert("Не выставлен приоритет!")
            // for (i = 0; i < (rows.length - 1); i++) {
            //     if (rows[i].getElementsByTagName("TD")[1] === undefined) {
            //         document.getElementById("tdId" + i).innerHTML = '<input id="inputId' + i + '" class="inputAdd"  type="text" value="">';
            //     } else {
            //         var inputValue = rows[i].getElementsByTagName("TD")[1].innerHTML;
            //         alert(inputValue)
            //         // alert(inputValue);
            //         // var inputValue = document.getElementsByTagName("TD")[1];
            //         document.getElementById("tdId" + i).innerHTML = '<input id="inputId' + i + '" class="inputAdd"  type="text" value="' + inputValue + '">';
            //     }
            // }
        }
        // sortTable();
    }

    function changeTableAfterChange() {
        table = document.getElementById("tableAdd");
        rows = table.getElementsByTagName("TR");
        for (i = 0; i < (rows.length - 1); i++) {
            if (rows[i].getElementsByTagName("TD")[1] === undefined) {
                document.getElementById("tdId" + i).innerHTML = '<input id="inputId' + i + '" class="inputAdd"  type="text" value="">';
            } else {
                // var inputValue = rows[i].getElementsByTagName("TD")[1].innerHTML;
                var inputValue = document.getElementById("tdId" + i).innerHTML;
                // var inputValue = document.getElementsByTagName("TD")[1];
                document.getElementById("tdId" + i).innerHTML = '<input id="inputId' + i + '" class="inputAdd"  type="text" value="">';
            }
        }
    }
</script>
</html>