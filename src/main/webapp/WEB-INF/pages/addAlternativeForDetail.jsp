<%@ page import="java.util.stream.Collectors" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Добавление варианта</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

</head>
<body id="bod">
<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<jsp:include page="../nav/details_nav_second.jsp"></jsp:include>
<form method="post">
    <jsp:include page="../nav/nav_third_save.jsp"></jsp:include>

    <div class="main">
        <table class="simple-little-table" cellspacing='0'>
            <thead>
            <tr>
                <th>Деталь</th>
                <th>Материал</th>
                <th>Операции</th>
                <th>Вариант</th>
                <th>Станки</th>
                <th>Время</th>
                <th>Примечание</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td class="detail_name">${detail.name}</td>
                <td class="detail_material">${detail.materialName} ${detail.materialThickness}мм</td>
                <td>
                    ${typeOperationsName}
                </td>
                <td>Основной</td>
                <td>
                    <c:set var="countGibka" value="0" scope="page"/>
                    <c:set var="countRezka" value="0" scope="page"/>
                    <c:forEach items="${detail.detailListDtos.get(0).detailInfoDtos}" var="detailInfo">
                        <c:if test="${detailInfo.workBenchDto.typeOperation.equals('ГИБКА')}">
                            <c:if test="${countGibka>0}">
                                <pre style="color: red">Альтернатива: ${detailInfo.workBenchDto.name}</pre>
                            </c:if>
                            <c:if test="${countGibka==0}">
                                <pre>${detailInfo.workBenchDto.name}</pre>
                                <c:set var="countGibka" value="${countGibka + 1}" scope="page"/>
                            </c:if>
                        </c:if>
                        <c:if test="${detailInfo.workBenchDto.typeOperation.equals('РЕЗКА')}">
                            <c:if test="${countRezka>0}">
                                <pre style="color: red">Альтернатива: ${detailInfo.workBenchDto.name}</pre>
                            </c:if>
                            <c:if test="${countRezka==0}">
                                <pre>${detailInfo.workBenchDto.name}</pre>
                                <c:set var="countRezka" value="${countRezka + 1}" scope="page"/>
                            </c:if>
                        </c:if>
                        <c:if test="${!detailInfo.workBenchDto.typeOperation.equals('ГИБКА') && !detailInfo.workBenchDto.typeOperation.equals('РЕЗКА')  }">
                            <pre>${detailInfo.workBenchDto.name}</pre>
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach items="${detail.detailListDtos.get(0).detailInfoDtos}" var="detailInfo">
                        <pre>${detailInfo.timeWork}</pre>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach items="${detail.detailListDtos.get(0).detailInfoDtos}" var="detailInfo">
                        <pre>${detailInfo.comment}</pre>
                    </c:forEach>
                </td>
                <%--                <td id="columnWorkBench"></td>--%>
                <%--                <td id="columnTimeWork"></td>--%>
                <%--                <td id="columnComment"></td>--%>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td id="columnOperation1">
                    <select onchange="test2(this)" class="form-control">
                        <option selected value="Выберите операции">Выбирите операции</option>
                        <c:forEach items="${operations}" var="operation">
                            <option value="${operation.description}">${operation.description}</option>
                        </c:forEach>
                    </select>
                </td>
                <td>Запасной</td>
                <td id="columnWorkBench1"></td>
                <td id="columnTimeWork1"></td>
                <td id="columnComment1"></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>Упаковка</td>
                <td>
                    <div id="forDeleteTimeWork1' + countTimeWork1 + '">
                        <input id="inp2' + countTimeWork1 + '" type="text" class="form-control" value="00:02:40"
                               name="timePacking" placeholder="Введите время детали">
                    </div>
                </td>
                <td></td>
            </tr>
            </tbody>
        </table>
        <div class="error-text">
            ${detailError}
        </div>
    </div>
