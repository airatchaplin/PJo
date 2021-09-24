<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<nav class="nav-second">
    <div>
        <button class="button-nav-second" style="width: 195px;"
                onclick="window.location.href = '/addManager';">Добавить менеджера
        </button>
        <button class="button-nav-second" style="width: 195px;"
                onclick="window.location.href = '/managers/change/${managerById.id}';">Изменить
            менеджера
        </button>
        <button class="button-nav-second" style="width: 195px;"
                onclick="window.location.href = '/managers/deletion/${managerById.id}';">Удалить
            менеджера
        </button>
    </div>
</nav>