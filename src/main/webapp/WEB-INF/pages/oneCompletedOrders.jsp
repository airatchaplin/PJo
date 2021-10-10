<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Завершенный заказ</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../resources/css/table.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <link rel="stylesheet" href="../../resources/css/table_add.css">
</head>
<body>
<jsp:include page="../nav/nav_first.jsp"></jsp:include>
<jsp:include page="../nav/order_nav_main.jsp"></jsp:include>

<div class="main">
    <table class="simple-little-table" cellspacing='0'>
        <thead>
        <tr>
            <th class="number_orders" style="text-align: center">№</th>
            <th>Контрагент</th>
            <th>Экономист</th>
            <th>Менеджер</th>
            <th>Покраска</th>
            <th>Упаковка</th>
            <th>Дата запуска в производство</th>
            <th>Дата готовности заказа</th>
            <th>Коментарий</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td class="number_orders" style="text-align: center"> ${completed_order.numberOrder} </td>
            <td> ${completed_order.objectName} </td>
            <td>${completed_order.economist} </td>
            <td>${completed_order.manager} </td>
            <td>
                ${completed_order.painting}
            </td>
            <td>
                ${completed_order.packing}
            </td>
            <td>${completed_order.dateStartOrder}</td>
            <td>${completed_order.dateEndOrder}</td>
            <td>
                ${completed_order.comment}
            </td>
        </tr>
        </tbody>
    </table>

    <table style="margin-top: 8px" class="simple-little-table" cellspacing='0'>
        <thead>
        <tr>
            <th>Деталь</th>
            <th>Материал</th>
            <th>Кол-во</th>
            <th>Выбор</th>
            <th>Станки</th>
            <th>Время</th>
            <th>Время окончания станков</th>
            <th>Тек.Толщ.</th>
            <th>Время начала на станке</th>
            <th>Время окончания на станке</th>
            <th>Наладка</th>
            <c:if test="${completed_order.detailsOrders.size()>0}">
                <c:if test="${completed_order.detailsOrders.get(0).detailOrder.detailOrderLists.size()==1 && !completed_order.calculated}">
                    <th>Расчитать</th>
                </c:if>
            </c:if>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${completed_order.detailsOrders}" var="detailsOrders">
            <c:forEach items="${detailsOrders.detailOrder.detailOrderLists}" var="detailLists">
                <tr>
                    <c:if test="${detailsOrders.detailOrder.detailOrderLists.indexOf(detailLists)==0}">
                        <td>
                            <input type="text" name="detailId" value="${detailsOrders.id}" style="display: none">
                                ${detailsOrders.detailOrder.name}
                        </td>
                        <td style="width: 7%;">
                                ${detailsOrders.detailOrder.material.name} ${detailsOrders.detailOrder.material.thickness}
                            мм
                        </td>
                        <td>
                                ${detailsOrders.count} шт
                        </td>
                    </c:if>
                    <c:if test="${detailsOrders.detailOrder.detailOrderLists.indexOf(detailLists)==1}">
                        <td style="background: #fee8e8;"></td>
                        <td style="background: #fee8e8;width: 7%;"></td>
                        <td style="background: #fee8e8;"></td>
                    </c:if>
                    <c:if test="${detailsOrders.detailOrder.detailOrderLists.indexOf(detailLists)==0}">
                        <td style="text-align: center;">
                            <div>
                                    ${detailLists.mainOrAlternative == "1"?"Основной" :"Запасной"}
                                <c:if test="${!completed_order.calculated}">
                                    <c:if test="${detailLists.selected}">
                                        <input style="height: 20px;margin: 0;" type="checkbox"
                                               value="${detailLists.id}"
                                               name="isSelected" checked>
                                    </c:if>
                                </c:if>
                                <c:if test="${!completed_order.calculated}">
                                    <c:if test="${!detailLists.selected}">
                                        <input style="height: 20px;margin: 0;" type="checkbox"
                                               value="${detailLists.id}"
                                               name="isSelected">
                                    </c:if>
                                </c:if>
                            </div>
                        </td>
                    </c:if>
                    <c:if test="${detailsOrders.detailOrder.detailOrderLists.indexOf(detailLists)==1}">
                        <td style="background: #fee8e8;text-align: center;">
                            <div>
                                    ${detailLists.mainOrAlternative == "1"?"Основной" :"Запасной"}
                                <c:if test="${detailLists.selected}">
                                    <input style="height: 20px;margin: 0;" type="checkbox" value="${detailLists.id}"
                                           name="isSelected" checked>
                                </c:if>
                                <c:if test="${!detailLists.selected}">
                                    <input style="height: 20px;margin: 0;" type="checkbox" value="${detailLists.id}"
                                           name="isSelected">
                                </c:if>
                            </div>
                        </td>
                    </c:if>

                        <%--                <td>--%>
                        <%--                    <c:forEach items="${ord.detail.detailInfos}" var="workbench">--%>
                        <%--                        <pre>${workbench.workBenches.name}</pre>--%>
                        <%--                    </c:forEach>--%>
                        <%--                </td>--%>
                    <c:if test="${detailsOrders.detailOrder.detailOrderLists.indexOf(detailLists)==0}">
                        <td>
                            <c:set var="countGibka" value="0" scope="page"/>
                            <c:set var="countRezka" value="0" scope="page"/>
                            <c:forEach items="${detailLists.detailOrderInfos}" var="detailInfo">
                                <c:if test="${detailInfo.workBenches.typeOperation.equals('ГИБКА')}">
                                    <c:if test="${countGibka>0}">
                                        <pre style="color: red">Альтернатива: ${detailInfo.workBenches.name}</pre>
                                    </c:if>
                                    <c:if test="${countGibka==0}">
                                        <pre>${detailInfo.workBenches.name}</pre>
                                        <c:set var="countGibka" value="${countGibka + 1}" scope="page"/>
                                    </c:if>
                                </c:if>
                                <c:if test="${detailInfo.workBenches.typeOperation.equals('РЕЗКА')}">
                                    <c:if test="${countRezka>0}">
                                        <pre style="color: red">Альтернатива: ${detailInfo.workBenches.name}</pre>
                                    </c:if>
                                    <c:if test="${countRezka==0}">
                                        <pre>${detailInfo.workBenches.name}</pre>
                                        <c:set var="countRezka" value="${countRezka + 1}" scope="page"/>
                                    </c:if>
                                </c:if>
                                <c:if test="${!detailInfo.workBenches.typeOperation.equals('ГИБКА') && !detailInfo.workBenches.typeOperation.equals('РЕЗКА')  }">
                                    <pre>${detailInfo.workBenches.name}</pre>
                                </c:if>
                            </c:forEach>
                        </td>
                    </c:if>
                    <c:if test="${detailsOrders.detailOrder.detailOrderLists.indexOf(detailLists)==1}">
                        <td style="background: #fee8e8;">
                            <c:set var="countGibka" value="0" scope="page"/>
                            <c:set var="countRezka" value="0" scope="page"/>
                            <c:forEach items="${detailLists.detailOrderInfos}" var="detailInfo">
                                <c:if test="${detailInfo.workBenches.typeOperation.equals('ГИБКА')}">
                                    <c:if test="${countGibka>0}">
                                        <pre style="color: red">Альтернатива: ${detailInfo.workBenches.name}</pre>
                                    </c:if>
                                    <c:if test="${countGibka==0}">
                                        <pre>${detailInfo.workBenches.name}</pre>
                                        <c:set var="countGibka" value="${countGibka + 1}" scope="page"/>
                                    </c:if>
                                </c:if>
                                <c:if test="${detailInfo.workBenches.typeOperation.equals('РЕЗКА')}">
                                    <c:if test="${countRezka>0}">
                                        <pre style="color: red">Альтернатива: ${detailInfo.workBenches.name}</pre>
                                    </c:if>
                                    <c:if test="${countRezka==0}">
                                        <pre>${detailInfo.workBenches.name}</pre>
                                        <c:set var="countRezka" value="${countRezka + 1}" scope="page"/>
                                    </c:if>
                                </c:if>
                                <c:if test="${!detailInfo.workBenches.typeOperation.equals('ГИБКА') && !detailInfo.workBenches.typeOperation.equals('РЕЗКА')  }">
                                    <pre>${detailInfo.workBenches.name}</pre>
                                </c:if>
                            </c:forEach>
                        </td>
                    </c:if>
                    <c:if test="${detailsOrders.detailOrder.detailOrderLists.indexOf(detailLists)==0}">
                        <td>
                            <c:forEach items="${detailLists.detailOrderInfos}" var="workbench">
                                <pre>${workbench.timeWork}</pre>
                            </c:forEach>
                        </td>
                    </c:if>
                    <c:if test="${detailsOrders.detailOrder.detailOrderLists.indexOf(detailLists)==1}">
                        <td style="background: #fee8e8;">
                            <c:forEach items="${detailLists.detailOrderInfos}" var="workbench">
                                <pre>${workbench.timeWork}</pre>
                            </c:forEach>
                        </td>
                    </c:if>
                    <c:if test="${detailsOrders.detailOrder.detailOrderLists.indexOf(detailLists)==0}">
                        <td>
                            <c:forEach items="${detailLists.detailOrderInfos}" var="workbench">
                                <pre>${workbench.workBenches.dateEndDetail}</pre>
                            </c:forEach>
                        </td>
                    </c:if>
                    <c:if test="${detailsOrders.detailOrder.detailOrderLists.indexOf(detailLists)==1}">
                        <td style="background: #fee8e8;">
                            <c:forEach items="${detailLists.detailOrderInfos}" var="workbench">
                                <pre>${workbench.workBenches.dateEndDetail}</pre>
                            </c:forEach>
                        </td>
                    </c:if>
                    <c:if test="${detailsOrders.detailOrder.detailOrderLists.indexOf(detailLists)==0}">
                        <td>
                            <c:forEach items="${detailLists.detailOrderInfos}" var="workbench">
                                <pre>${workbench.workBenches.currentThickness} мм</pre>
                            </c:forEach>
                        </td>
                    </c:if>
                    <c:if test="${detailsOrders.detailOrder.detailOrderLists.indexOf(detailLists)==1}">
                        <td style="background: #fee8e8;">
                            <c:forEach items="${detailLists.detailOrderInfos}" var="workbench">
                                <pre>${workbench.workBenches.currentThickness} мм</pre>
                            </c:forEach>
                        </td>
                    </c:if>
                    <c:if test="${detailsOrders.detailOrder.detailOrderLists.indexOf(detailLists)==0}">
                        <td>
                            <c:forEach
                                    items="${detailsOrders.detailOrder.detailOrderLists.get(0).detailDateByWorkbench}"
                                    var="detailDateByWorkbench">
                                <pre>${detailDateByWorkbench.detailDateStart == null? " " : detailDateByWorkbench.detailDateStart}</pre>
                            </c:forEach>
                        </td>
                    </c:if>
                    <c:if test="${detailsOrders.detailOrder.detailOrderLists.indexOf(detailLists)==1}">
                        <td style="background: #fee8e8;">
                            <c:forEach
                                    items="${detailsOrders.detailOrder.detailOrderLists.get(1).detailDateByWorkbench}"
                                    var="detailDateByWorkbench">
                                <pre>${detailDateByWorkbench.detailDateStart == null? " " : detailDateByWorkbench.detailDateStart}</pre>
                            </c:forEach>
                        </td>
                    </c:if>
                    <c:if test="${detailsOrders.detailOrder.detailOrderLists.indexOf(detailLists)==0}">
                        <td>
                            <c:forEach
                                    items="${detailsOrders.detailOrder.detailOrderLists.get(0).detailDateByWorkbench}"
                                    var="DateByWorkbench">
                                <pre>${DateByWorkbench.detailDateEnd== null? " " : DateByWorkbench.detailDateEnd}</pre>
                            </c:forEach>
                        </td>
                    </c:if>
                    <c:if test="${detailsOrders.detailOrder.detailOrderLists.indexOf(detailLists)==1}">
                        <td style="background: #fee8e8;">
                            <c:forEach
                                    items="${detailsOrders.detailOrder.detailOrderLists.get(1).detailDateByWorkbench}"
                                    var="DateByWorkbench">
                                <pre>${DateByWorkbench.detailDateEnd== null? " " : DateByWorkbench.detailDateEnd}</pre>
                            </c:forEach>
                        </td>
                    </c:if>
                    <c:if test="${detailsOrders.detailOrder.detailOrderLists.indexOf(detailLists)==0}">
                        <td>
                            <c:forEach
                                    items="${detailsOrders.detailOrder.detailOrderLists.get(0).detailDateByWorkbench}"
                                    var="DateByWorkbench">
                                <pre>${DateByWorkbench.setting == true ? "Да" : "Нет"}</pre>
                            </c:forEach>
                        </td>
                    </c:if>
                    <c:if test="${detailsOrders.detailOrder.detailOrderLists.indexOf(detailLists)==1}">
                        <td style="background: #fee8e8;">
                            <c:forEach
                                    items="${detailsOrders.detailOrder.detailOrderLists.get(1).detailDateByWorkbench}"
                                    var="DateByWorkbench">
                                <pre>${DateByWorkbench.setting == true ? "Да" : "Нет"}</pre>
                            </c:forEach>
                        </td>
                    </c:if>
                </tr>
            </c:forEach>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>