<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Добавление последовательности операций</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
</head>
<body>
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
<form:form method="post">
    <nav class="nav-second">
        <div>
            <a href="/typeOperations/addSubsequenceTypeOperation">Добавить последовательность операций</a>
        </div>
        <div>
            <input style="background: #f2f2f2; border: 0;cursor: pointer; " type="submit" value="Сохранить">
        </div>
    </nav>

    <div class="main">
        <table class="simple-little-table" cellspacing='0'>
            <thead>
            <tr>
                <th>Последовательность операций
                    <input class="input_js" type="button" style="margin: 10px;cursor: pointer" value="+" id="add_more_fields"/>
                    <input class="input_js" type="button" style="cursor: pointer" onclick="deleteRow()" value=" - ">
                </th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td id="columnTypeOperations">
                    <select name="typeOperationsList">
                        <option selected value="Выбирите операцию">Выбирите операцию</option>
                        <c:forEach items="${operations}" var="operation">
                            <option value="${operation.id}">${operation.name}</option>
                        </c:forEach>
                    </select>
                    <div class="error" style="color: red;">
                        ${errorSubsequenceTypeOperation}
                    </div>
                </td>

            </tr>
            </tbody>
        </table>
    </div>
</form:form>

</body>
<script>
    $('#add_more_fields').click(function () {
        var component1 = '';
        component1 += '<div id="forDeleteTypeOperations">';
        component1 += '<select class="form-control" name="typeOperationsList">';
        component1 += '<option selected value="Выбирите операцию">Выбирите операцию</option>';
        component1 += '<c:forEach items="${operations}" var="operation">';
        component1 += '<option value="${operation.id}">${operation.name}</option>';
        component1 += '</c:forEach>';
        component1 += '</select>';
        component1 += '</div>';


        $('#columnTypeOperations').append(component1);

    });

    function deleteRow() {
        $("#forDeleteTypeOperations").remove();

    }

</script>
</html>