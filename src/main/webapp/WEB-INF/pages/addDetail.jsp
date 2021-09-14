<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Добавление детали</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

</head>
<body id="bod">
<nav class="nav-first">
    <div>
        <a href="/">Главная страница</a>
        <a href="/orders">Заказы </a>
        <a href="/details">Детали</a>
        <a href="/materials">Материалы </a>
        <a href="/managers">Менеджеры </a>
        <a href="/contragents">Контрагенты </a>
        <a href="/workbenches">Станки </a>
    </div>
    <div>
        <a style="display: ${user.roles.get(0).name.equalsIgnoreCase("ROLE_ADMIN") ? "contents" : "none"}"
           href="/admin/allUsers">Все пользователи</a>
        <a href="/personalArea">${user.fio_i_o} </a>
        <a href="/logout">Выход</a>
    </div>
</nav>

<form method="post">
    <nav class="nav-second">
        <div>
            <a href="/addDetail">Добавить деталь</a>
        </div>
        <div>
            <input style="background: #f2f2f2; border: 0;cursor: pointer" type="submit" value="Сохрнаить">
        </div>
    </nav>
    <div class="main">
        <table class="simple-little-table" cellspacing='0'>
            <thead>
            <tr>
                <th>Деталь</th>
                <th>Материал</th>
                <th>Операции</th>
                <th>Станки</th>
                <th>Время</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>
                    <input type="text" class="form-control" id="detailName" name="detailName"
                           placeholder="Введите название детали" value="" required>
                    <div class="error" style="color: red;">
                        ${detailError}
                    </div>
                </td>
                <td>
                    <select class="form-control" name="materialId">
                        <option selected value="Выберите материал">Выбирите материал</option>
                        <c:forEach items="${materials}" var="material">
                            <option value="${material.id}">${material.name} ${material.thickness}мм</option>
                        </c:forEach>
                    </select>
                </td>
                <td id="columnOperation">
                    <select onchange="test1(this)" class="form-control">
                        <option selected value="Выберите операции">Выбирите операции</option>
                        <c:forEach items="${operations}" var="operation">
                            <option value="${operation.description}">${operation.description}</option>
                        </c:forEach>
                    </select>
                </td>
                <td id="columnWorkBench"></td>
                <td id="columnTimeWork"></td>
            </tr>
            </tbody>
        </table>
    </div>
</form>

