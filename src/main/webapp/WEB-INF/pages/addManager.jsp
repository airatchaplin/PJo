<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Добавление менеджера</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
</head>
<body>

<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<nav class="nav-second">
    <button class="button-nav-second"
            onclick="window.location.href = '/addManager';">Добавить менеджера
    </button>
</nav>
<form:form method="post">
    <jsp:include page="../nav/nav_third_save.jsp"></jsp:include>

    <div class="main">
        <table class="simple-little-table" cellspacing='0'>
            <thead>
            <tr>
                <th>Логин</th>
                <th>Пароль</th>
                <th>Фамилия</th>
                <th>Имя</th>
                <th>Отчество</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>
                    <input type="text" class="form-control" id="username" name="username"
                           placeholder="Введите логин" value="${username}" required>
                </td>
                <td>
                    <input type="text" class="form-control" id="password" name="password"
                           placeholder="Введите пароль" value="${password}" required>
                </td>
                <td>
                    <input type="text" class="form-control" id="fio" name="fio"
                           placeholder="Введите фамилию" value="${fio}" required>
                </td>
                <td>
                    <input type="text" class="form-control" id="name" name="name"
                           placeholder="Введите имя" value="${name}" required>
                </td>
                <td>
                    <input type="text" class="form-control" id="lastName" name="lastName"
                           placeholder="Введите отчество" value="${lastName}" required>
                </td>
            </tr>
            </tbody>
        </table>
        <div class="error-text">${errorUsername} </div>
    </div>
</form:form>

</body>
</html>