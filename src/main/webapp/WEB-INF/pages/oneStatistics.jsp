<%@ page import="java.util.stream.Collectors" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Статистика ${workBench}</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

</head>
<body id="bod">
<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<form method="post">



    <div class="main">
        <table class="simple-little-table" cellspacing='0'>
            <thead>
            <tr>
                <th>Станок
                    <select style="width: 150px;" name="nowDate">
                        <option selected
                                value="${currentMonth}">${currentMonth==null?'Выберите месяц': currentMonth}</option>
                        <c:forEach items="${months}" var="month">
                            <option value="${month}">${month}</option>
                        </c:forEach>
                    </select>
                    <button class="input_js" style="background: #33d577;" type="submit" >
                        <img style="width: 12px" src="../../resources/icon/ok.png" alt=""></button>
                </th>
                <th>Число начала</th>
                <th>Число окончания</th>
                <th>Время начала</th>
                <th>Время окончания</th>
                <th>Деталь</th>
                <th>Номера заказов</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${statistics}" var="statistic">
                <tr>
                    <td>${workBench}</td>
                    <td> ${statistic.dayStart} </td>
                    <td> ${statistic.dayEnd} </td>
                    <td> ${statistic.dateStartTime} </td>
                    <td> ${statistic.dateEndTime} </td>
                    <td> ${statistic.detailName} </td>
                    <td> ${statistic.orderNumber} </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

    </div>
</form>
</body>

</html>