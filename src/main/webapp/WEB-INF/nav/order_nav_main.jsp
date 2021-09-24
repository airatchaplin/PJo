<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<nav class="nav-second">
    <div>
        <button class="button-nav-second" style="width: 195px;"
                onclick="window.location.href = '/orders';">Действующие заказы
        </button>
        <button class="button-nav-second" style="width: 195px;"
                onclick="window.location.href = '/completed_orders';">Завершенные заказы
        </button>
        <button class="button-nav-second" style="width: 195px;"
                onclick="window.location.href = '/addOrder/${operation.id}';">Добавить заказ
        </button>
    </div>
</nav>