</body>
<script>
    var countWorkBench = 0;
    var countTimeWork = 0;

    function test1(select) {
        var selectedOption = select.options[select.selectedIndex];
        var string = selectedOption.value;
        var arr = string.split(' -> ');
        for (let i = countWorkBench; i >= 0; i--) {
            $("#forDeleteWorkBench" + i).remove();
        }
        for (let i = countTimeWork; i >= 0; i--) {
            $("#forDeleteTimeWork" + i).remove();
        }
        countTimeWork = 0;
        countWorkBench = 0;
        countInp = 0;
        countOpt = 0;
        for (let i = 0; i < arr.length; i++) {
            if (arr[i] === "РЕЗКА") {
                rezka();
            }
            if (arr[i] === "ПРОБИВКА") {
                probivka();
            }
            if (arr[i] === "ПРОКАТКА") {
                prokatka();
            }
            if (arr[i] === "ГИБКА") {
                gibka();
            }
            if (arr[i] === "ФРЕЗЕРОВКА") {
                frezirovka();
            }
        }
    }


    function rezka() {
        var component1 = '';
        component1 += '<div id="forDeleteWorkBench' + countWorkBench + '">';
        component1 += '<select  onchange="OnSelectionChange (this)" class="form-control" name="workBenchId">';
        component1 += '<option   id = "selectedElement' + countWorkBench + '" selected value="Выберите станок">Выберите станок</option>';
        component1 += '<c:forEach items="${РЕЗКА}" var="workbench">';
        component1 += '<option  id = "elem'+countWorkBench+'" value="${workbench.id}">${workbench.name}</option>';
        component1 += '</c:forEach>';
        component1 += '</select>';
        component1 += '</div>';
        countWorkBench++;
        component1 += '<div style="margin-bottom: 10px;" id="forDeleteWorkBench' + countWorkBench + '">';
        component1 += '<select  onchange="OnSelectionChange (this)" class="form-control" name="workBenchId">';
        component1 += '<option   id = "selectedElement' + countWorkBench + '" selected value="Выберите станок">Выберите станок</option>';
        component1 += '<c:forEach items="${РЕЗКА}" var="workbench">';
        component1 += '<option  id = "elem'+countWorkBench+'" value="${workbench.id}">${workbench.name}</option>';
        component1 += '</c:forEach>';
        component1 += '</select>';
        component1 += '<br>';
        component1 += '</div>';
        countWorkBench++;

        var component2 = '';
        component2 += '<div id="forDeleteTimeWork' + countTimeWork + '">';
        component2 += '<input id="inp' + countTimeWork +'" type="text" class="form-control"  name="timeWork" placeholder="Введите время детали" disabled>';
        countInp++;
        component2 += '</div>';
        countTimeWork++;
        component2 += '<div style="margin-bottom: 10px;" id="forDeleteTimeWork' + countTimeWork + '">';
        component2 += '<input id="inp' + countTimeWork +'" type="text" class="form-control"  name="timeWork" placeholder="Введите время детали" disabled>';
        countInp++;
        component2 += '<br>';
        component2 += '</div>';

        countTimeWork++;

        $('#columnWorkBench').append(component1);
        $('#columnTimeWork').append(component2);

    }

    function probivka() {
        var component1 = '';
        component1 += '<div style="margin-bottom: 10px;" id="forDeleteWorkBench' + countWorkBench + '">';
        component1 += '<select  onchange="OnSelectionChange (this)" class="form-control" name="workBenchId">';
        component1 += '<option   id = "selectedElement' + countWorkBench + '" selected value="Выберите станок">Выберите станок</option>';
        component1 += '<c:forEach items="${ПРОБИВКА}" var="workbench">';
        component1 += '<option  id = "elem'+countWorkBench+'" value="${workbench.id}">${workbench.name}</option>';
        component1 += '</c:forEach>';
        component1 += '</select>';
        component1 += '<br>';
        component1 += '</div>';

        var component2 = '';
        component2 += '<div style="margin-bottom: 10px;" id="forDeleteTimeWork' + countTimeWork + '">';
        component2 += '<input id="inp' + countTimeWork +'" type="text" class="form-control"  name="timeWork" placeholder="Введите время детали" disabled>';
        countInp++;
        component2 += '<br>';
        component2 += '</div>';

        $('#columnWorkBench').append(component1);
        $('#columnTimeWork').append(component2);
        countWorkBench++;
        countTimeWork++;
    }

    function prokatka() {
        var component1 = '';
        component1 += '<div style="margin-bottom: 10px;" id="forDeleteWorkBench' + countWorkBench + '">';
        component1 += '<select  onchange="OnSelectionChange (this)" class="form-control" name="workBenchId">';
        component1 += '<option   id = "selectedElement' + countWorkBench + '" selected value="Выберите станок">Выберите станок</option>';
        component1 += '<c:forEach items="${ПРОКАТКА}" var="workbench">';
        component1 += '<option  id = "elem'+countWorkBench+'" value="${workbench.id}">${workbench.name}</option>';
        component1 += '</c:forEach>';
        component1 += '</select>';
        component1 += '<br>';
        component1 += '</div>';
        var component2 = '';
        component2 += '<div style="margin-bottom: 10px;" id="forDeleteTimeWork' + countTimeWork + '">';
        component2 += '<input id="inp' + countTimeWork +'" type="text" class="form-control"  name="timeWork" placeholder="Введите время детали" disabled>';
        countInp++;
        component2 += '<br>';
        component2 += '</div>';

        $('#columnWorkBench').append(component1);
        $('#columnTimeWork').append(component2);
        countWorkBench++;
        countTimeWork++;
    }

    function frezirovka() {
        var component1 = '';
        component1 += '<div style="margin-bottom: 10px;" id="forDeleteWorkBench' + countWorkBench + '">';
        component1 += '<select  onchange="OnSelectionChange (this)" class="form-control" name="workBenchId">';
        component1 += '<option   id = "selectedElement' + countWorkBench + '" selected value="Выберите станок">Выберите станок</option>';
        component1 += '<c:forEach items="${ФРЕЗЕРОВКА}" var="workbench">';
        component1 += '<option  id = "elem'+countWorkBench+'" value="${workbench.id}">${workbench.name}</option>';
        component1 += '</c:forEach>';
        component1 += '</select>';
        component1 += '<br>';
        component1 += '</div>';

        var component2 = '';
        component2 += '<div style="margin-bottom: 10px;" id="forDeleteTimeWork' + countTimeWork + '">';
        component2 += '<input id="inp' + countTimeWork +'" type="text" class="form-control"  name="timeWork" placeholder="Введите время детали" disabled>';
        countInp++;
        component2 += '<br>';
        component2 += '</div>';

        $('#columnWorkBench').append(component1);
        $('#columnTimeWork').append(component2);
        countWorkBench++;
        countTimeWork++;
    }

    function gibka() {
        var component1 = '';
        component1 += '<div id="forDeleteWorkBench' + countWorkBench + '">';
        component1 += '<select  onchange="OnSelectionChange (this)" class="form-control" name="workBenchId">';
        component1 += '<option   id = "selectedElement' + countWorkBench + '" selected value="Выберите станок">Выберите станок</option>';
        component1 += '<c:forEach items="${ГИБКА}" var="workbench">';
        component1 += '<option  id = "elem'+countWorkBench+'" value="${workbench.id}">${workbench.name}</option>';
        component1 += '</c:forEach>';
        component1 += '</select>';
        component1 += '</div>';
        countWorkBench++;
        component1 += '<div id="forDeleteWorkBench' + countWorkBench + '">';
        component1 += '<select  onchange="OnSelectionChange (this)" class="form-control" name="workBenchId">';
        component1 += '<option   id = "selectedElement' + countWorkBench + '" selected value="Выберите станок">Выберите станок</option>';
        component1 += '<c:forEach items="${ГИБКА}" var="workbench">';
        component1 += '<option  id = "elem'+countWorkBench+'" value="${workbench.id}">${workbench.name}</option>';
        component1 += '</c:forEach>';
        component1 += '</select>';
        component1 += '</div>';
        countWorkBench++;
        component1 += '<div style="margin-bottom: 10px;" id="forDeleteWorkBench' + countWorkBench + '">';
        component1 += '<select  onchange="OnSelectionChange (this)" class="form-control" name="workBenchId">';
        component1 += '<option   id = "selectedElement' + countWorkBench + '" selected value="Выберите станок">Выберите станок</option>';
        component1 += '<c:forEach items="${ГИБКА}" var="workbench">';
        component1 += '<option  id = "elem'+countWorkBench+'" value="${workbench.id}">${workbench.name}</option>';
        component1 += '</c:forEach>';
        component1 += '</select>';
        component1 += '<br>';
        component1 += '</div>';
        countWorkBench++;

        var component2 = '';
        component2 += '<div id="forDeleteTimeWork' + countTimeWork + '">';
        component2 += '<input id="inp' + countTimeWork +'" type="text" class="form-control"  name="timeWork" placeholder="Введите время детали" disabled>';
        countInp++;
        component2 += '</div>';
        countTimeWork++;
        component2 += '<div id="forDeleteTimeWork' + countTimeWork + '">';
        component2 += '<input id="inp' + countTimeWork +'" type="text" class="form-control"  name="timeWork" placeholder="Введите время детали" disabled>';
        countInp++;
        component2 += '</div>';
        countTimeWork++;
        component2 += '<div style="margin-bottom: 10px;" id="forDeleteTimeWork' + countTimeWork + '">';
        component2 += '<input id="inp' + countTimeWork +'" type="text" class="form-control"  name="timeWork" placeholder="Введите время детали" disabled>';
        countInp++;
        component2 += '<br>';
        component2 += '</div>';
        countTimeWork++;
        $('#columnWorkBench').append(component1);
        $('#columnTimeWork').append(component2);
    }

    function OnSelectionChange (select) {
        var selectedOption = select.options[select.selectedIndex];
        var inp;
        var replAttr =selectedOption.id.replace('elem','inp');
        if (replAttr.includes('selectedElement')){
            var repl = replAttr.replace('selectedElement','inp')
            inp = document.getElementById(repl);
            inp.setAttribute('disabled',true);
        }else{
            inp = document.getElementById(replAttr);
            inp.removeAttribute('disabled');
        }
    }

</script>
</html>