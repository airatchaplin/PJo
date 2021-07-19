<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Getting Started: Serving Web Content</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
            integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
            crossorigin="anonymous"></script>
    <style>
        a {
            color: #000000;
            text-decoration: none;
        }
    </style>
</head>
<body>
<header style="height: 50px;
    text-align: center;background: #d1d1d1;">
    <a style="padding: 10px;color: #000000;text-decoration: none;" href="/">Главная страница</a>
    <a style="padding: 10px;color: #000000;text-decoration: none;" href="/orders">Заказы </a>
    <a style="padding: 10px;color: #000000;text-decoration: none;" href="/details">Детали</a>
    <a style="padding: 10px;color: #000000;text-decoration: none;" href="/materials">Материалы </a>
    <a style="padding: 10px;color: #000000;text-decoration: none;" href="/managers">Менеджеры </a>
    <a style="padding: 10px;color: #000000;text-decoration: none;" href="/contragents">Контрагенты </a>
    <a style="padding: 10px;color: #000000;text-decoration: none;" href="/workbenches">Станки </a>
</header>

<div class="postHeader" style="background: #f2f2f2;text-align: center;padding: 5px;">
    <a style="padding: 10px;color: #000000;text-decoration: none;" href="/addOrder">Добавить заказ</a>
</div>

<h1>Заказы</h1>


<table class="table table-striped table-sm">
    <thead>
    <tr>

        <th scope="col">№ заказа</th>
        <th scope="col">Объект</th>
        <th scope="col">Менеджер</th>
        <th scope="col">Элемент</th>
        <th scope="col">Материал</th>
        <th scope="col">Количество</th>
        <th scope="col">Дата запуска в производство</th>
        <th scope="col">Дата готовности заказа</th>
        <th scope="col">Коментарий</th>
    </tr>
    </thead>
    <tbody>

    <c:forEach items="${orders}" var="order">

        <tr>
            <td><a href="orders/${order.getNumberOrder()}">${order.getNumberOrder()}</a></td>
            <td><a href="orders/${order.getNumberOrder()}">${order.getObjectName().getName()}</a></td>
            <td>${order.getManager().getFio_i_o()}</td>
            <td>
                <c:forEach items="${order.getDetailInfos()}" var="detail">
                    <pre> ${detail.getDetail().getName()} </pre>
                </c:forEach>
            </td>

            <td>
                <c:forEach items="${order.getDetailInfos()}" var="detail">
                    <pre> ${detail.getMaterial().getName()} </pre>
                </c:forEach>
            </td>
            <td>
                <c:forEach items="${order.getDetailInfos()}" var="detail">
                    <pre> ${detail.getCount()} </pre>
                </c:forEach>
            </td>
            <td>
                <c:forEach items="${order.getDetailInfos()}" var="detail">
                <pre> ${detail.getDateStart()} </pre>
                </c:forEach>
            <td>
                <c:forEach items="${order.getDetailInfos()}" var="detail">
                <pre> ${detail.getDateEnd()} </pre>
                </c:forEach>
            <td>
                    ${order.getComment()}
            </td>
        </tr>

        <%--            <td><a href="/index/${user.username}" >${user.username}</a></td>--%>
        <%--            <td>--%>
        <%--                <c:forEach items="${user.roles}" var="role">${role.name}; </c:forEach>--%>
        <%--            </td>--%>
        <%--            <td>--%>
        <%--                <form action="${pageContext.request.contextPath}/admin" method="post">--%>
        <%--                    <input type="hidden" name="userId" value="${user.id}"/>--%>
        <%--                    <input type="hidden" name="action" value="delete"/>--%>
        <%--                    <button class="but" type="submit">Delete</button>--%>
        <%--                </form>--%>
        <%--            </td>--%>
    </c:forEach>


    </tbody>
</table>


</body>
</html>