<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Getting Started: Serving Web Content</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
            integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
            crossorigin="anonymous"></script>
</head>
<body>
<header style="height: 50px;
    text-align: center;background: #d1d1d1;">
    <a style="padding: 10px;color: #000000;text-decoration: none;" href="/">Главная страница</a>
    <a style="padding: 10px;color: #000000;text-decoration: none;" href="/orders">Заказы </a>
    <a style="padding: 10px;color: #000000;text-decoration: none;" href="/details">Детали</a>
    <a style="padding: 10px;color: #000000;text-decoration: none;" href="/materials">Материалы </a>
    <a style="padding: 10px;color: #000000;text-decoration: none;" href="/managers">Менеджеры </a>
    <a style="padding: 10px;color: #000000;text-decoration: none;"
       href="/contragents">Контрагенты </a>
    <a style="padding: 10px;color: #000000;text-decoration: none;" href="/workbenches">Станки </a>
</header>

<div class="postHeader" style="background: #f2f2f2;text-align: center;padding: 5px;">
    <a style="padding: 10px;color: #000000;text-decoration: none;"
       href="/orders/change/${order.getNumberOrder()}">Изменить
        заказ</a>
    <a style="padding: 10px;color: #000000;text-decoration: none;"
       href="/orders/deletion/${order.getNumberOrder()}">Удалить
        заказ</a>
    <a style="padding: 10px;color: #000000;text-decoration: none;"
       href="/orders/add/${order.getNumberOrder()}">Добавить
        элемент</a>
    <a style="padding: 10px;color: #000000;text-decoration: none;"
       href="/orders/check1/${order.getNumberOrder()}">Расчитать
        время</a>
</div>
<h1 style="text-align: center">Расчитывание времяни детали</h1>
<h4>№ заказа ${order.getNumberOrder()}</h4>
<h4>Объект ${order.getObjectName().getName()}</h4>
<h4>Менеджер ${order.getManager().getFio_i_o()}</h4>
<c:forEach items="${order.getDetailInfos()}" var="ord">
    <table class="table table-striped table-sm">
        <thead>
        <tr>
            <th scope="col">Деталь</th>
            <th scope="col">Количество</th>
            <th scope="col">Станки по очередности производства детали</th>
            <th scope="col">Время окончания других заказов на этих станках</th>
            <th scope="col">Расчитано Да/нет</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>
                    ${ord.getDetail().getName()}
            </td>
            <td>
                    ${ord.getCount()}
            </td>
            <td>
                <c:forEach items="${ord.getDetail().getWorkBenches()}" var="workbench">
                    <pre>${workbench.getName()}</pre>
                </c:forEach>
            </td>
            <td>
                <c:forEach items="${ord.getDetail().getWorkBenches()}" var="workbench">
                    <pre>${workbench.getDateEndDetail()}</pre>
                </c:forEach>
            </td>

            <td>

                <c:forEach items="${ord.getIsCalculated()}" var="isCalc">
                    <pre> ${isCalc?"Да":"Нет"}</pre>
                </c:forEach>


            </td>

                <%--                            <td>${order.getCountDetail()}</td>--%>
                <%--                            <td>${order.getTypeMaterial()}</td>--%>
                <%--                            <td>${order.getDateStart()}</td>--%>
                <%--                            <td>${order.getDateEnd()}</td>--%>
                <%--                            <td>${order.getComment()}</td>--%>
        </tr>

            <%--                    <td><a href="/index/${user.username}" >${user.username}</a></td>--%>
            <%--                    <td>--%>
            <%--                        <c:forEach items="${user.roles}" var="role">${role.name}; </c:forEach>--%>
            <%--                    </td>--%>
            <%--                    <td>--%>
            <%--                        <form action="${pageContext.request.contextPath}/admin" method="post">--%>
            <%--                            <input type="hidden" name="userId" value="${user.id}"/>--%>
            <%--                            <input type="hidden" name="action" value="delete"/>--%>
            <%--                            <button class="but" type="submit">Delete</button>--%>
            <%--                        </form>--%>
            <%--                    </td>--%>


        </tbody>


    </table>
</c:forEach>
<form:form method="post">
    <button class="w-100 btn btn-primary btn-lg" type="submit">Расчитать</button>
</form:form>
</body>
</html>