</form>
</body>
<script>
    var countWorkBench = 0;
    var countTimeWork = 0;
    var countComment = 0;

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
        for (let i = countComment; i >= 0; i--) {
            $("#forDeleteComment" + i).remove();
        }
        countTimeWork = 0;
        countWorkBench = 0;
        countComment = 0;
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
        // packing();
    }


    function rezka() {
        var component1 = '';
        component1 += '<div style="margin-bottom: 10px;" id="forDeleteWorkBench' + countWorkBench + '">';
        component1 += '<select  onchange="OnSelectionChange (this)" class="form-control" name="workBenchId">';
        component1 += '<option   id = "selectedElement' + countWorkBench + '" selected value="Выберите станок">Выберите станок</option>';
        component1 += '<c:forEach items="${РЕЗКА}" var="workbench">';
        component1 += '<option  id = "elem' + countWorkBench + '" value="${workbench.id}">${workbench.name}</option>';
        component1 += '</c:forEach>';
        component1 += '</select>';
        component1 += '<br>';
        component1 += '</div>';
        countWorkBench++;

        var component2 = '';
        component2 += '<div style="margin-bottom: 10px;" id="forDeleteTimeWork' + countTimeWork + '">';
        component2 += '<input id="inp' + countTimeWork + '" type="text" class="form-control" value="00:00:00" name="timeWork" placeholder="Введите время детали" disabled>';
        countInp++;
        component2 += '<br>';
        component2 += '</div>';
        countTimeWork++;

        var component3 = '';
        component3 += '<div style="margin-bottom: 10px;" id="forDeleteComment' + countComment + '">';
        component3 += '<div id="countComment' + countComment + '">';
        component3 += '<input id="inp1' + countComment + '" type="text" class="form-control" value="" name="comment" placeholder="Примечание" disabled>';
        component3 += '<br>';
        component3 += '</div>';
        countComment++;

        $('#columnWorkBench').append(component1);
        $('#columnTimeWork').append(component2);
        $('#columnComment').append(component3);

    }

    function probivka() {
        var component1 = '';
        component1 += '<div style="margin-bottom: 10px;" id="forDeleteWorkBench' + countWorkBench + '">';
        component1 += '<select  onchange="OnSelectionChange (this)" class="form-control" name="workBenchId">';
        component1 += '<option   id = "selectedElement' + countWorkBench + '" selected value="Выберите станок">Выберите станок</option>';
        component1 += '<c:forEach items="${ПРОБИВКА}" var="workbench">';
        component1 += '<option  id = "elem' + countWorkBench + '" value="${workbench.id}">${workbench.name}</option>';
        component1 += '</c:forEach>';
        component1 += '</select>';
        component1 += '<br>';
        component1 += '</div>';

        var component2 = '';
        component2 += '<div style="margin-bottom: 10px;" id="forDeleteTimeWork' + countTimeWork + '">';
        component2 += '<input id="inp' + countTimeWork + '" type="text" class="form-control" value="00:00:00" name="timeWork" placeholder="Введите время детали" disabled>';
        countInp++;
        component2 += '<br>';
        component2 += '</div>';

        var component3 = '';
        component3 += '<div style="margin-bottom: 10px;" id="forDeleteComment' + countComment + '">';
        component3 += '<div id="countComment' + countComment + '">';
        component3 += '<input id="inp1' + countComment + '" type="text" class="form-control" value="" name="comment" placeholder="Примечание" disabled>';
        component3 += '<br>';
        component3 += '</div>';

        $('#columnWorkBench').append(component1);
        $('#columnTimeWork').append(component2);
        $('#columnComment').append(component3);
        countWorkBench++;
        countTimeWork++;
        countComment++
    }

    function prokatka() {
        var component1 = '';
        component1 += '<div style="margin-bottom: 10px;" id="forDeleteWorkBench' + countWorkBench + '">';
        component1 += '<select  onchange="OnSelectionChange (this)" class="form-control" name="workBenchId">';
        component1 += '<option   id = "selectedElement' + countWorkBench + '" selected value="Выберите станок">Выберите станок</option>';
        component1 += '<c:forEach items="${ПРОКАТКА}" var="workbench">';
        component1 += '<option  id = "elem' + countWorkBench + '" value="${workbench.id}">${workbench.name}</option>';
        component1 += '</c:forEach>';
        component1 += '</select>';
        component1 += '<br>';
        component1 += '</div>';
        var component2 = '';
        component2 += '<div style="margin-bottom: 10px;" id="forDeleteTimeWork' + countTimeWork + '">';
        component2 += '<input id="inp' + countTimeWork + '" type="text" class="form-control" value="00:00:00" name="timeWork" placeholder="Введите время детали" disabled>';
        component2 += '<br>';
        component2 += '</div>';
        var component3 = '';
        component3 += '<div style="margin-bottom: 10px;" id="forDeleteComment' + countComment + '">';
        component3 += '<div id="countComment' + countComment + '">';
        component3 += '<input id="inp1' + countComment + '" type="text" class="form-control" value="" name="comment" placeholder="Примечание" disabled>';
        component3 += '<br>';
        component3 += '</div>';
        countInp++;

        $('#columnWorkBench').append(component1);
        $('#columnTimeWork').append(component2);
        $('#columnComment').append(component3);
        countWorkBench++;
        countTimeWork++;
        countComment++;
    }

    function frezirovka() {
        var component1 = '';
        component1 += '<div style="margin-bottom: 10px;" id="forDeleteWorkBench' + countWorkBench + '">';
        component1 += '<select  onchange="OnSelectionChange (this)" class="form-control" name="workBenchId">';
        component1 += '<option   id = "selectedElement' + countWorkBench + '" selected value="Выберите станок">Выберите станок</option>';
        component1 += '<c:forEach items="${ФРЕЗЕРОВКА}" var="workbench">';
        component1 += '<option  id = "elem' + countWorkBench + '" value="${workbench.id}">${workbench.name}</option>';
        component1 += '</c:forEach>';
        component1 += '</select>';
        component1 += '<br>';
        component1 += '</div>';

        var component2 = '';
        component2 += '<div style="margin-bottom: 10px;" id="forDeleteTimeWork' + countTimeWork + '">';
        component2 += '<input id="inp' + countTimeWork + '" type="text" class="form-control" value="00:00:00"  name="timeWork" placeholder="Введите время детали" disabled>';
        component2 += '<br>';
        component2 += '</div>';

        var component3 = '';
        component3 += '<div style="margin-bottom: 10px;" id="forDeleteComment' + countComment + '">';
        component3 += '<div id="countComment' + countComment + '">';
        component3 += '<input id="inp1' + countComment + '" type="text" class="form-control" value=""  name="comment" placeholder="Примечание" disabled>';
        component3 += '<br>';
        component3 += '</div>';
        countInp++;

        $('#columnWorkBench').append(component1);
        $('#columnTimeWork').append(component2);
        $('#columnComment').append(component3);
        countWorkBench++;
        countTimeWork++;
        countComment++;
    }

    function gibka() {
        var component1 = '';
        component1 += '<div id="forDeleteWorkBench' + countWorkBench + '">';
        component1 += '<select  onchange="OnSelectionChange (this)" class="form-control" name="workBenchId">';
        component1 += '<option   id = "selectedElement' + countWorkBench + '" selected value="Выберите станок">Выберите станок</option>';
        component1 += '<c:forEach items="${ГИБКА}" var="workbench">';
        component1 += '<option  id = "elem' + countWorkBench + '" value="${workbench.id}">${workbench.name}</option>';
        component1 += '</c:forEach>';
        component1 += '</select>';
        component1 += '</div>';
        countWorkBench++;
        component1 += '<div id="forDeleteWorkBench' + countWorkBench + '">';
        component1 += '<select  onchange="OnSelectionChange (this)" class="form-control" name="workBenchId">';
        component1 += '<option   id = "selectedElement' + countWorkBench + '" selected value="Выберите станок">Выберите станок</option>';
        component1 += '<c:forEach items="${ГИБКА}" var="workbench">';
        component1 += '<option  id = "elem' + countWorkBench + '" value="${workbench.id}">${workbench.name}</option>';
        component1 += '</c:forEach>';
        component1 += '</select>';
        component1 += '</div>';
        countWorkBench++;
        component1 += '<div style="margin-bottom: 10px;" id="forDeleteWorkBench' + countWorkBench + '">';
        component1 += '<select  onchange="OnSelectionChange (this)" class="form-control" name="workBenchId">';
        component1 += '<option   id = "selectedElement' + countWorkBench + '" selected value="Выберите станок">Выберите станок</option>';
        component1 += '<c:forEach items="${ГИБКА}" var="workbench">';
        component1 += '<option  id = "elem' + countWorkBench + '" value="${workbench.id}">${workbench.name}</option>';
        component1 += '</c:forEach>';
        component1 += '</select>';
        component1 += '<br>';
        component1 += '</div>';
        countWorkBench++;

        var component2 = '';
        component2 += '<div id="forDeleteTimeWork' + countTimeWork + '">';
        component2 += '<input id="inp' + countTimeWork + '" type="text" class="form-control"  name="timeWork" value="00:00:00" placeholder="Введите время детали" disabled>';
        countInp++;
        component2 += '</div>';
        countTimeWork++;
        component2 += '<div id="forDeleteTimeWork' + countTimeWork + '">';
        component2 += '<input id="inp' + countTimeWork + '" type="text" class="form-control"  name="timeWork" value="00:00:00" placeholder="Введите время детали" disabled>';
        countInp++;
        component2 += '</div>';
        countTimeWork++;
        component2 += '<div style="margin-bottom: 10px;" id="forDeleteTimeWork' + countTimeWork + '">';
        component2 += '<input id="inp' + countTimeWork + '" type="text" class="form-control"  name="timeWork" value="00:00:00" placeholder="Введите время детали" disabled>';
        countInp++;
        component2 += '<br>';
        component2 += '</div>';
        countTimeWork++;

        var component3 = '';
        component3 += '<div style="margin-bottom: 10px;" id="forDeleteComment' + countComment + '">';
        component3 += '<div id="countComment' + countComment + '">';
        component3 += '<input id="inp1' + countComment + '" type="text" class="form-control"  name="comment" value="" placeholder="Примечание" disabled>';
        component3 += '</div>';
        countComment++;
        component3 += '<div style="margin-bottom: 10px;" id="forDeleteComment' + countComment + '">';
        component3 += '<div id="countComment' + countComment + '">';
        component3 += '<input id="inp1' + countComment + '" type="text" class="form-control"  name="comment" value="" placeholder="Примечание" disabled>';
        component3 += '</div>';
        countComment++;
        component3 += '<div style="margin-bottom: 10px;" id="forDeleteComment' + countComment + '">';
        component3 += '<div id="countComment' + countComment + '">';
        component3 += '<input id="inp1' + countComment + '" type="text" class="form-control"  name="comment" value="" placeholder="Примечание" disabled>';
        component3 += '<br>';
        component3 += '</div>';
        countComment++;
        $('#columnWorkBench').append(component1);
        $('#columnTimeWork').append(component2);
        $('#columnComment').append(component3);
    }

    // function packing() {
    //     var component1 = '';
    //     component1 += '<div style="margin-bottom: 10px;" id="forDeleteWorkBench' + countWorkBench + '">';
    //     component1 += '<select  onchange="OnSelectionChange (this)" class="form-control">';
    //     component1 += '<option  id = "elem' + countWorkBench + '" value="Упаковка">Упаковка</option>';
    //     component1 += '</select>';
    //     component1 += '<br>';
    //     component1 += '</div>';
    //
    //     var component2 = '';
    //     component2 += '<div style="margin-bottom: 10px;" id="forDeleteTimeWork' + countTimeWork + '">';
    //     component2 += '<input id="inp' + countTimeWork + '" type="text" class="form-control" value="00:02:40" name="timePacking" placeholder="Введите время детали">';
    //     countInp++;
    //     component2 += '<br>';
    //     component2 += '</div>';
    //
    //     var component3 = '';
    //     component3 += '<div style="margin-bottom: 10px;" id="forDeleteComment' + countComment + '">';
    //     component3 += '<div id="countComment' + countComment + '">';
    //     component3 += '<input id="inp1' + countComment + '" type="text" class="form-control" value="" disabled>';
    //     component3 += '<br>';
    //     component3 += '</div>';
    //
    //     $('#columnWorkBench').append(component1);
    //     $('#columnTimeWork').append(component2);
    //     $('#columnComment').append(component3);
    //     countWorkBench++;
    //     countTimeWork++;
    //     countComment++
    // }

    function OnSelectionChange(select) {
        var selectedOption = select.options[select.selectedIndex];
        var inp;
        var inp1;
        var replAttr = selectedOption.id.replace('elem', 'inp');
        var replAttr1 = selectedOption.id.replace('elem', 'inp1');
        if (replAttr.includes('selectedElement')) {
            var repl = replAttr.replace('selectedElement', 'inp')
            var repl1 = replAttr.replace('selectedElement', 'inp1')
            inp = document.getElementById(repl);
            inp.setAttribute('disabled', true);
            inp1 = document.getElementById(repl1);
            inp1.setAttribute('disabled', true);
        } else {
            inp = document.getElementById(replAttr);
            inp.removeAttribute('disabled');
            inp1 = document.getElementById(replAttr1);
            inp1.removeAttribute('disabled');
        }
    }

    //-----------
    var countWorkBench1 = 0;
    var countTimeWork1 = 0;
    var countComment1 = 0;

    function test2(select) {
        var selectedOption = select.options[select.selectedIndex];
        var string = selectedOption.value;
        var arr = string.split(' -> ');
        for (let i = countWorkBench1; i >= 0; i--) {
            $("#forDeleteWorkBench1" + i).remove();
        }
        for (let i = countTimeWork1; i >= 0; i--) {
            $("#forDeleteTimeWork1" + i).remove();
        }
        for (let i = countComment1; i >= 0; i--) {
            $("#forDeleteComment1" + i).remove();
        }
        countTimeWork1 = 0;
        countWorkBench1 = 0;
        countComment1 = 0;
        countInp1 = 0;
        countOpt1 = 0;

        for (let i = 0; i < arr.length; i++) {
            if (arr[i] === "РЕЗКА") {
                rezka1();
            }
            if (arr[i] === "ПРОБИВКА") {
                probivka1();
            }
            if (arr[i] === "ПРОКАТКА") {
                prokatka1();
            }
            if (arr[i] === "ГИБКА") {
                gibka1();
            }
            if (arr[i] === "ФРЕЗЕРОВКА") {
                frezirovka1();
            }
        }
        // packing1();
    }


    function rezka1() {
        var component1 = '';
        component1 += '<div style="margin-bottom: 10px;" id="forDeleteWorkBench1' + countWorkBench1 + '">';
        component1 += '<select  onchange="OnSelectionChange1 (this)" class="form-control" name="workBenchId1">';
        component1 += '<option   id = "selectedElement1' + countWorkBench1 + '" selected value="Выберите станок">Выберите станок</option>';
        component1 += '<c:forEach items="${РЕЗКА}" var="workbench">';
        component1 += '<option  id = "elem1' + countWorkBench1 + '" value="${workbench.id}">${workbench.name}</option>';
        component1 += '</c:forEach>';
        component1 += '</select>';
        component1 += '<br>';
        component1 += '</div>';
        countWorkBench1++;

        var component2 = '';
        component2 += '<div style="margin-bottom: 10px;" id="forDeleteTimeWork1' + countTimeWork1 + '">';
        component2 += '<input id="inp2' + countTimeWork1 + '" type="text" class="form-control" value="00:00:00" name="timeWork1" placeholder="Введите время детали" disabled>';
        countInp1++;
        component2 += '<br>';
        component2 += '</div>';
        countTimeWork1++;

        var component3 = '';
        component3 += '<div style="margin-bottom: 10px;" id="forDeleteComment1' + countComment1 + '">';
        component3 += '<div id="countComment1' + countComment1 + '">';
        component3 += '<input id="inp3' + countComment1 + '" type="text" class="form-control" value="" name="comment1" placeholder="Примечание" disabled>';
        component3 += '<br>';
        component3 += '</div>';
        countComment1++;

        $('#columnWorkBench1').append(component1);
        $('#columnTimeWork1').append(component2);
        $('#columnComment1').append(component3);

    }

    function probivka1() {
        var component1 = '';
        component1 += '<div style="margin-bottom: 10px;" id="forDeleteWorkBench1' + countWorkBench1 + '">';
        component1 += '<select  onchange="OnSelectionChange1 (this)" class="form-control" name="workBenchId1">';
        component1 += '<option   id = "selectedElement1' + countWorkBench1 + '" selected value="Выберите станок">Выберите станок</option>';
        component1 += '<c:forEach items="${ПРОБИВКА}" var="workbench">';
        component1 += '<option  id = "elem1' + countWorkBench1 + '" value="${workbench.id}">${workbench.name}</option>';
        component1 += '</c:forEach>';
        component1 += '</select>';
        component1 += '<br>';
        component1 += '</div>';

        var component2 = '';
        component2 += '<div style="margin-bottom: 10px;" id="forDeleteTimeWork1' + countTimeWork1 + '">';
        component2 += '<input id="inp2' + countTimeWork1 + '" type="text" class="form-control" value="00:00:00" name="timeWork1" placeholder="Введите время детали" disabled>';
        countInp1++;
        component2 += '<br>';
        component2 += '</div>';

        var component3 = '';
        component3 += '<div style="margin-bottom: 10px;" id="forDeleteComment1' + countComment1 + '">';
        component3 += '<div id="countComment1' + countComment1 + '">';
        component3 += '<input id="inp3' + countComment1 + '" type="text" class="form-control" value="" name="comment1" placeholder="Примечание" disabled>';
        component3 += '<br>';
        component3 += '</div>';

        $('#columnWorkBench1').append(component1);
        $('#columnTimeWork1').append(component2);
        $('#columnComment1').append(component3);
        countWorkBench1++;
        countTimeWork1++;
        countComment1++
    }

    function prokatka1() {
        var component1 = '';
        component1 += '<div style="margin-bottom: 10px;" id="forDeleteWorkBench1' + countWorkBench1 + '">';
        component1 += '<select  onchange="OnSelectionChange1 (this)" class="form-control" name="workBenchId1">';
        component1 += '<option   id = "selectedElement1' + countWorkBench1 + '" selected value="Выберите станок">Выберите станок</option>';
        component1 += '<c:forEach items="${ПРОКАТКА}" var="workbench">';
        component1 += '<option  id = "elem1' + countWorkBench1 + '" value="${workbench.id}">${workbench.name}</option>';
        component1 += '</c:forEach>';
        component1 += '</select>';
        component1 += '<br>';
        component1 += '</div>';
        var component2 = '';
        component2 += '<div style="margin-bottom: 10px;" id="forDeleteTimeWork1' + countTimeWork1 + '">';
        component2 += '<input id="inp2' + countTimeWork1 + '" type="text" class="form-control" value="00:00:00" name="timeWork1" placeholder="Введите время детали" disabled>';
        component2 += '<br>';
        component2 += '</div>';
        var component3 = '';
        component3 += '<div style="margin-bottom: 10px;" id="forDeleteComment1' + countComment1 + '">';
        component3 += '<div id="countComment1' + countComment1 + '">';
        component3 += '<input id="inp3' + countComment1 + '" type="text" class="form-control" value="" name="comment1" placeholder="Примечание" disabled>';
        component3 += '<br>';
        component3 += '</div>';
        countInp1++;

        $('#columnWorkBench1').append(component1);
        $('#columnTimeWork1').append(component2);
        $('#columnComment1').append(component3);
        countWorkBench1++;
        countTimeWork1++;
        countComment1++;
    }

    function frezirovka1() {
        var component1 = '';
        component1 += '<div style="margin-bottom: 10px;" id="forDeleteWorkBench1' + countWorkBench1 + '">';
        component1 += '<select  onchange="OnSelectionChange1 (this)" class="form-control" name="workBenchId1">';
        component1 += '<option   id = "selectedElement1' + countWorkBench1 + '" selected value="Выберите станок">Выберите станок</option>';
        component1 += '<c:forEach items="${ФРЕЗЕРОВКА}" var="workbench">';
        component1 += '<option  id = "elem1' + countWorkBench1 + '" value="${workbench.id}">${workbench.name}</option>';
        component1 += '</c:forEach>';
        component1 += '</select>';
        component1 += '<br>';
        component1 += '</div>';

        var component2 = '';
        component2 += '<div style="margin-bottom: 10px;" id="forDeleteTimeWork1' + countTimeWork1 + '">';
        component2 += '<input id="inp2' + countTimeWork1 + '" type="text" class="form-control" value="00:00:00"  name="timeWork1" placeholder="Введите время детали" disabled>';
        component2 += '<br>';
        component2 += '</div>';

        var component3 = '';
        component3 += '<div style="margin-bottom: 10px;" id="forDeleteComment1' + countComment1 + '">';
        component3 += '<div id="countComment' + countComment1 + '">';
        component3 += '<input id="inp3' + countComment + '" type="text" class="form-control" value=""  name="comment1" placeholder="Примечание" disabled>';
        component3 += '<br>';
        component3 += '</div>';
        countInp1++;

        $('#columnWorkBench1').append(component1);
        $('#columnTimeWork1').append(component2);
        $('#columnComment1').append(component3);
        countWorkBench1++;
        countTimeWork1++;
        countComment1++;
    }

    function gibka1() {
        var component1 = '';
        component1 += '<div id="forDeleteWorkBench1' + countWorkBench1 + '">';
        component1 += '<select  onchange="OnSelectionChange1 (this)" class="form-control" name="workBenchId1">';
        component1 += '<option   id = "selectedElement1' + countWorkBench1 + '" selected value="Выберите станок">Выберите станок</option>';
        component1 += '<c:forEach items="${ГИБКА}" var="workbench">';
        component1 += '<option  id = "elem1' + countWorkBench1 + '" value="${workbench.id}">${workbench.name}</option>';
        component1 += '</c:forEach>';
        component1 += '</select>';
        component1 += '</div>';
        countWorkBench1++;
        component1 += '<div id="forDeleteWorkBench1' + countWorkBench1 + '">';
        component1 += '<select  onchange="OnSelectionChange1 (this)" class="form-control" name="workBenchId1">';
        component1 += '<option   id = "selectedElement1' + countWorkBench1 + '" selected value="Выберите станок">Выберите станок</option>';
        component1 += '<c:forEach items="${ГИБКА}" var="workbench">';
        component1 += '<option  id = "elem1' + countWorkBench1 + '" value="${workbench.id}">${workbench.name}</option>';
        component1 += '</c:forEach>';
        component1 += '</select>';
        component1 += '</div>';
        countWorkBench1++;
        component1 += '<div style="margin-bottom: 10px;" id="forDeleteWorkBench1' + countWorkBench1 + '">';
        component1 += '<select  onchange="OnSelectionChange1 (this)" class="form-control" name="workBenchId1">';
        component1 += '<option   id = "selectedElement1' + countWorkBench1 + '" selected value="Выберите станок">Выберите станок</option>';
        component1 += '<c:forEach items="${ГИБКА}" var="workbench">';
        component1 += '<option  id = "elem1' + countWorkBench1 + '" value="${workbench.id}">${workbench.name}</option>';
        component1 += '</c:forEach>';
        component1 += '</select>';
        component1 += '<br>';
        component1 += '</div>';
        countWorkBench1++;

        var component2 = '';
        component2 += '<div id="forDeleteTimeWork1' + countTimeWork1 + '">';
        component2 += '<input id="inp2' + countTimeWork1 + '" type="text" class="form-control"  name="timeWork1" value="00:00:00" placeholder="Введите время детали" disabled>';
        countInp1++;
        component2 += '</div>';
        countTimeWork1++;
        component2 += '<div id="forDeleteTimeWork1' + countTimeWork1 + '">';
        component2 += '<input id="inp2' + countTimeWork1 + '" type="text" class="form-control"  name="timeWork1" value="00:00:00" placeholder="Введите время детали" disabled>';
        countInp1++;
        component2 += '</div>';
        countTimeWork1++;
        component2 += '<div style="margin-bottom: 10px;" id="forDeleteTimeWork1' + countTimeWork1 + '">';
        component2 += '<input id="inp2' + countTimeWork1 + '" type="text" class="form-control"  name="timeWork1" value="00:00:00" placeholder="Введите время детали" disabled>';
        countInp1++;
        component2 += '<br>';
        component2 += '</div>';
        countTimeWork1++;

        var component3 = '';
        component3 += '<div style="margin-bottom: 10px;" id="forDeleteComment1' + countComment1 + '">';
        component3 += '<div id="countComment1' + countComment1 + '">';
        component3 += '<input id="inp3' + countComment1 + '" type="text" class="form-control"  name="comment1" value="" placeholder="Примечание" disabled>';
        component3 += '</div>';
        countComment1++;
        component3 += '<div style="margin-bottom: 10px;" id="forDeleteComment1' + countComment1 + '">';
        component3 += '<div id="countComment1' + countComment1 + '">';
        component3 += '<input id="inp3' + countComment1 + '" type="text" class="form-control"  name="comment1" value="" placeholder="Примечание" disabled>';
        component3 += '</div>';
        countComment1++;
        component3 += '<div style="margin-bottom: 10px;" id="forDeleteComment1' + countComment1 + '">';
        component3 += '<div id="countComment1' + countComment1 + '">';
        component3 += '<input id="inp3' + countComment1 + '" type="text" class="form-control"  name="comment1" value="" placeholder="Примечание" disabled>';
        component3 += '<br>';
        component3 += '</div>';
        countComment1++;
        $('#columnWorkBench1').append(component1);
        $('#columnTimeWork1').append(component2);
        $('#columnComment1').append(component3);
    }

    // function packing1() {
    //     var component1 = '';
    //     component1 += '<div style="margin-bottom: 10px;" id="forDeleteWorkBench1' + countWorkBench1 + '">';
    //     component1 += '<select  onchange="OnSelectionChange1 (this)" class="form-control">';
    //     component1 += '<option  id = "elem1' + countWorkBench1 + '" value="Упаковка">Упаковка</option>';
    //     component1 += '</select>';
    //     component1 += '<br>';
    //     component1 += '</div>';
    //
    //     var component2 = '';
    //     component2 += '<div style="margin-bottom: 10px;" id="forDeleteTimeWork1' + countTimeWork1 + '">';
    //     component2 += '<input id="inp2' + countTimeWork1 + '" type="text" class="form-control" value="00:02:40" name="timePacking1" placeholder="Введите время детали">';
    //     countInp1++;
    //     component2 += '<br>';
    //     component2 += '</div>';
    //
    //     var component3 = '';
    //     component3 += '<div style="margin-bottom: 10px;" id="forDeleteComment1' + countComment1 + '">';
    //     component3 += '<div id="countComment1' + countComment1 + '">';
    //     component3 += '<input id="inp3' + countComment1 + '" type="text" class="form-control" value="" disabled>';
    //     component3 += '<br>';
    //     component3 += '</div>';
    //
    //     $('#columnWorkBench1').append(component1);
    //     $('#columnTimeWork1').append(component2);
    //     $('#columnComment1').append(component3);
    //     countWorkBench1++;
    //     countTimeWork1++;
    //     countComment1++
    // }

    function OnSelectionChange1(select) {
        var selectedOption = select.options[select.selectedIndex];
        var inp;
        var inp1;
        var replAttr = selectedOption.id.replace('elem1', 'inp2');
        var replAttr1 = selectedOption.id.replace('elem1', 'inp3');
        if (replAttr.includes('selectedElement')) {
            var repl = replAttr.replace('selectedElement1', 'inp2')
            var repl1 = replAttr.replace('selectedElement1', 'inp3')
            inp = document.getElementById(repl);
            inp.setAttribute('disabled', true);
            inp1 = document.getElementById(repl1);
            inp1.setAttribute('disabled', true);
        } else {
            inp = document.getElementById(replAttr);
            inp.removeAttribute('disabled');
            inp1 = document.getElementById(replAttr1);
            inp1.removeAttribute('disabled');
        }
    }
</script>
</html>