<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<nav class="nav-second">
    <div>
        <button class="button-nav-second" style="width: 195px;"
                onclick="window.location.href = '/addMaterial';">Добавить материал
        </button>
        <button class="button-nav-second" style="width: 195px;"
                onclick="window.location.href = '/materials/change/${material.id}';">Изменить
            материал
        </button>
        <button class="button-nav-second" style="width: 195px;"
                onclick="window.location.href = '/materials/deletion/${material.id}';">Удалить
            материал
        </button>
    </div>
</nav>