<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Станок ${workbench.name}</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
    <link rel="stylesheet" href="../../resources/css/table_workbenches.css">
</head>
<body>

<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<c:if test="${setting.get(0).viewing==false && user.roles.get(0).name.equals('ROLE_USER')}">
    <jsp:include page="../nav/workbench_nav.jsp"></jsp:include>
</c:if>
<c:if test="${user.roles.get(0).name.equals('ROLE_ADMIN')}">
    <jsp:include page="../nav/workbench_nav.jsp"></jsp:include>
</c:if>
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
            <td>${workbench.name}</td>
            <td class="th_workbench_typeOperation">${workbench.typeOperation}</td>
            <td class="th_workbench_currentThickness">${workbench.currentThickness}</td>
            <td class="th_workbench_currentThickness">${workbench.timeWorkAdjustment}</td>
            <td class="th_workbench_dateEnd">${workbench.dateEndDetail}</td>
        </tr>
        </tbody>
    </table>
</div>

</body>
</html>