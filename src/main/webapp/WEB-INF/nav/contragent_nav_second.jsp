<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<nav class="nav-second">
    <div>
        <button class="button-nav-second" style="width: 195px;"
                onclick="window.location.href = '/addContragent';">Добавить контрагента
        </button>
        <button class="button-nav-second" style="width: 195px;"
                onclick="window.location.href = '/contragents/change/${contragent.id}';">Изменить
            контрагента
        </button>
        <button class="button-nav-second" style="width: 195px;"
                onclick="window.location.href = '/contragents/deletion/${contragent.id}';">Удалить
            контрагента
        </button>
    </div>
</nav>