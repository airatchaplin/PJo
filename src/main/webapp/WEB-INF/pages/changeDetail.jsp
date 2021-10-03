<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Изменение детали</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
    <link rel="stylesheet" href="../../resources/css/table_details.css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<jsp:include page="../nav/details_nav_second.jsp"></jsp:include>
<form method="post">
    <jsp:include page="../nav/nav_third_save.jsp"></jsp:include>

    <div class="main">
        <table class="simple-little-table" cellspacing='0'>
            <thead>
            <tr>
                <th class="detail_name">Деталь</th>
                <th class="detail_material">Материал</th>
                <th class="detail_material">Вариант</th>
                <th>Станки</th>
                <th class="detail_time_work">Время</th>
                <th class="detail_time_work">Примечание</th>
            </tr>
            </thead>
            <tbody>
            <c:set var="countDetailList" value="0" scope="page"/>
            <c:forEach items="${detail.detailListDtos}" var="detailList">
                <tr>
                    <c:if test="${countDetailList>0}">
                        <td></td>
                        <td></td>
                    </c:if>
                    <c:if test="${countDetailList==0}">
                        <td style="width: 30%;">
                            <input type="text" class="form-control" id="detailName" name="detailName"
                                   placeholder="${detail.name}" value="${detail.name}" required>
                        </td>
                        <td style="width: 13%;">
                            <select class="form-control" name="materialId">
                                <option value="${detail.materialId}">
                                    Выбранная: ${detail.materialName} ${detail.materialThickness}мм
                                </option>
                                <c:forEach items="${materials}" var="material">
                                    <option value="${material.id}">${material.name} ${material.thickness}мм</option>
                                </c:forEach>
                            </select>
                        </td>
                    </c:if>
                    <td class="detail_material">${detailList.mainOrAlternative == "1"?"Основной" :"Запасной"}</td>
                    <c:if test="${countDetailList==0}">
                        <td class="workbench_name">
                            <c:set var="countGibka" value="0" scope="page"/>
                            <c:set var="countRezka" value="0" scope="page"/>
                            <c:forEach items="${detailList.detailInfoDtos}" var="detailInfo">
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
                    </c:if>
                    <c:if test="${countDetailList>0}">
                        <td class="workbench_name">
                            <c:set var="countGibka" value="0" scope="page"/>
                            <c:set var="countRezka" value="0" scope="page"/>
                            <c:forEach items="${detailList.detailInfoDtos}" var="detailInfo">
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
                    </c:if>
                    <td class="detail_time_work">
                        <c:forEach items="${detailList.detailInfoDtos}" var="detailInfo">
                            <c:if test="${countDetailList==0}">
                                <div>
                                    <input type="text" class="form-control" id="timeWork" name="timeWork"
                                           placeholder="${detailInfo.timeWork}" value="${detailInfo.timeWork}">
                                </div>
                            </c:if>
                            <c:if test="${countDetailList>0}">
                                <div>
                                    <input type="text" class="form-control" id="timeWork1" name="timeWork1"
                                           placeholder="${detailInfo.timeWork}" value="${detailInfo.timeWork}">
                                </div>
                            </c:if>
                        </c:forEach>
                    </td>
                    <td style="width: 20%">
                        <c:forEach items="${detailList.detailInfoDtos}" var="detailInfo">
                            <c:if test="${countDetailList==0}">
                                <div>
                                    <input type="text" class="form-control" id="comment" name="comment"
                                           placeholder="${detailInfo.comment}" value="${detailInfo.comment}">
                                </div>
                            </c:if>
                            <c:if test="${countDetailList>0}">
                                <div>
                                    <input type="text" class="form-control" id="comment1" name="comment1"
                                           placeholder="${detailInfo.comment}" value="${detailInfo.comment}">
                                </div>
                            </c:if>
                        </c:forEach>
                    </td>
                </tr>
                <c:set var="countDetailList" value="${countDetailList + 1}" scope="page"/>
            </c:forEach>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td>Упаковка</td>
                <td>
                    <div>
                        <input type="text" class="form-control" id="timePacking" name="timePacking"
                               placeholder="${detail.timePacking}" value="${detail.timePacking}">
                    </div>
                </td>
                <td></td>

            </tr>
            </tbody>
        </table>
    </div>
</form>
</body>
</html>