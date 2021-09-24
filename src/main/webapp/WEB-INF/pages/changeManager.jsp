<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Изменение менеджера</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
    <link rel="stylesheet" href="../../resources/css/table_managers.css">
</head>
<body>
<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<jsp:include page="../nav/manager_nav_second.jsp"></jsp:include>
<form:form method="post">
    <jsp:include page="../nav/nav_third_save.jsp"></jsp:include>

    <div class="main">
        <table class="simple-little-table" cellspacing='0'>
            <thead>
            <tr>
                <th class="fio">Фамилия</th>
                <th class="fio">Имя</th>
                <th class="fio">Отчество</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td class="fio">
                    <input type="text" class="form-control" id="fio" name="fio"
                           placeholder="${managerById.fio}" value="${managerById.fio}" required>
                </td>
                <td class="fio">
                    <input type="text" class="form-control" id="name" name="name"
                           placeholder="${managerById.name}" value="${managerById.name}" required>
                </td>
                <td class="fio">
                    <input type="text" class="form-control" id="lastName" name="lastName"
                           placeholder="${managerById.lastName}" value="${managerById.lastName}" required>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</form:form>

</body>
</html>