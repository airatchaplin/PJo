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

<div class="main">
    <table class="simple-little-table" cellspacing='0'>
        <thead>
        <tr>
            <th class="detail_name">Деталь</th>
            <th>Материал</th>
            <th>Вариант</th>
            <th>Станки</th>
            <th class="detail_time_work">Время</th>
            <th>Время станка</th>
            <th>Тек.толщ.</th>
            <th class="detail_time_work">Примечание</th>
        </tr>
        </thead>
        <tbody>
        <c:set var="countDetailList" value="0" scope="page"/>
        <c:forEach items="${detail.detailListDtos}" var="detailListDtos">
            <tr>
                <c:if test="${countDetailList>0}">
                    <td></td>
                    <td></td>
                </c:if>
                <c:if test="${countDetailList==0}">
                    <td class="detail_name">${detail.name}</td>
                    <td class="detail_material">${detail.materialName} ${detail.materialThickness}мм</td>
                    <c:set var="countDetailList" value="${countDetailList + 1}" scope="page"/>
                </c:if>
                <td class="detail_material">${detailListDtos.mainOrAlternative == "1"?"Основной" :"Запасной"}</td>
                <td class="workbench_name">
                    <c:set var="countGibka" value="0" scope="page"/>
                    <c:set var="countRezka" value="0" scope="page"/>
                    <c:forEach items="${detailListDtos.detailInfoDtos}" var="detailInfo">
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
                </td>
                <td class="detail_time_work">
                    <c:forEach items="${detailListDtos.detailInfoDtos}" var="detailInfo">
                        <pre>${detailInfo.timeWork.equals("")?" ":detailInfo.timeWork}</pre>
                    </c:forEach>
                </td>
                <td class="detail_time_work">
                    <c:forEach items="${detailListDtos.detailInfoDtos}" var="detailInfo">
                        <pre>${detailInfo.workBenchDto.dateEndDetail}</pre>
                    </c:forEach>
                </td>
                <td class="workbench_currentThickness">
                    <c:forEach items="${detailListDtos.detailInfoDtos}" var="detailInfo">
                        <pre>${detailInfo.workBenchDto.currentThickness} мм</pre>
                    </c:forEach>
                </td>
                <td class="detail_time_work">
                    <c:forEach items="${detailListDtos.detailInfoDtos}" var="detailInfo">
                        <pre>${detailInfo.comment.equals("")?" ":detailInfo.comment}</pre>
                    </c:forEach>
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td></td>
            <td></td>
            <td class="detail_material"></td>
            <td>Упаковка</td>
            <td class="detail_time_work">
                <pre>${detail.timePacking}</pre>
            </td>
            <td class="detail_time_work"></td>
            <td class="detail_time_work"></td>
            <td></td>
        </tr>
        </tbody>
    </table>
</div>

</body>
</html>