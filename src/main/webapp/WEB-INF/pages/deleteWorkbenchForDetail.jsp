<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Удаление станка - Основной</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

</head>
<body id="bod">
<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<jsp:include page="../nav/details_nav_second.jsp"></jsp:include>
<jsp:include page="../nav/details_workbench_nav_third.jsp"></jsp:include>


    <c:if test="${detail.detailListDtos.size()>1}">
        <nav style="
 /* position: fixed; */
    box-shadow: 0 5px 5px -5px;
    display: flex;
    /*justify-content: space-between;*/
    right: 0;
    left: 0;
    height: 52px;
    /* background: #f2f2f2; */
    background: #d1d1d100;
    /* padding: 15px; */
    top: 0;
    /* margin-top: 120px;">
            <div>
                <button class="button-nav-second" type="button"
                        onclick="window.location.href = '/details/deleteWorkbenchAlternative/${detail.id}';">
                    Запасной
                </button>
            </div>
        </nav>
    </c:if>

    <div class="main">
        <table class="simple-little-table" cellspacing='0'>
            <thead>
            <tr>
                <th>Деталь</th>
                <th>Материал</th>
                <th>Вариант</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td class="detail_name">${detail.name}</td>
                <td class="detail_material">${detail.materialName} ${detail.materialThickness}мм</td>
                <td class="detail_material">${detail.detailListDtos.get(0).mainOrAlternative == "1"?"Основной" :"Запасной"}</td>
            </tr>
            </tbody>
        </table>

        <table id="tableAdd" class="simple-little-table" cellspacing='0' style="margin-top: 10px;">
            <thead>
            <tr>
                <th>Станки</th>
                <th style="width: 10%;">Приоритет</th>
                <th style="width: 10%;">Время</th>
                <th>Примечание</th>
                <th>Удалить</th>
            </tr>
            </thead>
            <tbody>
            <c:set var="countDetailList" value="0" scope="page"/>
            <c:forEach items="${detail.detailListDtos.get(0).detailInfoDtos}" var="detailInfo">
                <tr>
                    <td><input style="color: black" type="text" name="workbenchName"
                               value="${detailInfo.workBenchDto.name}" readonly>
                    </td>
                    <td id="tdId${detail.detailListDtos.get(0).detailInfoDtos.indexOf(detailInfo)}"><input
                            class="inputAdd"
                            id="inputId${detail.detailListDtos.get(0).detailInfoDtos.indexOf(detailInfo)}"
                            type="text"
                            value="${detailInfo.workBenchDto.priority}">
                    </td>
                    <td><input class="inputAdd" type="text" name="timeWork" value="${detailInfo.timeWork}"></td>
                    <td style="text-align: center;"><input type="text" name="comment" value="${detailInfo.comment}">
                    </td>
                    <td style="padding: 0;width: 1%;">
                        <form method="post" action="/details/deleteWorkbenchMain/${detailInfo.workBenchDto.id}">
                        <button style="color: black;width: 150px;height: 50px;background: #d1d1d100;font-variant: all-small-caps;"
                                type="submit"
                                onclick="window.location.href = '/details/deleteWorkbenchMain/${detailInfo.workBenchDto.id}';">
                            Удалить
                        </button>
                            <input type="text" name="detailId" value="${detail.id}" style="display: none">

                        </form>
                    </td>
                </tr>
            </c:forEach>

            </tbody>
        </table>

        <div style="color: red">
            ${countWorkbenchError}
        </div>
    </div>


<%--    <button onclick="sortTable()">Sort</button>--%>

</body>
</html>