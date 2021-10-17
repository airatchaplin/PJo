<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html
<html>
<head>
    <title>Удаление станка ${workbench.name}</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
    <link rel="stylesheet" href="../../resources/css/table_workbenches.css">
</head>
<body>
<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<%--<form:form action="/workbenches/deletion/${workbench.id}">--%>
<%--    <nav class="nav-second">--%>
<%--        <div>--%>
<%--            <a href="/addWorkBench">Добавить станок</a>--%>
<%--            <a href="/workbenches/change/${workbench.id}">Изменить станок</a>--%>
<%--            <a href="/workbenches/deletion/${workbench.id}">Удалить станок</a>--%>
<%--        </div>--%>
<%--        <div>--%>
<%--            <input style="background: #f2f2f2; border: 0;cursor: pointer; " type="submit" value="Удалить">--%>
<%--        </div>--%>
<%--    </nav>--%>
<jsp:include page="../nav/workbench_nav.jsp"></jsp:include>

<form:form method="post">
    <jsp:include page="../nav/nav_third_del.jsp"></jsp:include>

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
                <td>${workbench.name}</td>
                <td class="th_workbench_typeOperation">${workbench.typeOperation.name}</td>
                <td class="th_workbench_currentThickness">${workbench.currentThickness}</td>
                <td class="th_workbench_dateEnd">${workbench.dateEndDetail}</td>
            </tr>
            </tbody>
        </table>
        <label style="color: red">${workBenchError}</label>
    </div>
</form:form>
</body>
</html>