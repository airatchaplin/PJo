<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<nav class="nav-second">
    <div>
        <button class="button-nav-second" style="width: 195px;"
                onclick="window.location.href = '/orders/add/${order.id}';">Добавить элемент
        </button>
        <button class="button-nav-second" style="width: 195px;"
                onclick="window.location.href = '/orders/change/${order.id}';">Изменить заказ
        </button>
        <button class="button-nav-second" style="width: 195px;"
                onclick="window.location.href = '/orders/deletion/${order.id}';">Удалить заказ
        </button>
        <button class="button-nav-second" style="width: 195px;"
                onclick="window.location.href = '/orders/calculationOrder/${order.id}';">Расчитать заказ
        </button>
    </div>
</nav>