<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Деталь</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
    <link rel="stylesheet" href="../../resources/css/table_details.css">
</head>
<body>
<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<jsp:include page="../nav/details_nav_second.jsp"></jsp:include>

<div class="main" style="margin-top: 120px">
    <table class="simple-little-table" cellspacing='0'>
        <thead>
        <tr>
            <th class="detail_name">Деталь</th>
            <th>Материал</th>
            <th>Станки</th>
            <th class="detail_time_work">Время</th>
            <th class="detail_time_work">Примечание</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td class="detail_name">${detail.name}</td>
            <td class="detail_material">${detail.materialName} ${detail.materialThickness}мм</td>
            <%--            <td>--%>
            <%--                <c:set var="count" value="0" scope="page"/>--%>
            <%--                <% int count = 0; %>--%>
            <%--                <c:forEach items="${detail.workBenchDtos}" var="workbench">--%>
            <%--                    <c:if test="${workbench.typeOperation.equals('ГИБКА')}">--%>
            <%--                        <c:if test="${count>0}">--%>
            <%--                            <pre style="font-size: 14px; color: red">Альтернатива: ${workbench.name}</pre>--%>
            <%--                        </c:if>--%>
            <%--                        <c:if test="${count==0}">--%>
            <%--                            <pre style="font-size: 14px">${workbench.name}</pre>--%>
            <%--                            <c:set var="count" value="${count + 1}" scope="page"/>--%>
            <%--                        </c:if>--%>
            <%--                    </c:if>--%>
            <%--                    <c:if test="${!workbench.typeOperation.equals('ГИБКА')}">--%>
            <%--                        <pre style="font-size: 14px">${workbench.name}</pre>--%>
            <%--                    </c:if>--%>
            <%--                </c:forEach>--%>
            <%--            </td>--%>


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
                    <pre>${detailInfo.timeWork.equals("")?" ":detailInfo.timeWork}</pre>
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
</div>

</body>
</html>