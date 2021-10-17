<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Операция ${operation.name}</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
</head>
<body>
<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<%--<jsp:include page="../nav/typeOperation_nav_second.jsp"></jsp:include>--%>

<div class="main">
    <table class="simple-little-table" cellspacing='0'>
        <thead>
        <tr>
            <th>Операция</th>
            <th>Станки операции</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${operation.name}</td>
            <td>
                <c:forEach items="${workbenches}" var="workbench">
                    <pre>${workbench.name}</pre>
                </c:forEach>
            </td>
        </tr>
        </tbody>
    </table>
</div>

</body>
</html>