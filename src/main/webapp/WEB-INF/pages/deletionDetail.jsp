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
    <link rel="stylesheet" href="../../resources/css/table_details.css">
</head>
<body>
<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<jsp:include page="../nav/details_nav_second.jsp"></jsp:include>
<form:form action="/details/deletion/${detail.id}"
           method="post">
    <jsp:include page="../nav/nav_third_del.jsp"></jsp:include>
</form:form>


<div class="main">
    <table class="simple-little-table" cellspacing='0'>
        <thead>
        <tr>
            <th class="detail_name">Деталь</th>
            <th class="detail_material">Материал</th>
            <th>Станки</th>
            <th class="detail_time_work">Время</th>
            <th class="detail_time_work">Примечание</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td class="detail_name">${detail.name}</td>
            <td class="detail_material">${detail.materialName} ${detail.materialThickness}мм</td>
            <td>
                <c:set var="countGibka" value="0" scope="page"/>
                <c:set var="countRezka" value="0" scope="page"/>
                <c:forEach items="${detail.detailInfoDtos}" var="detailInfo">
                    <c:if test="${detailInfo.workBenchDto.typeOperation.equals('ГИБКА')}">
                        <c:if test="${countGibka>0}">
                            <pre style="color: red">Альтернатива: ${detailInfo.workBenchDto.name}</pre>
                        </c:if>
                        <c:if test="${countGibka==0}">
                            <pre>${detailInfo.workBenchDto.name}</pre>
                            <c:set var="countGibka" value="${countGibka + 1}" scope="page"/>
                        </c:if>
                    </c:if>
                    <c:if test="${detailInfo.workBenchDto.typeOperation.equals('РЕЗКА')}">
                        <c:if test="${countRezka>0}">
                            <pre style="color: red">Альтернатива: ${detailInfo.workBenchDto.name}</pre>
                        </c:if>
                        <c:if test="${countRezka==0}">
                            <pre>${detailInfo.workBenchDto.name}</pre>
                            <c:set var="countRezka" value="${countRezka + 1}" scope="page"/>
                        </c:if>
                    </c:if>
                    <c:if test="${!detailInfo.workBenchDto.typeOperation.equals('ГИБКА') && !detailInfo.workBenchDto.typeOperation.equals('РЕЗКА')  }">
                        <pre>${detailInfo.workBenchDto.name}</pre>
                    </c:if>
                </c:forEach>
                <pre>Упаковка</pre>
            </td>
            <td class="detail_time_work">
                <c:forEach items="${detail.detailInfoDtos}" var="detailInfo">
                    <pre>${detailInfo.timeWork}</pre>
                </c:forEach>
                <pre>${detail.timePacking}</pre>
            </td>
            <td class="detail_time_work">
                <c:forEach items="${detail.detailInfoDtos}" var="detailInfo">
                    <pre>${detailInfo.comment.equals("")?" ":detailInfo.comment}</pre>
                </c:forEach>
                <pre> </pre>
            </td>
        </tr>
        </tbody>
    </table>
    <label style="color: red">${detailError}</label>
</div>
</body>

</html>