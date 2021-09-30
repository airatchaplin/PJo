<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Добавление станка</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

    <%--    <style>--%>
    <%--        .header {--%>
    <%--            background: black;--%>
    <%--            color: white;--%>
    <%--            position: fixed;--%>
    <%--            top: 0;--%>
    <%--            left: 0;--%>
    <%--            width: 100%;--%>
    <%--            transition: all .3s ease;--%>
    <%--        }--%>

    <%--        .header.out {--%>
    <%--            transform: translateY(-400%);--%>
    <%--        }--%>
    <%--    </style>--%>

</head>
<body id="bod">
<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<jsp:include page="../nav/details_nav_second.jsp"></jsp:include>
<form method="post">
    <jsp:include page="../nav/nav_third_save.jsp"></jsp:include>

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
                <th>Вариант</th>
                <th>
                    Станки

                    <%--                    <input class="input_js" type="button" value="+"--%>
                    <%--                           id="add_more_fields"/>--%>
                    <%--                <input class="input_js" type="button" onclick="deleteRow()" value=" - ">--%>

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
                    <button class="input_js" style="background: #33d577;" type="button" onclick="changeTable()">
                        <img style="width: 12px" src="../../resources/icon/ok.png" alt=""></button>
                    <button class="input_js" style="background: red;" type="button" onclick="changeTableAfterChange()">
                        <img style="width: 12px" src="../../resources/icon/close.png" alt=""></button>
                </th>
                <th style="width: 10%;">Приоритет</th>
                <th style="width: 10%;">Время</th>
                <th>Примечание</th>
            </tr>
            </thead>
            <tbody>
            <c:set var="countDetailList" value="0" scope="page"/>
            <c:forEach items="${detail.detailListDtos.get(0).detailInfoDtos}" var="detailInfo">
                <tr>
                    <c:if test="${countDetailList>0}">
                        <td></td>
                    </c:if>
                    <c:if test="${countDetailList==0}">
                        <td class="detail_material">${detail.detailListDtos.get(0).mainOrAlternative == "1"?"Основной" :"Запасной"}</td>
                        <c:set var="countDetailList" value="${countDetailList + 1}" scope="page"/>
                    </c:if>
                    <td><input style="color: black" type="text" name="workbenchName"
                               value="${detailInfo.workBenchDto.name}" readonly>
                    </td>
                    <td id="tdId${detail.detailListDtos.get(0).detailInfoDtos.indexOf(detailInfo)}"><input
                            class="inputAdd"
                            id="inputId${detail.detailListDtos.get(0).detailInfoDtos.indexOf(detailInfo)}"
                            type="text"
                            value="${detailInfo.workBenchDto.priority}">
                    </td>
                    <td><input class="inputAdd" type="text" name="timeWork" value="${detailInfo.timeWork}"></td>
                    <td style="text-align: center;"><input type="text" name="comment" value="${detailInfo.comment}">
                    </td>
                </tr>
            </c:forEach>

            </tbody>
        </table>

        <c:if test="${detail.detailListDtos.size()>1}">
            <table id="tableAdd1" class="simple-little-table" cellspacing='0'
                   style="margin-top: 10px; margin-bottom: 20px">
                <thead>
                <tr>
                    <th>Вариант</th>
                    <th>
                        Станки

                            <%--                    <input class="input_js" type="button" value="+"--%>
                            <%--                           id="add_more_fields"/>--%>
                            <%--                <input class="input_js" type="button" onclick="deleteRow()" value=" - ">--%>

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
                        <button class="input_js" style="background: #33d577;" type="button" onclick="changeTable1()">
                            <img style="width: 12px" src="../../resources/icon/ok.png" alt=""></button>
                        <button class="input_js" style="background: red;" type="button"
                                onclick="changeTableAfterChange1()">
                            <img style="width: 12px" src="../../resources/icon/close.png" alt=""></button>
                    </th>
                    <th style="width: 10%;">Приоритет</th>
                    <th style="width: 10%;">Время</th>
                    <th>Примечание</th>
                </tr>
                </thead>
                <tbody>
                <c:set var="countDetailList1" value="0" scope="page"/>
                <c:forEach items="${detail.detailListDtos.get(1).detailInfoDtos}" var="detailInfo">
                    <tr>
                        <c:if test="${countDetailList1>0}">
                            <td></td>
                        </c:if>
                        <c:if test="${countDetailList1==0}">
                            <td class="detail_material">${detail.detailListDtos.get(1).mainOrAlternative == "1"?"Основной" :"Запасной"}</td>
                            <c:set var="countDetailList1" value="${countDetailList1 + 1}" scope="page"/>
                        </c:if>
                        <td><input style="color: black" type="text" name="workbenchName"
                                   value="${detailInfo.workBenchDto.name}" readonly>
                        </td>
                        <td id="tdId1${detail.detailListDtos.get(1).detailInfoDtos.indexOf(detailInfo)}"><input
                                class="inputAdd"
                                id="inputId1${detail.detailListDtos.get(1).detailInfoDtos.indexOf(detailInfo)}"
                                type="text"
                                value="${detailInfo.workBenchDto.priority}">
                        </td>
                        <td><input class="inputAdd" type="text" name="timeWork" value="${detailInfo.timeWork}"></td>
                        <td style="text-align: center;"><input type="text" name="comment" value="${detailInfo.comment}">
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>
        <div style="color: red">
            ${countWorkbenchError}
        </div>
    </div>

