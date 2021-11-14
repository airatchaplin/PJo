<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Изменение станка ${workbench.name}</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
    <link rel="stylesheet" href="../../resources/css/table_workbenches.css">
</head>

<body>
<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<jsp:include page="../nav/workbench_nav.jsp"></jsp:include>

<form:form method="post">
    <jsp:include page="../nav/nav_third_save.jsp"></jsp:include>
    <div class="main">
        <table class="simple-little-table" cellspacing='0'>
            <thead>
            <tr>
                <th>Станок</th>
                <th class="th_workbench_typeOperation">Операция</th>
                <th class="th_workbench_currentThickness">Толщина</th>
                <th class="th_workbench_currentThickness">Наладка</th>
                <th class="th_workbench_dateEnd">Время окончния</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>
                    <input type="text" id="workBenchName" name="workBenchName"
                           placeholder="Введите название станка" value="${workbench.name}" required>
                </td>
                <td class="th_workbench_typeOperation">

                        ${workbench.typeOperation.name}
<%--                    <select class="form-control" name="typeOperationId">--%>
<%--                        <option selected value="${workbench.typeOperation.id}">Выбранная--%>
<%--                            операция ${workbench.typeOperation.name}</option>--%>
<%--                        <c:forEach items="${operations}" var="operation">--%>
<%--                            <option value="${operation.id}">${operation.name}</option>--%>
<%--                        </c:forEach>--%>
<%--                    </select>--%>
                </td>
                <td class="th_workbench_currentThickness">
                    <input type="text" class="form-control" id="currentThickness" name="currentThickness"
                           value="${workbench.currentThickness}" required>
                </td>
                <td class="th_workbench_currentThickness">
                    <input type="text" class="form-control" id="timeWorkAdjustment" name="timeWorkAdjustment"
                           value="${workbench.timeWorkAdjustment}" required>
                </td>
                <td class="th_workbench_dateEnd">
                    <input type="datetime-local" class="form-control" id="dateEndDetail" name="dateEndDetail"
                           value="${dateEndDetail}" required>
                </td>
            </tr>
            </tbody>
        </table>
        <div class="error-text">
                ${workBenchRepeatError}
        </div>
    </div>
</form:form>
</body>
</html>