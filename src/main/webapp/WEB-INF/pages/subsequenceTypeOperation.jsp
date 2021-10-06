<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Очередь операций</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_hover.css">
</head>
<body>

<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<nav class="nav-second">
    <button class="button-nav-second" style="width: 260px;"
            onclick="window.location.href = '/typeOperations/addSubsequenceTypeOperation';">Добавить очередь операций
    </button>
</nav>

<div class="main">
    <table class="simple-little-table" cellspacing='0'>
        <thead>
        <tr>
            <th class="number" style="text-align: center">№</th>
            <th>Очередь операций</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${operations}" var="operation">
            <tr>
                <td class="number" style="text-align: center">${count + 1}</td>
                <td>
                    <a style="display: block"
                       href="/typeOperations/subsequenceTypeOperation/${operation.id}">${operation.description}
                    </a>
                </td>
            </tr>
            <c:set var="count" value="${count + 1}" scope="page"/>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>