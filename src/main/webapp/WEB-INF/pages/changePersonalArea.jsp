<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
  <title>Getting Started: Serving Web Content</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
          crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
          integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
          crossorigin="anonymous"></script>
  <style>
    a {
      color: #000000;
      text-decoration: none;
    }

    .table {
      width: 100%;
      border: none;
      margin-bottom: 20px;
    }

    .table thead th {
      font-weight: bold;
      text-align: left;
      border: none;
      padding: 10px 15px;
      background: #d8d8d8;
      font-size: 14px;
      border-left: 1px solid #ddd;
      border-right: 1px solid #ddd;
    }

    .table tbody td {
      text-align: left;
      border-left: 1px solid #ddd;
      border-right: 1px solid #ddd;
      padding: 10px 15px;
      font-size: 14px;
      vertical-align: top;
    }

    .table thead tr th:first-child, .table tbody tr td:first-child {
      border-left: none;
    }

    .table thead tr th:last-child, .table tbody tr td:last-child {
      border-right: none;
    }

    .table tbody tr:nth-child(even) {
      background: #f3f3f3;
    }

    .table > :not(caption) > * > * {
      border-bottom-width: 0px;
    }

    a:hover {
      background: gray;
    }
  </style>
</head>
<body>
<header style="height: 50px;
    text-align: center;background: #d1d1d1;">
  <a style="padding: 10px;color: #000000;text-decoration: none;" href="/">Главная страница</a>
  <a style="padding: 10px;color: #000000;text-decoration: none;" href="/orders">Заказы </a>
  <a style="padding: 10px;color: #000000;text-decoration: none;" href="/details">Детали</a>
  <a style="padding: 10px;color: #000000;text-decoration: none;" href="/materials">Материалы </a>
  <a style="padding: 10px;color: #000000;text-decoration: none;display: ${manager.roles.get(0).name ==("ROLE_USER")?"none":"contents"}"
     href="/admin/managers">Менеджеры </a>
  <a style="padding: 10px;color: #000000;text-decoration: none;" href="/contragents">Контрагенты </a>
  <a style="padding: 10px;color: #000000;text-decoration: none;" href="/workbenches">Станки </a>
  <a style="padding: 10px;color: #000000;text-decoration: none;" href="/logout">Выход </a>

</header>


<h1>Редактирование профиля</h1>

<form:form method="post">
  <table class="table">
    <thead>
    <tr>
      <th scope="col">Логин</th>
      <th scope="col">Пароль</th>
      <th scope="col">Повторите пароль</th>
      <th scope="col">Фамилия</th>
      <th scope="col">Имя</th>
      <th scope="col">Отчество</th>
      <th scope="col">Изменить</th>

    </tr>
    </thead>
    <tbody>
    <tr>
      <td>
        <input type="text" class="form-control" id="username" name="username"
               placeholder="Введите логин" value="${manager.getUsername()}" required>
      </td>
      <td>
        <input type="text" class="form-control" id="password" name="password"
               placeholder="Введите новый пароль" value="" required>
        <label style="color: red;text-align: center">${passwordError}</label>
      </td>
      <td>
        <input type="text" class="form-control" id="passwordConfirm" name="passwordConfirm"
               placeholder="Повторите новый пароль" value="" required>
        <label style="color: red;text-align: center">${passwordError}</label>
      </td>
      <td>
        <input type="text" class="form-control" id="fio" name="fio"
               placeholder="Введите фамилию" value=" ${manager.getFio()}" required>
      </td>
      <td>
        <input type="text" class="form-control" id="name" name="name"
               placeholder="Введите имя" value="${manager.getName()}" required>
      </td>
      <td>
        <input type="text" class="form-control" id="LastName" name="LastName"
               placeholder="Введите отчество" value="${manager.getLastName()}" required>
      </td>

      <td>
        <button class="form-control" style="width: auto;background-color: #0d6efd;color: #fff;" type="submit">
          Изменить
        </button>
      </td>
    </tr>


    </tbody>
  </table>
</form:form>


</body>
</html>