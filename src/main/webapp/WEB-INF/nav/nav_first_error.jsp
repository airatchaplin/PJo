<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<nav class="nav-first">
    <div>
        <button class="button-nav-first"
                onclick="window.location.href = '/';">Главная
        </button>
        <button class="button-nav-first"
                onclick="window.location.href = '/orders';">Заказы
        </button>
        <button class="button-nav-first"
                onclick="window.location.href = '/details';">Детали
        </button>
        <button class="button-nav-first"
                onclick="window.location.href = '/materials';">Материалы
        </button>
        <button class="button-nav-first"
                onclick="window.location.href = '/managers';">Менеджеры
        </button>
        <button class="button-nav-first"
                onclick="window.location.href = '/contragents';">Контрагенты
        </button>
        <button class="button-nav-first"
                onclick="window.location.href = '/workbenches';">Станки
        </button>
    </div>
    <div>
        <button class="button-nav-first"
                onclick="window.location.href = '/statistics';">Статистика
        </button>
        <button class="button-nav-first"
                onclick="window.location.href = '/admin/allUsers';">Пользователи
        </button>
        <button style="width: 50px;" class="button-nav-first"
                onclick="window.location.href = '/settings';"><img style="width: 12px"
                                                                   src="../../resources/icon/settings.png" alt="">
        </button>
        <button class="button-nav-first"
                onclick="window.location.href = '/logout';">Выход
        </button>
    </div>
</nav>