<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Детали</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_hover.css">
    <link rel="stylesheet" href="../../resources/css/table_details.css">
</head>
<body>
<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<c:if test="${setting.get(0).viewing==false && user.roles.get(0).name.equals('ROLE_USER')}">
    <nav class="nav-second">
        <button class="button-nav-second"
                onclick="window.location.href = '/addDetail';">Добавить деталь
        </button>
    </nav>
</c:if>
<c:if test="${user.roles.get(0).name.equals('ROLE_ADMIN')}">
    <nav class="nav-second">
        <button class="button-nav-second"
                onclick="window.location.href = '/addDetail';">Добавить деталь
        </button>
    </nav>
</c:if>

<div class="main">
    <table class="simple-little-table" cellspacing='0'>
        <thead>
        <form:form>
            <tr>
                <th class="number" style="text-align: center">№</th>
                <th>Деталь
                    <button class="button-filter" name="filter" value="details" style="border: none;" type="submit">
                            ${user.filter_details.equals("details")?"&#11167;":"&#11165;"}
                    </button>
                </th>
                <th>Материал
                    <button class="button-filter" name="filter" value="materials" style="border: none;" type="submit">
                            ${user.filter_details.equals("materials")?"&#11167;":"&#11165;"}
                    </button>
                </th>
                <th>Толщина
                    <button class="button-filter" name="filter" value="thickness" style="border: none;" type="submit">
                            ${user.filter_details.equals("thickness")?"&#11167;":"&#11165;"}
                    </button>
                </th>
                    <%--            <th scope="col">Станки</th>--%>
                    <%--            <th scope="col">Время детали на этом станке</th>--%>
            </tr>
        </form:form>
        </thead>
        <tbody>
        <c:forEach items="${details}" var="detail">
            <tr>
                <td class="number" style="text-align: center">${count + 1}</td>
                <td><a style="display: block" href="details/${detail.id}">${detail.name}</a></td>
                <td><a style="display: block" href="details/${detail.id}">${detail.materialName}</a></td>
                <td><a style="display: block" href="details/${detail.id}">${detail.materialThickness}мм</a></td>
                    <%--                <td>--%>
                    <%--                    <c:set var="count" value="0" scope="page"/>--%>
                    <%--                    <% int countGibka = 0;--%>
                    <%--                        int countRezka = 0; %>--%>
                    <%--                    <c:forEach items="${detail.workBenchDtos}" var="workbench">--%>
                    <%--                        <c:if test="${workbench.typeOperation.name.equals('ГИБКА')}">--%>
                    <%--                            <c:if test="${countGibka>0}">--%>
                    <%--                                <pre style="font-size: 14px; color: red">Альтернатива: ${workbench.name}</pre>--%>
                    <%--                            </c:if>--%>
                    <%--                            <c:if test="${countGibka==0}">--%>
                    <%--                                <pre style="font-size: 14px">${workbench.name}</pre>--%>
                    <%--                                <c:set var="countGibka" value="${countGibka + 1}" scope="page"/>--%>
                    <%--                            </c:if>--%>
                    <%--                        </c:if>--%>
                    <%--                        <c:if test="${workbench.typeOperation.name.equals('РЕЗКА')}">--%>
                    <%--                            <c:if test="${countRezka>0}">--%>
                    <%--                                <pre style="font-size: 14px; color: red">Альтернатива: ${workbench.name}</pre>--%>
                    <%--                            </c:if>--%>
                    <%--                            <c:if test="${countRezka==0}">--%>
                    <%--                                <pre style="font-size: 14px">${workbench.name}</pre>--%>
                    <%--                                <c:set var="countRezka" value="${countRezka + 1}" scope="page"/>--%>
                    <%--                            </c:if>--%>
                    <%--                        </c:if>--%>
                    <%--                        <c:if test="${!workbench.typeOperation.name.equals('ГИБКА') || !workbench.typeOperation.name.equals('РЕЗКА')  }">--%>
                    <%--                            <pre style="font-size: 14px">${workbench.name}</pre>--%>
                    <%--                        </c:if>--%>
                    <%--                    </c:forEach>--%>
                    <%--                </td>--%>
                    <%--                <td>--%>
                    <%--                    <c:forEach items="${detail.timeWorkDetailsDtos}" var="timeWork">--%>
                    <%--                        <pre style="font-size: 14px">${timeWork.timeWork}</pre>--%>
                    <%--                    </c:forEach>--%>
                    <%--                </td>--%>
            </tr>
            <c:set var="count" value="${count + 1}" scope="page"/>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>