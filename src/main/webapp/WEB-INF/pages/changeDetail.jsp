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

<form method="post">
    <nav class="nav-second">
        <div>
            <a href="/addDetail">Добавить деталь</a>
            <a href="/details/change/${detail.id}">Изменить деталь</a>
            <a href="/details/deletion/${detail.id}">Удалить деталь</a>
        </div>
        <div>
            <input style="background: #f2f2f2; border: 0;cursor: pointer" type="submit" value="Сохрнаить">
        </div>
    </nav>

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
                <td class="detail_name">
                    <input type="text" class="form-control" id="detailName" name="detailName"
                           placeholder="${detail.name}" value="${detail.name}" required>
                </td>
                <td class="detail_material">
                    <select class="form-control" name="materialId">
                        <option value="${detail.materialId}">
                            Выбранная: ${detail.materialName} ${detail.materialThickness}мм
                        </option>
                        <c:forEach items="${materials}" var="material">
                            <option value="${material.id}">${material.name} ${material.thickness}мм</option>
                        </c:forEach>
                    </select>
                </td>
                <td>
                    <c:set var="countGibka" value="0" scope="page"/>
                    <c:set var="countRezka" value="0" scope="page"/>
                    <c:set var="countProbivka" value="0" scope="page"/>
                    <c:set var="countProkatka" value="0" scope="page"/>
                    <c:set var="countFrezirovka" value="0" scope="page"/>
                    <c:forEach items="${detail.detailInfoDtos}" var="detailInfo">
                        <div>
                            <select class="form-control" name="workBenchId">
                                <c:if test="${detailInfo.workBenchDto.typeOperation.equals('ГИБКА')}">
                                    <c:if test="${countGibka==3}">
                                        <option style="color: red;margin-top: 10px" value="${detailInfo.workBenchDto.id}">Выбранная
                                            Альтернатива: ${detailInfo.workBenchDto.name}</option>
                                    </c:if>
                                    <c:if test="${countGibka==2}">
                                        <option style="color: red;margin-top: 10px" value="${detailInfo.workBenchDto.id}">Выбранная
                                            Альтернатива: ${detailInfo.workBenchDto.name}</option>
                                        <c:set var="countGibka" value="${countGibka +1}" scope="page"/>
                                    </c:if>
                                    <c:if test="${countGibka==1}">
                                        <option style="color: red;margin-top: 10px" value="$detailInfo.workBenchDto.id}">Выбранная
                                            Альтернатива: ${detailInfo.workBenchDto.name}</option>
                                        <c:set var="countGibka" value="${countGibka +1}" scope="page"/>
                                    </c:if>
                                    <c:if test="${countGibka==0}">
                                        <option value="${detailInfo.workBenchDto.id}">Выбранная: ${detailInfo.workBenchDto.name}</option>
                                        ${countGibka+1}
                                        <c:set var="countGibka" value="${countGibka +1}" scope="page"/>
                                    </c:if>
                                </c:if>
                                <c:if test="${detailInfo.workBenchDto.typeOperation.equals('РЕЗКА')}">
                                    <c:if test="${countRezka==2}">
                                        <option style="color: red;margin-top: 10px" value="${detailInfo.workBenchDto.id}">Выбранная
                                            Альтернатива: ${detailInfo.workBenchDto.name}</option>
                                        <c:set var="countRezka" value="${countRezka + 1}" scope="page"/>
                                    </c:if>
                                    <c:if test="${countRezka==1}">
                                        <option style="color: red;margin-top: 10px" value="${detailInfo.workBenchDto.id}">Выбранная
                                            Альтернатива: ${detailInfo.workBenchDto.name}</option>
                                        <c:set var="countRezka" value="${countRezka + 1}" scope="page"/>
                                    </c:if>
                                    <c:if test="${countRezka==0}">
                                        <option value="${detailInfo.workBenchDto.id}">Выбранная: ${detailInfo.workBenchDto.name}</option>
                                        <c:set var="countRezka" value="${countRezka + 1}" scope="page"/>
                                    </c:if>
                                </c:if>
                                <c:if test="${detailInfo.workBenchDto.typeOperation.equals('ПРОБИВКА')}">
                                    <c:if test="${countProbivka==0}">
                                        <option value="${detailInfo.workBenchDto.id}">Выбранная: ${detailInfo.workBenchDto.name}</option>
                                        <c:set var="countProbivka" value="${countProbivka + 1}" scope="page"/>
                                    </c:if>
                                </c:if>
                                <c:if test="${detailInfo.workBenchDto.typeOperation.equals('ПРОКАТКА')}">
                                    <c:if test="${countProkatka==0}">
                                        <option value="${detailInfo.workBenchDto.id}">Выбранная: ${detailInfo.workBenchDto.name}</option>
                                        <c:set var="countProkatka" value="${countProkatka + 1}" scope="page"/>
                                    </c:if>
                                </c:if>
                                <c:if test="${detailInfo.workBenchDto.typeOperation.equals('ФРЕЗЕРОВКА')}">
                                    <c:if test="${countFrezirovka==0}">
                                        <option value="${detailInfo.workBenchDto.id}">Выбранная: ${detailInfo.workBenchDto.name}</option>
                                        <c:set var="countFrezirovka" value="${countFrezirovka + 1}" scope="page"/>
                                    </c:if>
                                </c:if>
                                <c:if test="${!detailInfo.workBenchDto.typeOperation.equals('ГИБКА') && !detailInfo.workBenchDto.typeOperation.equals('РЕЗКА')  }">
                                    <option value="${detailInfo.workBenchDto.id}">Выбранная: ${detailInfo.workBenchDto.name}</option>
                                </c:if>
                            </select>
                        </div>
                    </c:forEach>
                </td>
                <td class="detail_time_work">
                    <c:forEach items="${detail.detailInfoDtos}" var="detailInfo">
                        <div>
                            <input type="text" class="form-control" id="timeWork" name="timeWork"
                                   placeholder="${detailInfo.timeWork}" value="${detailInfo.timeWork}" required>
                        </div>
                    </c:forEach>
                </td>
                <td class="detail_time_work">
                    <c:forEach items="${detail.detailInfoDtos}" var="detailInfo">
                        <div>
                            <input type="text" class="form-control" id="comment" name="comment"
                                   placeholder="${detailInfo.comment}" value="${detailInfo.comment}" required>
                        </div>
                    </c:forEach>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</form>
</body>
</html>