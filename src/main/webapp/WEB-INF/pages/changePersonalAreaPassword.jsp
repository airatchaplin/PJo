<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Изменение пароля</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
    <link rel="stylesheet" href="../../resources/css/table_personalArea.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<jsp:include page="../nav/personalArea_nav_second.jsp"></jsp:include>
<form:form method="post">
    <jsp:include page="../nav/nav_third_save.jsp"></jsp:include>

    <div class="main">
        <table class="simple-little-table" cellspacing='0'>
            <thead>
            <tr>
                <th class="personal_areaPassword">Пароль</th>
                <th class="personal_areaPassword">Повторите пароль</th>
                <th>Показать</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td class="personal_areaPassword">
                    <input type="password" class="form-control" id="password-input1" name="password"
                           placeholder="Введите новый пароль" value="" required>
                    <label style="color: red;text-align: center">${passwordError}</label>
                </td>
                <td class="personal_areaPassword">
                    <input type="password" class="form-control" id="password-input2" name="passwordConfirm"
                           placeholder="Повторите новый пароль" value="" required>
                    <label style="color: red;text-align: center">${passwordError}</label>
                </td>
                <td>
                    <input type="checkbox" class="form-check-input" style="height: 16px;">
                </td>

            </tr>
            </tbody>
        </table>
    </div>
</form:form>

</body>
<script>
    $('body').on('click', '.form-check-input', function () {
        if ($(this).is(':checked')) {
            $('#password-input1').attr('type', 'text');
            $('#password-input2').attr('type', 'text');
        } else {
            $('#password-input1').attr('type', 'password');
            $('#password-input2').attr('type', 'password');
        }
    });
</script>
</html>