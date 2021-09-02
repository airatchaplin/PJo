<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Удаление детали</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
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

<nav class="nav-second">
    <div>
        <a href="/addDetail">Добавить деталь</a>
        <a href="/details/change/${detail.id}">Изменить деталь</a>
        <a href="/details/deletion/${detail.id}">Удалить
            деталь</a>
    </div>
    <div>
        <form:form action="/details/deletion/${detail.id}"
                   method="post">
            <input style="background: #f2f2f2; border: 0;" type="submit" value="Удалить">
        </form:form>
    </div>
</nav>

<div class="main">
    <table class="simple-little-table" cellspacing='0'>
        <thead>
        <tr>
            <th scope="col">Деталь</th>
            <th scope="col">Материал</th>
            <th scope="col">Станки</th>
            <th scope="col">Время детали на этом станке</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${detail.name}</td>
            <td>${detail.materialName} ${detail.materialThickness}мм</td>
            <td>
                <c:set var="countGibka" value="0" scope="page"/>
                <c:set var="countRezka" value="0" scope="page"/>
                <c:set var="countProbivka" value="0" scope="page"/>
                <c:set var="countProkatka" value="0" scope="page"/>
                <c:set var="countFrezirovka" value="0" scope="page"/>
                <c:forEach items="${detail.workBenchDtos}" var="workbench">
                    <c:if test="${workbench.typeOperation.equals('ГИБКА')}">
                        <c:if test="${countGibka==3}">
                            <pre style="color: red">Альтернатива: ${workbench.name}</pre>
                        </c:if>
                        <c:if test="${countGibka==2}">
                            <pre style="color: red">Альтернатива: ${workbench.name}</pre>
                            <c:set var="countGibka" value="${countGibka +1}" scope="page"/>
                        </c:if>
                        <c:if test="${countGibka==1}">
                            <pre style="color: red">Альтернатива: ${workbench.name}</pre>
                            <c:set var="countGibka" value="${countGibka +1}" scope="page"/>
                        </c:if>
                        <c:if test="${countGibka==0}">
                            <pre>${workbench.name}</pre>
                            <c:set var="countGibka" value="${countGibka +1}" scope="page"/>
                        </c:if>
                    </c:if>
                    <c:if test="${workbench.typeOperation.equals('РЕЗКА')}">
                        <c:if test="${countRezka==2}">
                            <pre style="color: red">Альтернатива: ${workbench.name}</pre>
                            <c:set var="countRezka" value="${countRezka + 1}" scope="page"/>
                        </c:if>
                        <c:if test="${countRezka==1}">
                            <pre style="color: red">Альтернатива: ${workbench.name}</pre>
                            <c:set var="countRezka" value="${countRezka + 1}" scope="page"/>
                        </c:if>
                        <c:if test="${countRezka==0}">
                            <pre>${workbench.name}</pre>
                            <c:set var="countRezka" value="${countRezka + 1}" scope="page"/>
                        </c:if>
                    </c:if>
                    <c:if test="${workbench.typeOperation.equals('ПРОБИВКА')}">
                        <c:if test="${countProbivka==0}">
                            <pre>${workbench.name}</pre>
                            <c:set var="countProbivka" value="${countProbivka + 1}" scope="page"/>
                        </c:if>
                    </c:if>
                    <c:if test="${workbench.typeOperation.equals('ПРОКАТКА')}">
                        <c:if test="${countProkatka==0}">
                            <pre>${workbench.name}</pre>
                            <c:set var="countProkatka" value="${countProkatka + 1}" scope="page"/>
                        </c:if>
                    </c:if>
                    <c:if test="${workbench.typeOperation.equals('ФРЕЗЕРОВКА')}">
                        <c:if test="${countFrezirovka==0}">
                            <pre>${workbench.name}</pre>
                            <c:set var="countFrezirovka" value="${countFrezirovka + 1}" scope="page"/>
                        </c:if>
                    </c:if>
                    <c:if test="${!workbench.typeOperation.equals('ГИБКА') && !workbench.typeOperation.equals('РЕЗКА')  }">
                        <pre>${workbench.name}</pre>
                    </c:if>




<%--                    <c:if test="${workbench.typeOperation.equals('ГИБКА')}">--%>
<%--                        <c:if test="${count>0}">--%>
<%--                            <pre style="color: red">Альтернатива: ${workbench.name}</pre>--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${count==0}">--%>
<%--                            <pre>${workbench.name}</pre>--%>
<%--                            <c:set var="count" value="${count + 1}" scope="page"/>--%>
<%--                        </c:if>--%>
<%--                    </c:if>--%>
<%--                    <c:if test="${!workbench.typeOperation.equals('ГИБКА')}">--%>
<%--                        <pre>${workbench.name}</pre>--%>
<%--                    </c:if>--%>
                </c:forEach>
            </td>
            <td>
                <c:forEach items="${detail.timeWorkDetailsDtos}" var="timeWork">
                    <pre>${timeWork.timeWork}</pre>
                </c:forEach>
            </td>
        </tr>
        </tbody>
    </table>
    <label style="color: red">${detailError}</label>
</div>
</body>

</html>