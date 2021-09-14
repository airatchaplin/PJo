<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Изменение станка</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
    <link rel="stylesheet" href="../../resources/css/table_workbenches.css">
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
            <a href="/addWorkBench">Добавить станок</a>
            <a href="/workbenches/change/${workbench.id}">Изменить станок</a>
            <a href="/workbenches/deletion/${workbench.id}">Удалить станок</a>
        </div>
        <div>
            <input style="background: #f2f2f2; border: 0;cursor: pointer; " type="submit" value="Сохранить">
        </div>
    </nav>

    <div class="main">
        <table class="simple-little-table" cellspacing='0'>
            <thead>
            <tr>
                <th>Станок</th>
                <th class="th_workbench_typeOperation">Операция</th>
                <th class="th_workbench_currentThickness">Толщина</th>
                <th class="th_workbench_dateEnd">Время окончния</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>
                    <input type="text" id="workBenchName" name="workBenchName"
                           placeholder="Введите название станка" value="${workbench.name}" required>
                    <div class="error" style="color: red;">
                            ${workBenchRepeatError}
                    </div>
                </td>
                <td class="th_workbench_typeOperation">
                    <select class="form-control" name="typeOperationId">
                        <option selected value="${workbench.typeOperation.id}">Выбранная
                            операция ${workbench.typeOperation.name}</option>
                        <c:forEach items="${operations}" var="operation">
                            <option value="${operation.id}">${operation.name}</option>
                        </c:forEach>
                    </select>
                </td>
                <td class="th_workbench_currentThickness">
                    <input type="text" class="form-control" id="currentThickness" name="currentThickness"
                           value="${workbench.currentThickness}" required>
                </td>
                <td class="th_workbench_dateEnd">
                    <input type="datetime-local" class="form-control" id="dateEndDetail" name="dateEndDetail"
                           value="${workbench.dateEndDetail}" required>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</form:form>
</body>
</html>