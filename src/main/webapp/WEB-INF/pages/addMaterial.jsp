<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Добавление материала</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
    <link rel="stylesheet" href="../../resources/css/table_materials.css">
</head>
<body>

<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<nav class="nav-second">
    <button class="button-nav-second"
            onclick="window.location.href = '/addMaterial';">Добавить материал
    </button>
</nav>
<form method="post">
    <jsp:include page="../nav/nav_third_save.jsp"></jsp:include>


    <div class="main">
        <table class="simple-little-table" cellspacing='0'>
            <thead>
            <tr>
                <th class="materials">Материал</th>
                <th class="materials">Толщина</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td class="materials">
                    <input type="text" class="form-control" id="materialName" name="materialName"
                           placeholder="Введите название материала" value="" required>
                </td>
                <td class="materials">
                    <input type="text" class="form-control" id="thickness" name="thickness"
                           placeholder="Введите толщину" value="" required>
                </td>
            </tr>
            </tbody>
        </table>
        <div class="error-text">
            ${materialNameRepeatError}
        </div>
    </div>
</form>

</body>
</html>