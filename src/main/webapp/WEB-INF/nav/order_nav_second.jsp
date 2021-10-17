<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<nav class="nav-second">
    <div>
        <button class="button-nav-second"
                onclick="window.location.href = '/orders/${order.id}';">Заказ
        </button>
        <button class="button-nav-second"
                onclick="window.location.href = '/orders/calculationOrder/${order.id}';">Расчитать заказ
        </button>
        <button class="button-nav-second"
                onclick="window.location.href = '/orders/change/${order.id}';">Изменить заказ
        </button>
        <button class="button-nav-second"
                onclick="window.location.href = '/orders/add/${order.id}';">Добавить элемент
        </button>
        <button class="button-nav-second"
                onclick="window.location.href = '/orders/deletion/${order.id}';">Удалить заказ
        </button>

    </div>
</nav>