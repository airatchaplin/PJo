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
    <nav class="nav-third">

        <c:if test="${order.calculated}">
            <div>
                <button class="button-nav-second" formaction="/orders/changeDatePainting/${order.id}" type="submit">
                    Сохранить
                </button>
            </div>
        </c:if>
        <c:if test="${!order.calculated}">
            <div>
                <button class="button-nav-second" formaction="/orders/change/${order.id}" type="submit">
                    Сохранить
                </button>
            </div>
        </c:if>

    </nav>

    <div class="main">
        <table class="simple-little-table" cellspacing='0'>
            <thead>
            <tr>
                <th class="number_orders" style="text-align: center">№</th>
                <th>Контрагент</th>
                <th>Экономист</th>
                <th>Менеджер</th>
                <th>Дата запуска в производство</th>
                <th>Дата готовности заказа</th>

                <th>Коментарий</th>
            </tr>
            </thead>
            <tbody>

            <tr>
                <td class="number_orders" style="text-align: center"> ${order.numberOrder} </td>
                <td> ${order.objectName.name} </td>
                <td>${order.manager.fio_i_o} </td>
                <td>${order.manager.fio_i_o} </td>
                <td>${order.dateStartOrder}</td>
                <td>${order.dateEnd}</td>
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
                <th></th>
                <th>Дата запуска</th>
                <th>Дата окончания</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>Производство</td>
                <td>${dateStartOrder}</td>
                <td>${dateEndOrder}</td>
            </tr>
            <tr>
                <td>Упаковка</td>
                <td>${dateStartFirstPackage}</td>
                <td>${dateEndFirstPackage}</td>
            </tr>
            <tr>
                <td>Покраска</td>
                <c:if test="${order.calculated}">
                    <td>
                        <input type="datetime-local" id="dateStartPainting" name="dateStartPainting"
                               value="${dateStartPainting}"
                               required>
                    </td>
                    <td>
                        <input type="datetime-local" id="dateEndPainting" name="dateEndPainting"
                               value="${dateEndPainting}"
                               required>
                    </td>
                </c:if>
                <c:if test="${!order.calculated}">
                    <td>
                            ${dateStartPainting}
                    </td>
                    <td>
                            ${dateEndPainting}
                    </td>
                </c:if>
            </tr>
            <tr>
                <td>Упаковка после покраски</td>
                <td>
                        ${dateStartSecondPackage}
                </td>
                <td>
                        ${dateEndSecondPackage}
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
                    <c:if test="${order.calculated}">
                        <td>
                                ${ord.detailOrder.name}
                                <%--                            <input type="text" name="detailId" value="${ord.detailOrder.id}" style="display: none;">--%>

                        </td>
                        <td>
                                ${ord.count}
                                <%--                                <input type="text" class="form-control" id="countDetail" name="countDetail"--%>
                                <%--                                       placeholder="${ord.count}" value="${ord.count}" required>--%>

                        </td>
                    </c:if>
                    <c:if test="${!order.calculated}">
                        <td>
                                ${ord.detailOrder.name}
                            <input type="text" name="detailId" value="${ord.detailOrder.id}" style="display: none;">

                        </td>
                        <td>
                            <div>
                                <input type="text" class="form-control" id="countDetail" name="countDetail"
                                       placeholder="${ord.count}" value="${ord.count}" required>
                            </div>
                        </td>
                    </c:if>
                </tr>
            </c:forEach>
            </tbody>
        </table>


    </div>
</form:form>
</body>
</html>