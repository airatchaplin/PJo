<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Настройки</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
    <link rel="stylesheet" href="../../resources/css/table_allUsers.css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../nav/nav_first.jsp"></jsp:include>

<form:form method="post" action="/admin/settings">
    <jsp:include page="../nav/nav_third_save.jsp"></jsp:include>
    <div class="main">

        <table style="margin-bottom: 10px" class="simple-little-table" cellspacing='0'>
            <thead>
            <tr>
                <th>Область видимости для менеджеров</th>
                <th></th>
            </tr>
            <tr>
                <th style="width: 50%;">Название</th>
                <th>Редактирование/Просмотр</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${setting.settingViews}" var="settingViews">
                <tr>
                    <td>
                        <input style="display: none;" type="text" value="${settingViews.name}"
                               name="nameView">${settingViews.name}
                    </td>

                    <td>
                        <select name="viewing">
                            <option value="${settingViews.viewing==true?'Просмотр':'Редактироваие'}"
                                    selected>Выбранная ${settingViews.viewing==true?'Просмотр':'Редактироваие'}</option>
                            <c:forEach items="${settingView}" var="views">
                                <option value="${views}">${views}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <table style="margin-bottom: 10px" class="simple-little-table" cellspacing='0'>
            <thead>
            <tr>
                <th>Время переналадки</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>
                    <input type="text" value="${setting.timeWorkAdjustment}" placeholder="00:00"
                           name="timeWorkAdjustment" required>
                </td>
            </tr>
            </tbody>
        </table>

        <table id="tableAdd" class="simple-little-table" cellspacing='0' style="margin-bottom: 10px;">
            <thead>
            <tr>
                <th>Даты выходных и праздничных дней
                    <button style="background: #89e1fe;" class="input_js" type="button" id="add_more_fields">
                        <img style="width: 12px" src="../../resources/icon/plus.png" alt=""></button>
                    <button style="background: #89e1fe;" class="input_js" type="button" onclick="deleteRow()">
                        <img style="width: 12px" src="../../resources/icon/minus.png" alt=""></button>
                </th>
                <th></th>
                <th></th>
                <th></th>
            </tr>
            <tr>
                <th style="width: 100%;" class="name">Название</th>
                <th class="name">Начало</th>
                <th class="name">Окончание</th>
                <th class="name">Удалить</th>
            </tr>
            </thead>
            <tbody>

            <tr style="display: none">
                <td style="width: 100%;"><input type="text" placeholder="Введите навание" name="nameOld">
                    <input type="text" name="idOld" style="display: none">
                </td>
                <td><input type="date" name="dateStartOld"
                ></td>
                <td><input type="date" name="dateEndOld">
                </td>
                <td style="padding: 0;">
                </td>
            </tr>
            <c:forEach items="${setting.settingWeekends}" var="settingWeekends">
                <tr>
                    <td style="width: 100%;" id="columnName"><input type="text" value="${settingWeekends.name}"
                                                                    placeholder="Введите навание"
                                                                    name="nameOld" required>
                        <input type="text" name="idOld" value="${settingWeekends.id}" style="display: none">
                    </td>
                    <td id="columnDateStart"><input type="date" value="${settingWeekends.dateStart}" name="dateStartOld"
                                                    required></td>
                    <td id="columnDateEnd"><input type="date" value="${settingWeekends.dateEnd}" name="dateEndOld"
                                                  required>
                    </td>
                    <td style="padding: 0;">
                        <button style="color: black;width: 150px;height: 50px;background: #d1d1d100;font-variant: all-small-caps;"
                                type="submit" formaction="/admin/settings/deleteWeekend/${settingWeekends.id}">
                            Удалить
                        </button>
                    </td>
                </tr>
            </c:forEach>

            <tr style="display: none">
                <td><input type="text" placeholder="Введите навание" name="name"></td>
                <td><input type="date" name="dateStart"></td>
                <td><input type="date" name="dateEnd"></td>
                <td></td>
            </tr>

            </tbody>
        </table>
    </div>
</form:form>
</body>
<script>
    $('#add_more_fields').click(function () {
        var component1 = '';
        component1 += '<tr id="row1">';
        component1 += '<td><input type="text" placeholder="Введите навание" name="name" required></td>';
        component1 += '<td><input type="date" name="dateStart" required></td>';
        component1 += '<td><input type="date" name="dateEnd" required></td>';
        component1 += '<td></td>';
        component1 += '</tr>';
        $('#tableAdd').append(component1);

    });

    function deleteRow() {
        $("#row1").remove();

    }

    $('#group input:checkbox').click(function () {
        if ($(this).is(':checked')) {
            $('#group input:checkbox').not(this).prop('checked', false);
        }
    });
</script>