<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Изменение материала</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
    <link rel="stylesheet" href="../../resources/css/table_materials.css">
</head>
<body>
<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<jsp:include page="../nav/material_nav_second.jsp"></jsp:include>
<form:form method="post">
    <jsp:include page="../nav/nav_third_save.jsp"></jsp:include>

    <div class="main">
        <table class="simple-little-table" cellspacing='0'>
            <thead>
            <tr>
                <th class="materials">Название материала</th>
                <th class="materials">Толщина</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td class="materials">
                    <input type="text" class="form-control" id="materialName" name="materialName"
                           placeholder="${material.getName()}" value="${material.getName()}" required>
                    <div class="error" style="color: red;">
                            ${materialNameRepeatError}
                    </div>
                </td>
                <td class="materials">
                    <input type="text" class="form-control" id="thickness" name="thickness"
                           placeholder="${material.thickness}" value="${material.thickness}" required>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</form:form>

</body>
</html>