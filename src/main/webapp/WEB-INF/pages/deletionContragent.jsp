<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Удаление контрагента</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
</head>
<body>
<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<jsp:include page="../nav/contragent_nav_second.jsp"></jsp:include>
<form:form action="/contragents/deletion/${contragent.id}" method="post">
    <jsp:include page="../nav/nav_third_del.jsp"></jsp:include>

    <div class="main">
        <table class="simple-little-table" cellspacing='0'>
            <thead>
            <tr>
                <th>Контрагент</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>${contragent.name}</td>
            </tr>
            </tbody>
        </table>
        <div class="error-text">${contragentError}</div>
    </div>
</form:form>
</body>
</html>