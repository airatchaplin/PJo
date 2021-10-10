package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.dto.*;
import com.example.pozhiloyproject.helper.Db;
import com.example.pozhiloyproject.helper.Helper;
import com.example.pozhiloyproject.models.*;
import com.example.pozhiloyproject.repository.OrderRepository;
import com.example.pozhiloyproject.repository.WorkBenchRepository;

import java.time.format.DateTimeFormatter;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.stream.Collectors;

/**
 * Сервис заказов
 */
@Service
public class OrderService {

    @Autowired
    OrderRepository orderRepository;

    @Autowired
    WorkBenchRepository workBenchRepository;

    @Autowired
    DetailOrderInfoService detailOrderInfoService;

    @Autowired
    DetailDateByWorkbenchService detailDateByWorkbenchService;

    @Autowired
    Db db;

    /**
     * Получение списка всех заказов
     *
     * @return Список всех заказов
     */
    public List<OrderDto> getAllOrders() {
        List<Map<String, Object>> ordersId = db.call("select id from orders");
        List<OrderDto> orderDtos = new ArrayList<>();
        for (Map<String, Object> stringObjectMap : ordersId) {
            orderDtos.add(getOrderDtoById((UUID) stringObjectMap.get("id")));
        }
        return OrderDto.compareIncrement(orderDtos);
    }

    /**
     * Сохранение заказа
     *
     * @param order Заказ
     */
    public void saveOrder(Order order) {
        orderRepository.save(order);
    }

    /**
     * Получение заказа по номеру заказа
     *
     * @param numberOrder Номер заказа
     * @return Заказ
     */
    public Order getOrderByNumber(int numberOrder) {
        return orderRepository.findByNumberOrder(numberOrder);
    }


    public Order getOrderById(UUID id) {
        return orderRepository.findById(id).orElseThrow();
    }

