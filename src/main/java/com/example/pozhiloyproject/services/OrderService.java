package com.example.pozhiloyproject.services;


import com.example.pozhiloyproject.dto.DetailDto;
import com.example.pozhiloyproject.dto.DetailInfoDto;
import com.example.pozhiloyproject.dto.OrderDto;
import com.example.pozhiloyproject.dto.WorkBenchDto;
import com.example.pozhiloyproject.helper.Helper;
import com.example.pozhiloyproject.models.*;
import com.example.pozhiloyproject.repository.OrderRepository;
import com.example.pozhiloyproject.repository.WorkBenchRepository;

import java.time.DayOfWeek;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.header.Header;
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


    /**
     * Получение списка всех заказов
     *
     * @return Список всех заказов
     */
    public List<Order> getAllOrders() {
        return orderRepository.findAll();
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

    /**
     * Получение заказа по id
     *
     * @param id Идентификатор заказа
     * @return Заказ
     */
    public Order getOrderById(UUID id) {
        Order order = orderRepository.findById(id).orElseThrow();
        for (int i = 0; i < order.getDetailsOrders().size(); i++) {
            List<DetailInfo> detailInfos = order.getDetailsOrders().get(i).getDetail().getDetailInfos();
            DetailInfo.comparePriority(detailInfos);
            List<DetailDateByWorkbench> detailDateByWorkbench = order.getDetailsOrders().get(i).getDetailDateByWorkbench();
            DetailDateByWorkbench.comparePriority(detailDateByWorkbench);
            order.getDetailsOrders().get(i).getDetail().setDetailInfos(detailInfos);
            order.getDetailsOrders().get(i).setDetailDateByWorkbench(detailDateByWorkbench);
        }
        return order;
    }

    /**
     * Удаление заказа
     *
     * @param order Заказ
     */
    public void deleteOrder(Order order) {
        orderRepository.delete(order);
    }


    //    public void raschet(int numberOrder) {
//
//        Order order = orderRepository.findByNumberOrder(numberOrder);
//        List<DetailInfo> detailInfos = order.getDetailInfos();
//        LocalDateTime dateOrderStart = detailInfos.get(0).getDetail().getWorkBenches().get(0).getDateEndDetail();
//        LocalDateTime dateOrderEnd = null;
//
//        LocalDateTime dateDetailInfoStart = null;
//        LocalDateTime dateDetailInfoEnd = null;
//
//        for (int i = 0; i < detailInfos.size(); i++) {
//            List<Boolean> isCalculated = new ArrayList<>();
//            WorkBench workBench = null;
//            LocalDateTime dateTimeWorkbench = null;
//            Boolean isCalc = null;
//
//            for (int j = 0; j < detailInfos.get(i).getDetail().getWorkBenches().size(); j++) {
//
//                isCalc = detailInfos.get(i).getIsCalculated().get(j);
//
//                if (isCalc.equals(false)) {
//
//                    dateDetailInfoStart = detailInfos.get(i).getDetail().getWorkBenches().get(j).getDateEndDetail();
//                    workBench = detailInfos.get(i).getDetail().getWorkBenches().get(j);
//
//                    LocalDateTime dateStart = LocalDateTime.parse(workBench.getDateEndDetail().toLocalDate() + "T08:30");
//                    LocalDateTime dateEnd = LocalDateTime.parse(workBench.getDateEndDetail().toLocalDate() + "T16:30");
//
//                    int countDetail = order.getDetailInfos().get(i).getCount();
//                    dateTimeWorkbench = workBench.getDateEndDetail();
//                    while (countDetail != 0) {
//                        String[] minSec = detailInfos.get(i).getDetail().getTimeWorkDetails().get(j).getTimeWork().split(",");
//                        String min = minSec[0];
//                        if (minSec.length > 1) {
//
//                            String sec = minSec[1];
//
//                            if (!dateTimeWorkbench.plusMinutes(Long.parseLong(min)).plusSeconds(Long.parseLong(sec))
//                                    .isAfter(dateEnd)) {
//                                dateTimeWorkbench = dateTimeWorkbench.plusMinutes(Long.parseLong(min));
//                                dateTimeWorkbench = dateTimeWorkbench.plusSeconds(Long.parseLong(sec));
//                                countDetail--;
//                            } else {
//                                dateEnd = dateEnd.plusDays(1);
//                                dateStart = dateStart.plusDays(1);
//                                dateTimeWorkbench = dateStart;
//                            }
//                        } else {
//                            if (!dateTimeWorkbench.plusMinutes(Long.parseLong(min))
//                                    .isAfter(dateEnd)) {
//                                dateTimeWorkbench = dateTimeWorkbench.plusMinutes(Long.parseLong(min));
//
//                                countDetail--;
//                            } else {
//                                dateEnd = dateEnd.plusDays(1);
//                                dateStart = dateStart.plusDays(1);
//                                dateTimeWorkbench = dateStart;
//                            }
//                        }
//
//
//                    }
//                    detailInfos.get(i).setDateStart(dateDetailInfoStart);
//                    detailInfos.get(i).setDateEnd(dateTimeWorkbench);
//
//                    isCalculated.add(true);
//                    if (detailInfos.size() - 1 == i && detailInfos.get(i).getDetail().getWorkBenches().size() - 1 == j) {
//                        dateOrderEnd = dateTimeWorkbench;
//                        order.setDateStart(dateOrderStart);
//                        order.setDateEnd(dateOrderEnd);
//                    }
//
//                    workBench.setDateEndDetail(dateTimeWorkbench);
//                    workBenchRepository.save(workBench);
//                }
//
//            }
//
//
//            if (!isCalculated.isEmpty()) {
//                detailInfos.get(i).setIsCalculated(isCalculated);
//
//            }
//        }
//
//        orderRepository.save(order);
//    }
    public void raschet(UUID id) {
        Order order = getOrderById(id);

        LocalDateTime dateOrderStart;
        LocalDateTime dateOrderEnd;
        int hour;
        int minute;
        int second;

        //Получаем список деталей в заказе и сортируем его по толщине текущего станка
        List<DetailsOrder> detailsOrders = order.getDetailsOrders();
        detailsOrders = sortByMaterialWorkbench(detailsOrders);
        order.setDetailsOrders(detailsOrders);

        OrderDto orderDto = setOrderDto(order);

        int countDetailOrder = 0;

        for (DetailsOrder detailsOrder : detailsOrders) {
            Double detailThickness = detailsOrder.getDetail().getMaterial().getThickness();
            List<DetailInfo> detailInfos = detailsOrder.getDetail().getDetailInfos();

            //Заполняем DetailDto
            setOrderDtoDetailDto(orderDto, detailsOrder);

            for (int j = 0; j < detailInfos.size(); j++) {
                Double currentThickness = detailInfos.get(j).getWorkBenches().getCurrentThickness();

                LocalDateTime dateEndDetailWorkbench = null;

                WorkBench workBenches = detailInfos.get(j).getWorkBenches();

                int countDetail = detailsOrder.getCount();
                if (!detailInfos.get(j).getWorkBenches().getTypeOperation().getName().equals("ГИБКА")) {

                    dateEndDetailWorkbench = detailInfos.get(j).getWorkBenches().getDateEndDetail();

                    if (detailThickness.equals(currentThickness) && j == 0) {
                        //Сохраняем дату старта заказа с первой детали
                        if (detailsOrders.indexOf(detailsOrder) == 0) {
                            order.setDateStartOrder(dateEndDetailWorkbench);
                        }
                    } else if (!detailThickness.equals(currentThickness) && j == 0) {
                        dateEndDetailWorkbench = Helper.addTwoHoursWithoutDayOff(dateEndDetailWorkbench);
                        detailsOrder.getDetailDateByWorkbench().get(j).setSetting(true);

                        //Сохраняем дату старта заказа с первой детали
                        if (detailsOrders.indexOf(detailsOrder) == 0) {
                            order.setDateStartOrder(dateEndDetailWorkbench);
                        }
                    } else if (!detailThickness.equals(currentThickness) && j > 0) {
                        dateEndDetailWorkbench = Helper.addTwoHoursWithoutDayOff(dateEndDetailWorkbench);
                        detailsOrder.getDetailDateByWorkbench().get(j).setSetting(true);
                    }

                    //Сохраняем дату старта детали на текущем станке
                    int priority = detailInfos.get(j).getPriority();
                    for (int i = 0; i < detailsOrder.getDetailDateByWorkbench().size(); i++) {
                        if (detailsOrder.getDetailDateByWorkbench().get(i).getPriority() == priority) {
                            detailsOrder.getDetailDateByWorkbench().get(i).setDetailDateStart(dateEndDetailWorkbench);
                        }
                    }


                    if (j > 0) {
                        for (int i = 0; i < detailsOrder.getDetailDateByWorkbench().size(); i++) {
                            if (detailsOrder.getDetailDateByWorkbench().get(i).getPriority() == j - 1) {
                                LocalDateTime detailDateStartFirst = detailsOrder.getDetailDateByWorkbench().get(i).getDetailDateStart();
                                if (dateEndDetailWorkbench.isBefore(detailDateStartFirst)) {
                                    List<String> timeWorkFirst = Arrays.asList(detailsOrder.getDetail().getDetailInfos().get(j-1).getTimeWork().split(":"));
                                    dateEndDetailWorkbench = detailDateStartFirst;
                                    dateEndDetailWorkbench = dateEndDetailWorkbench.plusMinutes(Integer.parseInt(timeWorkFirst.get(1)) * 2L);
                                    dateEndDetailWorkbench = dateEndDetailWorkbench.plusSeconds(Integer.parseInt(timeWorkFirst.get(2)) * 2L);

                                }
                            }
                        }
                    }

                    hour = Integer.parseInt(Arrays.asList(detailInfos.get(j).getTimeWork().split(":")).get(0));
                    minute = Integer.parseInt(Arrays.asList(detailInfos.get(j).getTimeWork().split(":")).get(1));
                    second = Integer.parseInt(Arrays.asList(detailInfos.get(j).getTimeWork().split(":")).get(2));

                    dateEndDetailWorkbench = calculate(countDetail, dateEndDetailWorkbench, hour, minute, second);

                    for (int i = 0; i < detailsOrder.getDetailDateByWorkbench().size(); i++) {
                        if (detailsOrder.getDetailDateByWorkbench().get(i).getPriority() == priority) {
                            detailsOrder.getDetailDateByWorkbench().get(i).setDetailDateEnd(dateEndDetailWorkbench);
                        }
                    }


                    workBenches.setDateEndDetail(dateEndDetailWorkbench);
                    workBenches.setCurrentThickness(detailThickness);
                    workBenchRepository.save(workBenches);
                    setOrderDtoDetailInfoDto(orderDto, detailInfos.get(j), countDetailOrder);


                } else {
                    //Расчет станков гибки
                    List<DetailInfo> gibkaList = detailsOrder.getDetail().getDetailInfos()
                            .stream().filter(x -> x.getWorkBenches().getTypeOperation().getName().equals("ГИБКА"))
                            .collect(Collectors.toList());
                    LocalDateTime localDateTimeCHPY_big = null;
                    LocalDateTime localDateTimeCHPY_small = null;
                    LocalDateTime localDateTimeManualMachine = null;

                    for (DetailInfo info : gibkaList) {
                        switch (info.getWorkBenches().getName()) {
                            case "Гибочный пресс с ЧПУ 1,5м (ЧПУ маленький)" -> localDateTimeCHPY_small = info.getWorkBenches().getDateEndDetail();
                            case "Гибочный пресс с ЧПУ 3м (ЧПУ большой)" -> localDateTimeCHPY_big = info.getWorkBenches().getDateEndDetail();
                            case "Ручные станки" -> localDateTimeManualMachine = info.getWorkBenches().getDateEndDetail();
                        }
                    }
                    System.out.println(localDateTimeCHPY_big);

                    List<WorkBench> workBenchList = new ArrayList<>();
                    int countGibka = j;
                    for (int i = 0, gibkaListSize = gibkaList.size(); i < gibkaListSize; i++) {
                        DetailInfo detailInfo = gibkaList.get(i);

                        hour = Integer.parseInt(Arrays.asList(detailInfo.getTimeWork().split(":")).get(0));
                        minute = Integer.parseInt(Arrays.asList(detailInfo.getTimeWork().split(":")).get(1));
                        second = Integer.parseInt(Arrays.asList(detailInfo.getTimeWork().split(":")).get(2));


                        workBenches = detailInfo.getWorkBenches();
                        countDetail = detailsOrder.getCount();


                        currentThickness = detailInfo.getWorkBenches().getCurrentThickness();
                        dateEndDetailWorkbench = detailInfo.getWorkBenches().getDateEndDetail();
                        if (!currentThickness.equals(detailThickness)) {
                            dateEndDetailWorkbench = Helper.addTwoHoursWithoutDayOff(dateEndDetailWorkbench);
                            for (int k = 0; k < detailsOrder.getDetailDateByWorkbench().size(); k++) {
                                for (int l = 0; l < detailsOrder.getDetail().getDetailInfos().size(); l++) {
                                    if (detailInfo.equals(detailsOrder.getDetail().getDetailInfos().get(l))){
                                        detailsOrder.getDetailDateByWorkbench().get(k).setSetting(true);
                                    }
                                }
                            }
                            detailsOrder.getDetailDateByWorkbench().get(j).setSetting(true);
                        }


                        for (int k = 0; k < detailsOrder.getDetailDateByWorkbench().size(); k++) {
                            if (detailsOrder.getDetailDateByWorkbench().get(k).getPriority() == j - 1) {
                                LocalDateTime detailDateStartFirst = detailsOrder.getDetailDateByWorkbench().get(j - 1).getDetailDateStart();
                                if (dateEndDetailWorkbench.isBefore(detailDateStartFirst) || dateEndDetailWorkbench.isEqual(detailDateStartFirst)) {
                                    List<String> timeWorkFirst = Arrays.asList(detailsOrder.getDetail().getDetailInfos().get(j-1).getTimeWork().split(":"));
                                    dateEndDetailWorkbench = detailDateStartFirst;
                                    dateEndDetailWorkbench = dateEndDetailWorkbench.plusMinutes(Integer.parseInt(timeWorkFirst.get(1)) * 2L);
                                    dateEndDetailWorkbench = dateEndDetailWorkbench.plusSeconds(Integer.parseInt(timeWorkFirst.get(2)) * 2L);

                                }
                            }
                        }

                        int priority = detailInfo.getPriority();
                        for (int k = 0; k < detailsOrder.getDetailDateByWorkbench().size(); k++) {
                            if (detailsOrder.getDetailDateByWorkbench().get(k).getPriority() == priority) {
                                detailsOrder.getDetailDateByWorkbench().get(k).setDetailDateStart(dateEndDetailWorkbench);
                            }
                        }


                        dateEndDetailWorkbench = calculate(countDetail, dateEndDetailWorkbench, hour, minute, second);

                        for (int k = 0; k < detailsOrder.getDetailDateByWorkbench().size(); k++) {
                            if (detailsOrder.getDetailDateByWorkbench().get(k).getPriority() == priority) {
                                detailsOrder.getDetailDateByWorkbench().get(k).setDetailDateEnd(dateEndDetailWorkbench);
                            }
                        }
                        detailsOrder.getDetailDateByWorkbench().get(countGibka).setDetailDateEnd(dateEndDetailWorkbench);
                        detailInfo.getWorkBenches().setDateEndDetail(dateEndDetailWorkbench);
                        workBenchList.add(detailInfo.getWorkBenches());
                        countGibka++;
                    }

                    gibkaList.size();

                    workBenchList = compareWorkbenches(workBenchList);
                    UUID workbenchIdMinDateEnd = workBenchList.get(0).getId();
                    // устанавливаем обратно даты
                    for (DetailInfo detailInfo : gibkaList) {

                        if (!workbenchIdMinDateEnd.equals(detailInfo.getWorkBenches().getId())) {
                            switch (detailInfo.getWorkBenches().getName()) {
                                case "Гибочный пресс с ЧПУ 1,5м (ЧПУ маленький)" -> detailInfo.getWorkBenches().setDateEndDetail(localDateTimeCHPY_small);
                                case "Гибочный пресс с ЧПУ 3м (ЧПУ большой)" -> detailInfo.getWorkBenches().setDateEndDetail(localDateTimeCHPY_big);
                                case "Ручные станки" -> detailInfo.getWorkBenches().setDateEndDetail(localDateTimeManualMachine);
                            }
                        }
                    }
                    for (int i = 0; i < gibkaList.size(); i++) {
                        if (gibkaList.get(i).getWorkBenches().getId().equals(workbenchIdMinDateEnd)){
                            workBenches = gibkaList.get(i).getWorkBenches();
                            workBenches.setCurrentThickness(detailThickness);
                        }
                    }
                    gibkaList.removeIf(x->x.getWorkBenches().getId().equals(workbenchIdMinDateEnd));

//                    DetailInfo detailInfo = gibkaList.stream().filter(x -> x.getWorkBenches().getId().equals(finalWorkBenches.getId())).findFirst().orElseThrow();

                    List<DetailDateByWorkbench> detailDateByWorkbench = detailsOrder.getDetailDateByWorkbench();
                    for (int i = 0; i < detailDateByWorkbench.size(); i++) {

                        for (int k = 0; k < gibkaList.size(); k++) {
                           if(detailDateByWorkbench.get(i).getPriority() == gibkaList.get(k).getPriority()){
                               detailDateByWorkbench.get(i).setDetailDateStart(null);
                               detailDateByWorkbench.get(i).setDetailDateEnd(null);
                               detailDateByWorkbench.get(i).setSetting(false);
                           }
                        }
                    }
//                    workBenches = workBenchRepository.findById(orderDate.getWorkbenchId()).orElseThrow();
//                    workBenches.setDateEndDetail(orderDate.getDateEndDetail());
                    workBenchRepository.save(workBenches);
//                    setOrderDtoDetailInfoDto(orderDto, detailInfo, countDetailOrder);

                    break;
                }
            }
            countDetailOrder++;
            detailInfoDtos = new ArrayList<>();

        }
        orderRepository.save(order);
    }

    public static List<WorkBench> compareWorkbenches(List<WorkBench> workBenches) {
        Comparator<WorkBench> comparator = Comparator.comparing(WorkBench::getDateEndDetail);
        workBenches.sort(comparator);
        return workBenches;
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
//        while (countDetail > 0) {
//            for (int k = 0; k < hour; k++) {
//                assert dateEndDetailWorkbench != null;
//                dateEndDetailWorkbench = dateEndDetailWorkbench.plusHours(1);
//            }
//            for (int k = 0; k < minute; k++) {
//                assert dateEndDetailWorkbench != null;
//                dateEndDetailWorkbench = dateEndDetailWorkbench.plusMinutes(1);
//            }
//            for (int k = 0; k < second; k++) {
//                assert dateEndDetailWorkbench != null;
//                dateEndDetailWorkbench = dateEndDetailWorkbench.plusSeconds(1);
//            }
//            countDetail--;
//        }
        return dateEndDetailWorkbench;
    }

    private OrderDto setOrderDto(Order order) {
        OrderDto orderDto = new OrderDto();
        orderDto.setId(order.getId());
        orderDto.setNumberOrder(order.getNumberOrder());
        orderDto.setObjectName(order.getObjectName().getName());
        orderDto.setManager(order.getManager().getName());
        orderDto.setEconomist(order.getEconomist().getName());
        orderDto.setComment(order.getComment());
        orderDto.setDetailDtos(new ArrayList<>());
        return orderDto;
    }

    private void setOrderDtoDetailDto(OrderDto orderDto, DetailsOrder detailsOrder) {

        DetailDto detailDto = new DetailDto();
        Detail detail = detailsOrder.getDetail();
        detailDto.setId(detail.getId());
        detailDto.setName(detail.getName());
        detailDto.setMaterialId(detail.getMaterial().getId());
        detailDto.setMaterialName(detail.getMaterial().getName());
        detailDto.setMaterialThickness(detail.getMaterial().getThickness());
        detailDto.setCount(detailsOrder.getCount());
        orderDto.getDetailDtos().add(detailDto);
    }


    public List<DetailInfoDto> detailInfoDtos = new ArrayList<>();

    public void setOrderDtoDetailInfoDto(OrderDto orderDto, DetailInfo detailInfo, int incr) {


        DetailInfoDto detailInfoDto = new DetailInfoDto();
        detailInfoDto.setId(detailInfo.getId());
        detailInfoDto.setPriority(detailInfo.getPriority());
        detailInfoDto.setTimeWork(detailInfo.getTimeWork());
        detailInfoDto.setComment(detailInfo.getComment());

        WorkBenchDto workBenchDto = new WorkBenchDto();
        workBenchDto.setId(detailInfo.getWorkBenches().getId());
        workBenchDto.setName(detailInfo.getWorkBenches().getName());
        workBenchDto.setCurrentThickness(detailInfo.getWorkBenches().getCurrentThickness());
        workBenchDto.setTypeOperation(detailInfo.getWorkBenches().getTypeOperation().getName());
        workBenchDto.setDateEndDetail(detailInfo.getWorkBenches().getDateEndDetail());

        detailInfoDto.setWorkBenchDto(workBenchDto);

        detailInfoDtos.add(detailInfoDto);

        orderDto.getDetailDtos().get(incr).setDetailInfoDtos(detailInfoDtos);
    }

    public List<DetailsOrder> sortByMaterialWorkbench(List<DetailsOrder> detailsOrders) {
        Set<DetailsOrder> sortDetailsOrder = new LinkedHashSet<>();
        for (DetailsOrder detailsOrder : detailsOrders) {
            Material materialDetail = detailsOrder.getDetail().getMaterial();
            Double currentThickness = detailsOrder.getDetail().getDetailInfos().get(0).getWorkBenches().getCurrentThickness();
            if (currentThickness.equals(materialDetail.getThickness())) {
                sortDetailsOrder.add(detailsOrder);
            }
        }

        sortDetailsOrder.addAll(detailsOrders);
        ArrayList<DetailsOrder> newDetailsOrders = new ArrayList<>(sortDetailsOrder);
        for (int i = 0; i < newDetailsOrders.size(); i++) {
            Double thickness = newDetailsOrders.get(i).getDetail().getMaterial().getThickness();
            List<DetailInfo> detailInfos = newDetailsOrders.get(i).getDetail().getDetailInfos();
            for (int j = 0; j < detailInfos.size(); j++) {
                Double currentThickness = detailInfos.get(j).getWorkBenches().getCurrentThickness();
                if (!thickness.equals(currentThickness)) {
                    detailInfos.get(j).setSetting(true);
                }
            }
        }
        return newDetailsOrders;
    }


}
