<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: airat
  Date: 01.08.2021
  Time: 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Регистрация</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
            integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
            crossorigin="anonymous"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <style>

    </style>
</head>
<body>


<div class="container-fluid d-flex h-100 justify-content-center align-items-center p-0">

    <div class="row bg-white shadow-sm">


        <h3 class="text-center mb-4">Регистрация</h3>
        <form:form method="post">
            <div class="form-group">
                <input type="text" class="form-control"
                       name="username" value="${username}" placeholder="Введите логин" style="margin-bottom: 5px;"
                       required>
            </div>
            <div class="form-group">
                <input type="text" class="form-control"
                       name="fio" value="${fio}" placeholder="Введите фамилию" style="margin-bottom: 5px;" required>
            </div>
            <div class="form-group">
                <input type="text" class="form-control"
                       name="name" value="${name}" placeholder="Введите имя" style="margin-bottom: 5px;" required>
            </div>
            <div class="form-group">
                <input type="text" class="form-control"
                       name="lastName" value="${lastName}" placeholder="Введите отчество" style="margin-bottom: 5px;"
                       required>
            </div>
            <div class="form-group">
                <input type="password" class="form-control" id="exampleInputPassword1" name="password"
                       placeholder="Введите пароль" style="margin-bottom: 5px;" required>
            </div>
            <div class="form-group">
                <input type="password" class="form-control" id="exampleInputPassword2" name="passwordConfirm"
                       placeholder="Повторите пароль" style="margin-bottom: 5px;" required>
            </div>
            <label style="color: red;text-align: center">${passwordError}</label>
            <br>
            <button type="submit" class="btn btn-primary w-100">Зарегистрироваться</button>


        </form:form>
    </div>
</div>

</body>
</html>
