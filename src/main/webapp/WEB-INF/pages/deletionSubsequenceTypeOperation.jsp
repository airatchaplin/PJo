<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Удаление очереди операции ${operation.description}</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
</head>
<body>
<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<jsp:include page="../nav/subsequence_nav_second.jsp"></jsp:include>
<form method="post">
    <jsp:include page="../nav/nav_third_del.jsp"></jsp:include>

    <div class="main">
        <table class="simple-little-table" cellspacing='0'>
            <thead>
            <tr>
                <th>Очередь операций</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>${operation.description}</td>
            </tr>
            </tbody>
        </table>
        <label style="color: red">${operationError}</label>
    </div>
</form>
</body>
</html>