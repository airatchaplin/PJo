<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Добавление контрагента</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
</head>
<body>

<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<nav class="nav-second">
    <div>
        <button class="button-nav-second" style="width: 195px;"
                onclick="window.location.href = '/addContragent';">Добавить контрагента
        </button>
    </div>
</nav>
<form action="addContragent" method="post">
    <jsp:include page="../nav/nav_third_save.jsp"></jsp:include>

    <div class="main">
        <table class="simple-little-table" cellspacing='0'>
            <thead>
            <tr>
                <th>Контрагент</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>
                    <input type="text" class="form-control" id="contragentName" name="contragentName"
                           placeholder="Введите название контрагента" value="" required>
                </td>
            </tr>
            </tbody>
        </table>

        <c:if test="${contragentNameError!=null}">
        <div class="error-text">
            <div> ${contragentNameError}</div>
        </div>
        </c:if>
    </div>
</form>


</body>
</html>