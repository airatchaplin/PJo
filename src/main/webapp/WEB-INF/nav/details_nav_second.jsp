<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<nav class="nav-second">
    <div>
        <button class="button-nav-second"
                onclick="window.location.href = '/addDetail';">Добавить деталь
        </button>
        <button class="button-nav-second"
                onclick="window.location.href = '/details/change/${detail.id}';">Изменить деталь
        </button>
        <button class="button-nav-second"
                onclick="window.location.href = '/details/deletion/${detail.id}';">Удалить
            деталь
        </button>
        <button class="button-nav-second"
                onclick="window.location.href = '/details/addWorkbenchMain/${detail.id}';">Станки детали
        </button>
        <c:if test="${detail.detailListDtos.size()== 1}">
            <button class="button-nav-second"
                    onclick="window.location.href = '/addAlternative/${detail.id}';">Добавить вариант
            </button>
        </c:if>
        <c:if test="${detail.detailListDtos.size()== 2}">
            <button class="button-nav-second" style="display: none;"
                    onclick="window.location.href = '/addAlternative/${detail.id}';">Добавить вариант
            </button>
        </c:if>
    </div>
</nav>