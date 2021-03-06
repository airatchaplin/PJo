<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Станки</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_hover.css">
    <link rel="stylesheet" href="../../resources/css/table_workbenches.css">
</head>
<body>

<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<jsp:include page="../nav/workbench_nav_main.jsp"></jsp:include>

<div class="main">
    <table class="simple-little-table" cellspacing='0'>
        <thead>
        <form method="post">
            <tr>
                <th class="number" style="text-align: center">№</th>
                <th>Станок
                    <button class="button-filter" name="filter" value="workBenches"
                            style="border: none;" type="submit">
                        ${user.filter_workbenches.equals("workBenches")?"&#11167;":"&#11165;"}
                    </button>
                </th>
                <th class="th_workbench_typeOperation">Операция
                    <button class="button-filter" name="filter" value="typeOperation"
                            style="border: none;" type="submit">
                        ${user.filter_workbenches.equals("typeOperation")?"&#11167;":"&#11165;"}
                    </button>
                </th>
                <th class="th_workbench_currentThickness">Толщина</th>
                <th class="th_workbench_currentThickness">Наладка</th>
                <th class="th_workbench_dateEnd">Время окончния
                    <button class="button-filter" name="filter" value="dateEnd"
                            style="border: none;" type="submit">
                        ${user.filter_workbenches.equals("dateEnd")?"&#11167;":"&#11165;"}
                    </button>
                </th>
            </tr>
        </form>
        </thead>
        <tbody>
        <c:forEach items="${workbenches}" var="workbench">
            <tr>
                <td class="number" style="text-align: center">${count + 1}</td>
                <td><a class="table-href" href="workbenches/${workbench.id}">${workbench.name}</a></td>
                <td class="th_workbench_typeOperation"><a class="table-href"
                                                          href="workbenches/${workbench.id}">${workbench.typeOperation}</a>
                </td>
                <td class="th_workbench_currentThickness"><a class="table-href"
                                                             href="workbenches/${workbench.id}">${workbench.currentThickness}</a>
                </td>
                <td class="th_workbench_currentThickness"><a class="table-href"
                                                             href="workbenches/${workbench.id}">${workbench.timeWorkAdjustment}</a>
                </td>
                <td class="th_workbench_dateEnd"><a class="table-href"
                                                    href="workbenches/${workbench.id}">${workbench.dateEndDetail}</a>
                </td>
            </tr>
            <c:set var="count" value="${count + 1}" scope="page"/>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>