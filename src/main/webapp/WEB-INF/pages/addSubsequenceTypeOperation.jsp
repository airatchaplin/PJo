<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Добавление очереди операций</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../nav/nav_first.jsp"></jsp:include>

<nav class="nav-second">
    <button class="button-nav-second" style="width: 260px;"
            onclick="window.location.href = '/typeOperations/addSubsequenceTypeOperation';">Добавить очередь операций
    </button>
</nav>
<form:form method="post">
    <jsp:include page="../nav/nav_third_save.jsp"></jsp:include>


    <div class="main">
        <table class="simple-little-table" cellspacing='0'>
            <thead>
            <tr>
                <th>Очередь операций
                    <button style="background: #89e1fe;" class="input_js" type="button" id="add_more_fields">
                        <img style="width: 12px" src="../../resources/icon/plus.png" alt=""></button>
                    <button style="background: #89e1fe;" class="input_js" type="button" onclick="deleteRow()">
                        <img style="width: 12px" src="../../resources/icon/minus.png" alt=""></button>
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