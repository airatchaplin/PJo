<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Изменение операции</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
</head>

<body>
<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<%--<jsp:include page="../nav/typeOperation_nav_second.jsp"></jsp:include>--%>
<form:form method="post">
    <jsp:include page="../nav/nav_third_save.jsp"></jsp:include>

    <div class="main">
        <table class="simple-little-table" cellspacing='0'>
            <thead>
            <tr>
                <th>Операция</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>
                    <input type="text" class="form-control" id="nameTypeOperation" name="nameTypeOperation"
                           placeholder="Введите название операции" value="${operation.name}" required>

                </td>
            </tr>
            </tbody>
        </table>
        <div class="error-text">
                ${errorNameTypeOperation}
        </div>
    </div>
</form:form>
</body>
</html>