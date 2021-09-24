<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Изменение заказа</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
</head>
<body>
<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<jsp:include page="../nav/order_nav_second.jsp"></jsp:include>
<form:form method="post">
    <jsp:include page="../nav/nav_third_save.jsp"></jsp:include>

    <div class="main">
        <table class="simple-little-table" cellspacing='0'>
            <thead>
            <tr>
                <th>№ заказа</th>
                <th>Контрагент</th>
                <th>Экономист</th>
                <th>Менеджер</th>
                <th>Дата запуска в производство</th>
                <th>Дата готовности заказа</th>
                <th>Покраска</th>
                <th>Упаковка</th>
                <th>Коментарий</th>
            </tr>
            </thead>
            <tbody>

            <tr>
                <td> ${order.numberOrder} </td>
                <td> ${order.objectName.name} </td>
                <td>${order.manager.fio_i_o} </td>
                <td>${order.manager.fio_i_o} </td>
                <td>
                    <div>
                        <input type="datetime-local" class="form-control" id="dateStart"
                               name="dateStart">
                    </div>
                </td>
                <td>
                    <div>
                        <input type="datetime-local" class="form-control" id="dateEnd" name="dateEnd">
                    </div>
                </td>
                <td class="paiting">
                    <div>
                        <select name="weeksPaiting" id="weeksPaiting">
                            <option value="${order.painting.split("/")[0]}">
                                Недель ${order.painting.split("/")[0]}</option>
                            <c:forEach items="${weeks}" var="w">
                                <option value="${w}">${w}</option>
                            </c:forEach>
                        </select>
                        <select name="daysPaiting" id="daysPaiting">
                            <option value="${order.painting.split("/")[1]}">
                                Дней ${order.painting.split("/")[1]}</option>
                            <c:forEach items="${days}" var="d">
                                <option value="${d}">${d}</option>
                            </c:forEach>
                        </select>
                        <select name="hoursPaiting" id="hoursPaiting">
                            <option value="${order.painting.split("/")[2]}">
                                Часов ${order.painting.split("/")[2]}</option>
                            <c:forEach items="${hours}" var="d">
                                <option value="${d}">${d}</option>
                            </c:forEach>
                        </select>
                        <select name="minutesPaiting" id="minutesPaiting">
                            <option value="${order.painting.split("/")[3]}">
                                Минут ${order.painting.split("/")[3]}</option>
                            <c:forEach items="${minutes}" var="m">
                                <option value="${m}">${m}</option>
                            </c:forEach>
                        </select>
                    </div>
                </td>
                <td class="packing">
                    <div>
                        <select name="weeksPacking" id="weeks">
                            <option value="${order.packing.split("/")[0]}">
                                Недель ${order.packing.split("/")[0]}</option>
                            <c:forEach items="${weeks}" var="w">
                                <option value="${w}">${w}</option>
                            </c:forEach>
                        </select>
                        <select name="daysPacking" id="days">
                            <option value="${order.packing.split("/")[1]}">Дней ${order.packing.split("/")[1]}</option>
                            <c:forEach items="${days}" var="d">
                                <option value="${d}">${d}</option>
                            </c:forEach>
                        </select>
                        <select name="hoursPacking" id="hours">
                            <option value="${order.packing.split("/")[2]}">Часов ${order.packing.split("/")[2]}</option>
                            <c:forEach items="${hours}" var="d">
                                <option value="${d}">${d}</option>
                            </c:forEach>
                        </select>
                        <select name="minutesPacking" id="minutes">
                            <option value="${order.packing.split("/")[3]}">Минут ${order.packing.split("/")[3]}</option>
                            <c:forEach items="${minutes}" var="m">
                                <option value="${m}">${m}</option>
                            </c:forEach>
                        </select>
                    </div>
                </td>
                <td>
                    <input type="text" class="form-control" id="comment" name="comment"
                           placeholder="Новый коментарий">
                </td>
            </tr>
            </tbody>
        </table>

        <table style="margin-top: 8px" class="simple-little-table" cellspacing='0'>
            <thead>
            <tr>
                <th scope="col">Деталь</th>
                <th scope="col">Количество</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach items="${order.detailsOrders}" var="ord">
                <tr>
                    <td>
                        <select class="form-control" name="detailId">
                            <option>Выбранная: ${ord.detail.name}</option>
                            <c:forEach items="${details}" var="detail">
                                <option value="${detail.id}">${detail.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>
                        <div>
                            <input type="text" class="form-control" id="countDetail" name="countDetail"
                                   placeholder="${ord.count}" value="${ord.count}" required>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>


    </div>
</form:form>
</body>
</html>