    /**
     * Получение заказа по id
     *
     * @param id Идентификатор заказа
     * @return Заказ
     */
    public OrderDto getOrderDtoById(UUID id) {
        Order order = orderRepository.findById(id).orElseThrow();
        List<DetailsOrder> detailsOrders = order.getDetailsOrders();
        for (DetailsOrder detailsOrder : detailsOrders) {
            List<DetailOrderList> detailOrderLists = detailsOrder.getDetailOrder().getDetailOrderLists();
            DetailOrderList.compareIsSelectedMainOrAlternative(detailOrderLists);
            System.out.println(detailOrderLists.size());
        }
        OrderDto orderDto = new OrderDto();
        orderDto.setId(order.getId());
        orderDto.setNumberOrder(order.getNumberOrder());
        orderDto.setObjectName(order.getObjectName().getName());
        if (order.getDateStartOrder() != null) {
            orderDto.setDateStartOrder(order.getDateStartOrder().format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss")));
        } else {
            orderDto.setDateStartOrder(null);
        }

        if (order.getDateEndOrder() != null) {
            orderDto.setDateEndOrder(order.getDateEndOrder().format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss")));
        } else {
            orderDto.setDateEndOrder(null);
        }

        orderDto.setCalculated(order.isCalculated());
        orderDto.setComment(order.getComment());
        orderDto.setPacking(order.getPacking());
        orderDto.setPainting(order.getPainting());
        orderDto.setEconomist(order.getEconomist().getFio_i_o());
        orderDto.setManager(order.getManager().getFio_i_o());
        orderDto.setIncrement(order.getIncrement());

        List<DetailsOrder> detailsOrdersForDto = order.getDetailsOrders();
        List<DetailsOrderDto> detailsOrderDtos = new ArrayList<>();

        for (DetailsOrder detailsOrder : detailsOrdersForDto) {
            DetailsOrderDto detailsOrderDto = new DetailsOrderDto();
            detailsOrderDto.setId(detailsOrder.getId());
            detailsOrderDto.setIncrement(detailsOrder.getIncrement());
            detailsOrderDto.setCount(detailsOrder.getCount());

            List<DetailListDto> detailOrderDtos = new ArrayList<>();
            DetailOrder detailOrder = detailsOrder.getDetailOrder();
            DetailOrderDto detailOrderDto = new DetailOrderDto();
            detailOrderDto.setId(detailOrder.getId());
            detailOrderDto.setName(detailOrder.getName());
            detailOrderDto.setTimePacking(detailOrder.getTimePacking());
            detailOrderDto.setMaterial(detailOrder.getMaterial());

            List<Map<String, Object>> mapList = db.call(String.format(
                    "select  o.id, ddbw.detail_date_start, ddbw.detail_date_end, ddbw.priority\n" +
                            "from orders\n" +
                            "         join orders_details_orders odo on orders.id = odo.order_id\n" +
                            "         join details_order d on odo.details_orders_id = d.id\n" +
                            "         join detail_order o on d.detail_order_id = o.id\n" +
                            "         join detail_order_detail_order_lists dodol on o.id = dodol.detail_order_id\n" +
                            "         join detail_order_list dol on dodol.detail_order_lists_id = dol.id\n" +
                            "         join detail_order_list_detail_date_by_workbench dolddbw on dol.id = dolddbw.detail_order_list_id\n" +
                            "         join detail_date_by_workbench ddbw on dolddbw.detail_date_by_workbench_id = ddbw.id\n" +
                            "where orders.id = '%1$s'\n" +
                            "  and detail_date_start is not null\n" +
                            "  and detail_date_end is not null\n" +
                            "and o.id ='%2$s'\n" +
                            "order by ddbw.priority", id, detailOrder.getId()));

            if (!mapList.isEmpty()) {
                LocalDateTime dateStart = LocalDateTime.parse(String.valueOf(mapList.get(0).get("detail_date_start")).replace(" ", "T"));
                LocalDateTime dateEnd = LocalDateTime.parse(String.valueOf(mapList.get(mapList.size() - 1).get("detail_date_end")).replace(" ", "T"));
                detailOrderDto.setDateStartDetail(dateStart.format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss")));
                detailOrderDto.setDateEndDetail(dateEnd.format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss")));
            } else {
                detailOrderDto.setDateStartDetail("");
                detailOrderDto.setDateEndDetail("");
            }
            List<DetailOrderList> detailOrderLists = detailOrder.getDetailOrderLists();
            List<DetailOrderListDto> detailOrderListsDtos = new ArrayList<>();

            for (DetailOrderList detailOrderList : detailOrderLists) {
                DetailOrderListDto detailOrderListDto = new DetailOrderListDto();
                detailOrderListDto.setId(detailOrderList.getId());
                detailOrderListDto.setSelected(detailOrderList.isSelected());
                detailOrderListDto.setMainOrAlternative(detailOrderList.getMainOrAlternative());

                List<DetailOrderInfo> detailOrderInfos = detailOrderList.getDetailOrderInfos();
                List<DetailOrderInfoDto> detailOrderInfosDtos = new ArrayList<>();

                for (DetailOrderInfo detailOrderInfo : detailOrderInfos) {
                    DetailOrderInfoDto detailOrderInfoDto = new DetailOrderInfoDto();
                    detailOrderInfoDto.setId(detailOrderInfo.getId());
                    detailOrderInfoDto.setPriority(detailOrderInfo.getPriority());
                    detailOrderInfoDto.setComment(detailOrderInfo.getComment());
                    detailOrderInfoDto.setSetting(detailOrderInfo.isSetting());
                    detailOrderInfoDto.setTimeWork(detailOrderInfo.getTimeWork());

                    WorkBench workBenches = detailOrderInfo.getWorkBenches();
                    WorkBenchDto workBenchDto = new WorkBenchDto();
                    workBenchDto.setId(workBenches.getId());
                    workBenchDto.setName(workBenches.getName());
                    workBenchDto.setTypeOperation(workBenches.getTypeOperation().getName());
                    workBenchDto.setCurrentThickness(workBenches.getCurrentThickness());
                    workBenchDto.setDateEndDetail(workBenches.getDateEndDetail()
                            .format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss")));
//                    workBenchDto.setPriority(workBenches.get());
                    detailOrderInfoDto.setWorkBenches(workBenchDto);

                    detailOrderInfosDtos.add(detailOrderInfoDto);
                }

                DetailOrderInfoDto.comparePriority(detailOrderInfosDtos);
                List<DetailDateByWorkbench> detailDateByWorkbenches = detailOrderList.getDetailDateByWorkbench();
                List<DetailDateByWorkbenchDto> detailDateByWorkbenchesDtos = new ArrayList<>();

                for (DetailDateByWorkbench detailDateByWorkbench : detailDateByWorkbenches) {
                    DetailDateByWorkbenchDto detailDateByWorkbenchDto = new DetailDateByWorkbenchDto();
                    detailDateByWorkbenchDto.setId(detailDateByWorkbench.getId());
                    detailDateByWorkbenchDto.setPriority(detailDateByWorkbench.getPriority());

                    if (detailDateByWorkbench.getDetailDateEnd() != null) {
                        detailDateByWorkbenchDto.setDetailDateEnd(detailDateByWorkbench.getDetailDateEnd()
                                .format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss")));
                    } else {
                        detailDateByWorkbenchDto.setDetailDateEnd(null);
                    }
                    if (detailDateByWorkbench.getDetailDateStart() != null) {
                        detailDateByWorkbenchDto.setDetailDateStart(detailDateByWorkbench.getDetailDateStart()
                                .format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss")));
                    } else {
                        detailDateByWorkbenchDto.setDetailDateStart(null);
                    }

                    detailDateByWorkbenchDto.setSetting(detailDateByWorkbench.isSetting());
                    detailDateByWorkbenchDto.setWorkBench(detailDateByWorkbench.getWorkBench());

                    detailDateByWorkbenchesDtos.add(detailDateByWorkbenchDto);
                }
                DetailDateByWorkbenchDto.comparePriority(detailDateByWorkbenchesDtos);

                detailOrderListDto.setDetailOrderInfos(detailOrderInfosDtos);
                detailOrderListDto.setDetailDateByWorkbench(detailDateByWorkbenchesDtos);
                detailOrderListsDtos.add(detailOrderListDto);
            }
            detailOrderDto.setDetailOrderLists(detailOrderListsDtos);
            detailsOrderDto.setDetailOrder(detailOrderDto);
            detailsOrderDtos.add(detailsOrderDto);
        }
        DetailsOrderDto.comparePriority(detailsOrderDtos);
        orderDto.setDetailsOrders(detailsOrderDtos);
        return orderDto;
    }

    /**
     * Удаление заказа
     *
     * @param order Заказ
     */
    public void deleteOrder(Order order) {
        orderRepository.delete(order);
    }


    public void raschet(Order order) {
        if (order.isCalculated()) {
            return;
        }
        int hour;
        int minute;
        int second;

        //Получаем список деталей в заказе и сортируем его по толщине текущего станка
        List<DetailsOrder> detailsOrders = order.getDetailsOrders();

        Order.compareIncrementDetailsOrder(detailsOrders);

        for (DetailsOrder detailsOrder : detailsOrders) {
            Double detailThickness = detailsOrder.getDetailOrder().getMaterial().getThickness();
            List<DetailOrderList> detailOrderLists = detailsOrder.getDetailOrder().getDetailOrderLists();

            List<DetailOrderInfo> detailOrderInfos = new ArrayList<>();
            List<DetailDateByWorkbench> detailDateByWorkbenches = new ArrayList<>();

            DetailOrderList detailOrderList = new DetailOrderList();
            for (DetailOrderList detailOrdList : detailOrderLists) {
                if (detailOrdList.isSelected()) {
                    detailOrderInfos = detailOrdList.getDetailOrderInfos();
                    detailDateByWorkbenches = detailOrdList.getDetailDateByWorkbench();
                    detailOrderList = detailOrdList;
                }
            }

            DetailOrderInfo.comparePriority(detailOrderInfos);
            DetailDateByWorkbench.comparePriority(detailDateByWorkbenches);

            for (int j = 0; j < detailOrderInfos.size(); j++) {
                Double currentThickness = detailOrderInfos.get(j).getWorkBenches().getCurrentThickness();

                LocalDateTime dateEndDetailWorkbench = null;

                WorkBench workBenches = detailOrderInfos.get(j).getWorkBenches();

                int countDetail = detailsOrder.getCount();
                if (!detailOrderInfos.get(j).getWorkBenches().getTypeOperation().getName().equals("ГИБКА")) {

                    dateEndDetailWorkbench = detailOrderInfos.get(j).getWorkBenches().getDateEndDetail();

                    if (detailThickness.equals(currentThickness) && j == 0) {
                        //Сохраняем дату старта заказа с первой детали
                        if (detailsOrders.indexOf(detailsOrder) == 0) {
                            order.setDateStartOrder(dateEndDetailWorkbench);
                        }
                    } else if (!detailThickness.equals(currentThickness) && j == 0) {
                        dateEndDetailWorkbench = Helper.addTwoHoursWithoutDayOff(dateEndDetailWorkbench);
                        detailOrderList.getDetailDateByWorkbench().get(j).setSetting(true);

                        //Сохраняем дату старта заказа с первой детали
                        if (detailsOrders.indexOf(detailsOrder) == 0) {
                            order.setDateStartOrder(dateEndDetailWorkbench);
                        }
                    } else if (!detailThickness.equals(currentThickness) && j > 0) {
                        dateEndDetailWorkbench = Helper.addTwoHoursWithoutDayOff(dateEndDetailWorkbench);
                        detailOrderList.getDetailDateByWorkbench().get(j).setSetting(true);
                    }

                    //Сохраняем дату старта детали на текущем станке
                    int priority = detailOrderInfos.get(j).getPriority();
                    for (int i = 0; i < detailOrderList.getDetailDateByWorkbench().size(); i++) {
                        if (detailOrderList.getDetailDateByWorkbench().get(i).getPriority() == priority) {
                            detailOrderList.getDetailDateByWorkbench().get(i).setDetailDateStart(dateEndDetailWorkbench);
                            break;
                        }
                    }

//                    if (j > 0) {
//                        for (int i = 0; i < detailList.getDetailDateByWorkbench().size(); i++) {
//                            if (detailList.getDetailDateByWorkbench().get(i).getPriority() == j - 1) {
//                                LocalDateTime detailDateStartFirst = detaildetailListsOrder.getDetailDateByWorkbench().get(i).getDetailDateStart();
//                                if (dateEndDetailWorkbench.isBefore(detailDateStartFirst)) {
//                                    List<String> timeWorkFirst = Arrays.asList(detailList.getDetailInfos().get(j - 1).getTimeWork().split(":"));
//                                    dateEndDetailWorkbench = detailDateStartFirst;
//                                    dateEndDetailWorkbench = dateEndDetailWorkbench.plusMinutes(Integer.parseInt(timeWorkFirst.get(1)) * 2L);
//                                    dateEndDetailWorkbench = dateEndDetailWorkbench.plusSeconds(Integer.parseInt(timeWorkFirst.get(2)) * 2L);
//
//                                }
//                            }
//                        }
//                    }

                    hour = Integer.parseInt(Arrays.asList(detailOrderInfos.get(j).getTimeWork().split(":")).get(0));
                    minute = Integer.parseInt(Arrays.asList(detailOrderInfos.get(j).getTimeWork().split(":")).get(1));
                    second = Integer.parseInt(Arrays.asList(detailOrderInfos.get(j).getTimeWork().split(":")).get(2));

                    dateEndDetailWorkbench = calculate(countDetail, dateEndDetailWorkbench, hour, minute, second);

                    for (int i = 0; i < detailOrderList.getDetailDateByWorkbench().size(); i++) {
                        if (detailOrderList.getDetailDateByWorkbench().get(i).getPriority() == priority) {
                            detailOrderList.getDetailDateByWorkbench().get(i).setDetailDateEnd(dateEndDetailWorkbench);
                        }
                    }

                    workBenches.setDateEndDetail(dateEndDetailWorkbench);
                    workBenches.setCurrentThickness(detailThickness);
                    workBenchRepository.save(workBenches);

                } else {
                    //Расчет станков гибки
                    List<DetailOrderInfo> gibkaList = detailOrderList.getDetailOrderInfos()
                            .stream().filter(x -> x.getWorkBenches().getTypeOperation().getName().equals("ГИБКА") && !x.getTimeWork().equals("00:00:00"))
                            .collect(Collectors.toList());
                    LocalDateTime localDateTimeCHPY_big = null;
                    LocalDateTime localDateTimeCHPY_small = null;
                    LocalDateTime localDateTimeManualMachine = null;

                    for (DetailOrderInfo info : gibkaList) {
                        switch (info.getWorkBenches().getName()) {
                            case "Гибочный пресс с ЧПУ 1,5м (ЧПУ маленький)":
                                localDateTimeCHPY_small = info.getWorkBenches().getDateEndDetail();
                                break;
                            case "Гибочный пресс с ЧПУ 3м (ЧПУ большой)":
                                localDateTimeCHPY_big = info.getWorkBenches().getDateEndDetail();
                                break;
                            case "Ручные станки":
                                localDateTimeManualMachine = info.getWorkBenches().getDateEndDetail();
                                break;
                        }
                    }
                    System.out.println(localDateTimeCHPY_big);

                    List<WorkBench> workBenchList = new ArrayList<>();
                    int countGibka = j;
                    for (DetailOrderInfo detailInfo : gibkaList) {
                        hour = Integer.parseInt(Arrays.asList(detailInfo.getTimeWork().split(":")).get(0));
                        minute = Integer.parseInt(Arrays.asList(detailInfo.getTimeWork().split(":")).get(1));
                        second = Integer.parseInt(Arrays.asList(detailInfo.getTimeWork().split(":")).get(2));

                        workBenches = detailInfo.getWorkBenches();
                        countDetail = detailsOrder.getCount();

                        currentThickness = detailInfo.getWorkBenches().getCurrentThickness();
                        dateEndDetailWorkbench = detailInfo.getWorkBenches().getDateEndDetail();
                        if (!currentThickness.equals(detailThickness)) {
                            dateEndDetailWorkbench = Helper.addTwoHoursWithoutDayOff(dateEndDetailWorkbench);
                            for (int k = 0; k < detailOrderList.getDetailDateByWorkbench().size(); k++) {
                                for (DetailOrderInfo detailOrderInfo : gibkaList) {
                                    if (detailOrderList.getDetailOrderInfos().get(k).equals(detailOrderInfo)) {
                                        detailOrderList.getDetailDateByWorkbench().get(k).setSetting(true);
                                        break;
                                    }
                                }
                            }
                            detailOrderList.getDetailDateByWorkbench().get(j).setSetting(true);
                        }

                        for (int k = 0; k < detailOrderList.getDetailDateByWorkbench().size(); k++) {
                            if (detailOrderList.getDetailDateByWorkbench().get(k).getPriority() == j - 1) {
                                LocalDateTime detailDateStartFirst = detailOrderList.getDetailDateByWorkbench().get(k).getDetailDateStart();
                                if (dateEndDetailWorkbench.isBefore(detailDateStartFirst) || dateEndDetailWorkbench.isEqual(detailDateStartFirst)) {
                                    List<String> timeWorkFirst = Arrays.asList(detailOrderList.getDetailOrderInfos().get(j - 1).getTimeWork().split(":"));
                                    dateEndDetailWorkbench = detailDateStartFirst;
                                    dateEndDetailWorkbench = dateEndDetailWorkbench.plusMinutes(Integer.parseInt(timeWorkFirst.get(1)) * 2L);
                                    dateEndDetailWorkbench = dateEndDetailWorkbench.plusSeconds(Integer.parseInt(timeWorkFirst.get(2)) * 2L);

                                }
                            }
                        }

                        int priority = detailInfo.getPriority();
                        for (int k = 0; k < detailOrderList.getDetailDateByWorkbench().size(); k++) {
                            if (detailOrderList.getDetailDateByWorkbench().get(k).getPriority() == priority) {
                                detailOrderList.getDetailDateByWorkbench().get(k).setDetailDateStart(dateEndDetailWorkbench);
                            }
                        }

                        dateEndDetailWorkbench = calculate(countDetail, dateEndDetailWorkbench, hour, minute, second);

                        for (int k = 0; k < detailOrderList.getDetailDateByWorkbench().size(); k++) {
                            if (detailOrderList.getDetailDateByWorkbench().get(k).getPriority() == priority) {
                                detailOrderList.getDetailDateByWorkbench().get(k).setDetailDateEnd(dateEndDetailWorkbench);
                            }
                        }
                        detailOrderList.getDetailDateByWorkbench().get(countGibka).setDetailDateEnd(dateEndDetailWorkbench);
                        detailInfo.getWorkBenches().setDateEndDetail(dateEndDetailWorkbench);
                        workBenchList.add(detailInfo.getWorkBenches());
                        countGibka++;
                    }

                    compareWorkbenches(workBenchList);
                    UUID workbenchIdMinDateEnd = workBenchList.get(0).getId();
                    // устанавливаем обратно даты
                    for (DetailOrderInfo detailInfo : gibkaList) {

                        if (!workbenchIdMinDateEnd.equals(detailInfo.getWorkBenches().getId())) {
                            switch (detailInfo.getWorkBenches().getName()) {
                                case "Гибочный пресс с ЧПУ 1,5м (ЧПУ маленький)":
                                    detailInfo.getWorkBenches().setDateEndDetail(localDateTimeCHPY_small);
                                    break;
                                case "Гибочный пресс с ЧПУ 3м (ЧПУ большой)":
                                    detailInfo.getWorkBenches().setDateEndDetail(localDateTimeCHPY_big);
                                    break;
                                case "Ручные станки":
                                    detailInfo.getWorkBenches().setDateEndDetail(localDateTimeManualMachine);
                                    break;
                            }
                        }
                    }
                    for (DetailOrderInfo orderInfo : gibkaList) {
                        if (orderInfo.getWorkBenches().getId().equals(workbenchIdMinDateEnd)) {
                            workBenches = orderInfo.getWorkBenches();
                            workBenches.setCurrentThickness(detailThickness);
                        }
                    }
                    gibkaList.removeIf(x -> x.getWorkBenches().getId().equals(workbenchIdMinDateEnd));

                    for (DetailOrderInfo detailOrderInfo : gibkaList) {

                        detailOrderInfos.removeIf(x -> x.getPriority() == detailOrderInfo.getPriority());
                        detailOrderLists.forEach(x -> x.getDetailDateByWorkbench().removeIf(y -> y.getPriority() == detailOrderInfo.getPriority()));
                    }
                    workBenchRepository.save(workBenches);
                    order.setDateEndOrder(workBenches.getDateEndDetail());

                    break;
                }
            }
        }
        order.setCalculated(true);
        orderRepository.save(order);
    }

    public static void compareWorkbenches(List<WorkBench> workBenches) {
        Comparator<WorkBench> comparator = Comparator.comparing(WorkBench::getDateEndDetail);
        workBenches.sort(comparator);
    }

    private LocalDateTime calculate(int countDetail, LocalDateTime dateEndDetailWorkbench
            , int hour, int minute, int second) {

        LocalDateTime dateStartDay = LocalDateTime.parse(dateEndDetailWorkbench.toLocalDate() + "T08:30");
        LocalDateTime dateEndDay = LocalDateTime.parse(dateEndDetailWorkbench.toLocalDate() + "T16:30");
        LocalDateTime dateLunchStartDay = LocalDateTime.parse(dateEndDetailWorkbench.toLocalDate() + "T11:00");
        LocalDateTime dateLunchEndDay = LocalDateTime.parse(dateEndDetailWorkbench.toLocalDate() + "T12:00");

        LocalDateTime dateSmokeBreakStartDay1 = LocalDateTime.parse(dateEndDetailWorkbench.toLocalDate() + "T09:00");
        LocalDateTime dateSmokeBreakEndDay1 = LocalDateTime.parse(dateEndDetailWorkbench.toLocalDate() + "T09:10");

        LocalDateTime dateSmokeBreakStartDay2 = LocalDateTime.parse(dateEndDetailWorkbench.toLocalDate() + "T13:00");
        LocalDateTime dateSmokeBreakEndDay2 = LocalDateTime.parse(dateEndDetailWorkbench.toLocalDate() + "T13:10");

        LocalDateTime localDateTime;

        for (int i = 0; i < countDetail; i++) {
            localDateTime = dateEndDetailWorkbench;

            if (dateEndDetailWorkbench.isAfter(dateSmokeBreakStartDay1) && dateEndDetailWorkbench.isBefore(dateSmokeBreakEndDay1)) {
                dateEndDetailWorkbench = dateSmokeBreakEndDay1;
            }
            if (dateEndDetailWorkbench.isAfter(dateSmokeBreakStartDay2) && dateEndDetailWorkbench.isBefore(dateSmokeBreakEndDay2)) {
                dateEndDetailWorkbench = dateSmokeBreakEndDay2;
            }
            if (dateEndDetailWorkbench.isAfter(dateLunchStartDay) && dateEndDetailWorkbench.isBefore(dateLunchEndDay)) {
                dateEndDetailWorkbench = dateLunchEndDay;
            }
            if (!dateEndDetailWorkbench.isAfter(dateEndDay)) {
                dateEndDetailWorkbench = dateEndDetailWorkbench.plusMinutes(minute);
                dateEndDetailWorkbench = dateEndDetailWorkbench.plusSeconds(second);
            } else {
                dateStartDay = dateStartDay.plusDays(1);
                dateEndDay = dateEndDay.plusDays(1);
                dateEndDetailWorkbench = dateStartDay;

                dateLunchStartDay = dateLunchStartDay.plusDays(1);
                dateLunchEndDay = dateLunchEndDay.plusDays(1);

                dateSmokeBreakStartDay1 = dateSmokeBreakStartDay1.plusDays(1);
                dateSmokeBreakEndDay1 = dateSmokeBreakEndDay1.plusDays(1);

                dateSmokeBreakStartDay2 = dateSmokeBreakStartDay2.plusDays(1);
                dateSmokeBreakEndDay2 = dateSmokeBreakEndDay2.plusDays(1);
            }
        }
        return dateEndDetailWorkbench;
    }
}
