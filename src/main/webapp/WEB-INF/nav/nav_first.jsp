<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<nav class="nav-first">
    <div>
<%--        <button class="button-nav-first"--%>
<%--                onclick="window.location.href = '/';">Главная--%>
<%--        </button>--%>
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
        <c:if test="${user.roles.get(0).name.equals('ROLE_ADMIN')}">
            <button class="button-nav-first"
                    onclick="window.location.href = '/admin/allUsers';">Пользователи
            </button>
        </c:if>
        <button class="button-nav-first"
                onclick="window.location.href = '/personalArea';">${user.fio_i_o}
        </button>
        <c:if test="${user.roles.get(0).name.equals('ROLE_ADMIN')}">
            <button style="width: 50px;" class="button-nav-first"
                    onclick="window.location.href = '/admin/settings';"><img style="width: 12px"
                                                                       src="../../resources/icon/settings.png" alt="">
            </button>
        </c:if>
        <button class="button-nav-first"
                onclick="window.location.href = '/logout';">Выход
        </button>
    </div>
</nav>