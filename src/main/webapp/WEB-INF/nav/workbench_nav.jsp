<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="nav-second">
    <div>
        <button class="button-nav-second"
                onclick="window.location.href = '/addWorkBench';">Добавить станок
        </button>
        <button class="button-nav-second"
                onclick="window.location.href = '/workbenches/change/${workbench.id}';">Изменить станок
        </button>
        <button class="button-nav-second"
                onclick="window.location.href = '/workbenches/deletion/${workbench.id}';">Удалить станок
        </button>
    </div>
</nav>
