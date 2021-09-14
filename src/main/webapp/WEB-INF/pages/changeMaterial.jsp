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

<nav class="nav-first">
    <div>
        <a href="/">Главная страница</a>
        <a href="/orders">Заказы </a>
        <a href="/details">Детали</a>
        <a href="/materials">Материалы </a>
        <a href="/managers">Менеджеры </a>
        <a href="/contragents">Контрагенты </a>
        <a href="/workbenches">Станки </a>
    </div>
    <div>
        <a style="display: ${user.roles.get(0).name.equalsIgnoreCase("ROLE_ADMIN") ? "contents" : "none"}"
           href="/admin/allUsers">Все пользователи</a>
        <a href="/personalArea">${user.fio_i_o} </a>
        <a href="/logout">Выход</a>
    </div>
</nav>

<form:form method="post">
    <nav class="nav-second">
        <div>
            <a href="/addMaterial">Добавить материал</a>
            <a href="/materials/change/${material.id}">Изменить материал</a>
            <a href="/materials/deletion/${material.id}">Удалить материал</a>
        </div>
        <div>
            <input style="background: #f2f2f2; border: 0;cursor: pointer; " type="submit" value="Сохранить">
        </div>
    </nav>

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