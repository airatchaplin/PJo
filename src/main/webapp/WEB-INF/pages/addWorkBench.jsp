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
    <link rel="stylesheet" href="../../resources/css/table_workbenches.css">
</head>
<body>
<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<nav class="nav-second">
    <button class="button-nav-second"
            onclick="window.location.href = '/addWorkBench';">Добавить станок
    </button>
</nav>
<form:form method="post">
<jsp:include page="../nav/nav_third_save.jsp"></jsp:include>
<div class="main">
    <table class="simple-little-table" cellspacing='0'>
        <thead>
        <tr>
            <th>Станок</th>
            <th class="th_workbench_typeOperation">Операция</th>
            <th class="th_workbench_currentThickness">Толщина</th>
            <th class="th_workbench_dateEnd">Время окончния</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>
                <input type="text" id="nameWorkBench" name="nameWorkBench"
                       placeholder="Введите название станка" value="${nameWorkBench}" required>
                <div class="error" style="color: red;">
                        ${workBenchRepeatError}
                </div>
            </td>
            <td class="th_workbench_typeOperation">
                <select name="typeOperationId">
                    <option selected value="Выбирите операцию">Выбирите операцию</option>
                    <c:forEach items="${operations}" var="operation">
                        <option value="${operation.id}">${operation.name}</option>
                    </c:forEach>
                </select>
            </td>
            <td class="th_workbench_currentThickness">
                <input type="text" id="currentThickness" name="currentThickness"
                       placeholder="Толщина" value="${currentThickness}" required>
            </td>
            <td class="th_workbench_dateEnd">
                <input type="datetime-local" id="dateEndDetail" name="dateEndDetail"
                       placeholder="Станок" value="${dateEndDetail}" required>
            </td>
        </tr>
        </tbody>
    </table>
</div>
</form:form>

</body>
</html>