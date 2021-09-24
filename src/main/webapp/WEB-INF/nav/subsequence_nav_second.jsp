<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<nav class="nav-second">
    <div>
        <button class="button-nav-second" style="width: 260px;"
                onclick="window.location.href = '/typeOperations/addSubsequenceTypeOperation';">Добавить очередь операций
        </button>
        <button class="button-nav-second" style="width: 260px;"
                onclick="window.location.href = '/deletion/subsequenceTypeOperation/${operation.id}';">Удалить очередь операций
        </button>
    </div>
</nav>