</form>
<%--    <button onclick="sortTable()">Sort</button>--%>

</body>
<script>
    var count = 1;
    var a = ${detail.detailListDtos.get(0).detailInfoDtos.size()};

    $('#add_more_fields').click(function () {
        if (valueOption !== "") {
            var component1 = '';
            component1 += '<tr id="row1">';
            component1 += '<td></td>';
            component1 += '<td><input style="color: black;" type="text" name="workbenchName" value="' + valueOption + '" readonly></td>';
            component1 += '<td id="tdId' + a + '"><input id="inputId' + a + '" class="inputAdd" name="priority" type="text" value="' + a + '"></td>';
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
        if (a > ${detail.detailListDtos.get(0).detailInfoDtos.size()}) {
            a--;
        }

    }

    var valueOption = "";

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
                x = rows[i].getElementsByTagName("TD")[2];
                y = rows[i + 1].getElementsByTagName("TD")[2];
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
            if (inputValue === "") {
                document.getElementById("tdId" + i).innerHTML = a - 1;
            } else {
                document.getElementById("tdId" + i).innerHTML = inputValue;
                if (inputValue === "") {
                    isCheck = false;
                }
            }
        }
        if (isCheck === true) {
            sortTable();
        }
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

    //    ------------------
    var count1 = 1;
    var a1 = ${detail.detailListDtos.get(0).detailInfoDtos.size()};

    $('#add_more_fields1').click(function () {
        if (valueOption1 !== "") {
            var component1 = '';
            component1 += '<tr id="row1">';
            component1 += '<td></td>';
            component1 += '<td><input style="color: black;" type="text" name="workbenchName" value="' + valueOption1 + '" readonly></td>';
            component1 += '<td id="tdId1' + a1 + '"><input id="inputId1' + a1 + '" class="inputAdd" name="priority" type="text" value="' + a1 + '"></td>';
            component1 += '<td><input class="inputAdd" type="text" name="timeWork" value="00:00:00"></td>';
            component1 += '<td><input class="inputAdd" type="text" name="comment"></td>';
            component1 += '</tr>';
            $('#tableAdd1').append(component1);
            count1++;
            a1++;
        }
    });

    function deleteRow1() {
        $("#row1").remove();
        if (a1 > ${detail.detailListDtos.get(1).detailInfoDtos.size()}) {
            a1--;
        }

    }

    var valueOption1 = "";

    function OnSelectionChange1(select) {
        var selectedOption = select.options[select.selectedIndex];
        valueOption1 = selectedOption.value;
    }

    /**
     * Сортировка таблицы
     */
    function sortTable1() {
        var table, rows, switching, i, x, y, shouldSwitch;
        table = document.getElementById("tableAdd1");
        switching = true;
        while (switching) {
            switching = false;
            rows = table.getElementsByTagName("TR");
            for (i = 1; i < (rows.length - 1); i++) {
                shouldSwitch = false;
                x = rows[i].getElementsByTagName("TD")[2];
                y = rows[i + 1].getElementsByTagName("TD")[2];
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
    function changeTable1() {
        table = document.getElementById("tableAdd1");
        rows = table.getElementsByTagName("TR");
        var isCheck = true;
        for (i = 0; i < (rows.length - 1); i++) {
            var inputValue = document.getElementById("inputId1" + i).value;
            if (inputValue === "") {
                document.getElementById("tdId1" + i).innerHTML = a1 - 1;
            } else {
                document.getElementById("tdId1" + i).innerHTML = inputValue;
                if (inputValue === "") {
                    isCheck = false;
                }
            }
        }
        if (isCheck === true) {
            sortTable1();
        }
    }

    function changeTableAfterChange1() {
        table = document.getElementById("tableAdd1");
        rows = table.getElementsByTagName("TR");
        for (i = 0; i < (rows.length - 1); i++) {
            if (rows[i].getElementsByTagName("TD")[1] === undefined) {
                document.getElementById("tdId1" + i).innerHTML = '<input id="inputId1' + i + '" class="inputAdd"  type="text" value="">';
            } else {
                // var inputValue = rows[i].getElementsByTagName("TD")[1].innerHTML;
                var inputValue = document.getElementById("tdId1" + i).innerHTML;
                // var inputValue = document.getElementsByTagName("TD")[1];
                document.getElementById("tdId1" + i).innerHTML = '<input id="inputId1' + i + '" class="inputAdd"  type="text" value="">';
            }
        }
    }
</script>
</html>