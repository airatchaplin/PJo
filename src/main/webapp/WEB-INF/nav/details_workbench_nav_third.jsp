<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<nav class="nav-second">
    <div>
        <button class="button-nav-second"
                onclick="window.location.href = '/details/addWorkbenchMain/${detail.id}';">Добавить станок
        </button>
        <button class="button-nav-second"
                onclick="window.location.href = '/details/deleteWorkbenchMain/${detail.id}';">Удалить станок
        </button>
    </div>
</nav>