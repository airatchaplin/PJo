package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.dto.*;
import com.example.pozhiloyproject.helper.Db;
import com.example.pozhiloyproject.models.*;
import com.example.pozhiloyproject.models.completedOrder.*;
import com.example.pozhiloyproject.repository.CompletedOrderRepository;
import com.example.pozhiloyproject.repository.OldOrderRepository;
import com.example.pozhiloyproject.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Сервис заказов
 */
@Service
public class CompletedOrderService {

    @Autowired
    CompletedOrderRepository completedOrderRepository;

    @Autowired
    OrderRepository orderRepository;

    @Autowired
    OldOrderRepository oldOrderRepository;

    @Autowired
    CompletedDetailOrderListService completedDetailOrderListService;

    @Autowired
    CompletedDetailOrderService completedDetailOrderService;

    @Autowired
    Db db;

    /**
     * Перенос заказа в завершнные заказы
     *
     * @param order Заказ
     */
    public void saveCompletedOrder(Order order) {
        CompletedOrder completedOrder = new CompletedOrder();
        completedOrder.setId(order.getId());
        completedOrder.setNumberOrder(order.getNumberOrder());
        completedOrder.setObjectName(order.getObjectName());
        completedOrder.setManager(order.getManager());
        completedOrder.setDateStartOrder(order.getDateStartOrder());
        completedOrder.setDateEndOrder(order.getDateEndOrder());
        completedOrder.setComment(order.getComment());
        completedOrder.setCalculated(order.isCalculated());
        completedOrder.setEconomist(order.getEconomist());
        completedOrder.setIncrement(order.getIncrement());
        completedOrder.setPacking(order.getPacking());
        completedOrder.setPainting(order.getPainting());
        completedOrder.setUpdateDate(LocalDateTime.now());

        List<DetailsOrder> detailsOrders = order.getDetailsOrders();
        List<CompletedDetailsOrder> completedDetailsOrders = new ArrayList<>();
        for (DetailsOrder detailsOrder : detailsOrders) {
            CompletedDetailsOrder completedDetailsOrder = new CompletedDetailsOrder();
            completedDetailsOrder.setId(UUID.randomUUID());
            completedDetailsOrder.setCount(detailsOrder.getCount());
            completedDetailsOrder.setIncrement(detailsOrder.getIncrement());

            DetailOrder detailOrder = detailsOrder.getDetailOrder();
            CompletedDetailOrder completedDetailOrder = new CompletedDetailOrder();
            completedDetailOrder.setId(UUID.randomUUID());
            completedDetailOrder.setName(detailOrder.getName());
            completedDetailOrder.setMaterial(detailOrder.getMaterial());
            completedDetailOrder.setTimePacking(detailOrder.getTimePacking());

            List<DetailOrderList> detailOrderLists = detailOrder.getDetailOrderLists();
            List<CompletedDetailOrderList> completedDetailOrderLists = new ArrayList<>();
            for (DetailOrderList detailOrderList : detailOrderLists) {
                CompletedDetailOrderList completedDetailOrderList = new CompletedDetailOrderList();
                completedDetailOrderList.setId(UUID.randomUUID());
                completedDetailOrderList.setSelected(detailOrderList.isSelected());
                completedDetailOrderList.setMainOrAlternative(detailOrderList.getMainOrAlternative());

                List<DetailOrderInfo> detailOrderInfos = detailOrderList.getDetailOrderInfos();
                List<CompletedDetailOrderInfo> completedDetailOrderInfos = new ArrayList<>();

                for (DetailOrderInfo detailOrderInfo : detailOrderInfos) {
                    CompletedDetailOrderInfo completedDetailOrderInfo = new CompletedDetailOrderInfo();
                    completedDetailOrderInfo.setId(UUID.randomUUID());
                    completedDetailOrderInfo.setPriority(detailOrderInfo.getPriority());
                    completedDetailOrderInfo.setSetting(detailOrderInfo.isSetting());
                    completedDetailOrderInfo.setComment(detailOrderInfo.getComment());
                    completedDetailOrderInfo.setTimeWork(detailOrderInfo.getTimeWork());
                    completedDetailOrderInfo.setWorkBenches(detailOrderInfo.getWorkBenches());
                    completedDetailOrderInfos.add(completedDetailOrderInfo);
                }
                completedDetailOrderList.setDetailOrderInfos(completedDetailOrderInfos);

                List<DetailDateByWorkbench> detailDateByWorkbenches = detailOrderList.getDetailDateByWorkbench();
                List<CompletedDetailDateByWorkbench> completedDetailDateByWorkbenches = new ArrayList<>();

                for (DetailDateByWorkbench detailDateByWorkbench : detailDateByWorkbenches) {
                    CompletedDetailDateByWorkbench completedDetailDateByWorkbench = new CompletedDetailDateByWorkbench();
                    completedDetailDateByWorkbench.setId(UUID.randomUUID());
                    completedDetailDateByWorkbench.setDetailDateEnd(detailDateByWorkbench.getDetailDateEnd());
                    completedDetailDateByWorkbench.setDetailDateStart(detailDateByWorkbench.getDetailDateStart());
                    completedDetailDateByWorkbench.setWorkBench(detailDateByWorkbench.getWorkBench());
                    completedDetailDateByWorkbench.setPriority(detailDateByWorkbench.getPriority());
                    completedDetailDateByWorkbench.setSetting(detailDateByWorkbench.isSetting());
                    completedDetailDateByWorkbenches.add(completedDetailDateByWorkbench);
                }
                completedDetailOrderList.setDetailDateByWorkbench(completedDetailDateByWorkbenches);
                completedDetailOrderLists.add(completedDetailOrderList);
                completedDetailOrderListService.saveCompletedDetailOrderList(completedDetailOrderList);
            }
            completedDetailOrder.setDetailOrderLists(completedDetailOrderLists);
            completedDetailOrderService.saveCompletedDetailOrder(completedDetailOrder);
            completedDetailsOrders.add(completedDetailsOrder);
            completedDetailsOrder.setDetailOrder(completedDetailOrder);
        }
        completedOrder.setDetailsOrders(completedDetailsOrders);
        completedOrderRepository.save(completedOrder);
        oldOrderRepository.delete(oldOrderRepository.findByOrderId(order.getId()));
        orderRepository.delete(order);
    }

    /**
     * Получить список всех завершенных заказов
     *
     * @return Список всех завершенных заказов
     */
    public List<CompletedOrderDto> getAllCompletedOrders() {
        List<Map<String, Object>> completedOrdersId = db.call("select id from completed_orders");
        List<CompletedOrderDto> completedOrderDtos = new ArrayList<>();
        for (Map<String, Object> stringObjectMap : completedOrdersId) {
            completedOrderDtos.add(getCompleteOrderDto((UUID) stringObjectMap.get("id")));
        }
        return CompletedOrderDto.compareIncrement(completedOrderDtos);
    }

    /**
     * Получить завершенный заказ по id
     *
     * @param id Идентификатор заказа
     * @return Завершенный заказ
     */
    public CompletedOrder getOneCompletedOrderById(UUID id) {
        return completedOrderRepository.findById(id).orElseThrow();
    }

    /**
     * Получить завершенный заказ по номеру заказа
     *
     * @param numberOrder Номер заказа
     * @return Завершенный заказ
     */
    public CompletedOrder getOneCompletedOrderByNumber(int numberOrder) {
        return completedOrderRepository.findByNumberOrder(numberOrder);
    }

    /**
     * Получить DTO завершенного заказа
     *
     * @param id Идентификатор завершенного заказа
     * @return DTO завершенного заказа
     */
    public CompletedOrderDto getCompleteOrderDto(UUID id) {
        CompletedOrder order = completedOrderRepository.findById(id).orElseThrow();
        List<CompletedDetailsOrder> detailsOrders = order.getDetailsOrders();
        for (CompletedDetailsOrder detailsOrder : detailsOrders) {
            List<CompletedDetailOrderList> detailOrderLists = detailsOrder.getDetailOrder().getDetailOrderLists();
            CompletedDetailOrderList.compareIsSelectedMainOrAlternative(detailOrderLists);
            System.out.println(detailOrderLists.size());
        }
        CompletedOrderDto completedOrderDto = new CompletedOrderDto();
        completedOrderDto.setId(order.getId());
        completedOrderDto.setNumberOrder(order.getNumberOrder());
        completedOrderDto.setObjectName(order.getObjectName().getName());
        if (order.getDateStartOrder() != null) {
            completedOrderDto.setDateStartOrder(order.getDateStartOrder().format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss")));
        } else {
            completedOrderDto.setDateStartOrder(null);
        }

        if (order.getDateEndOrder() != null) {
            completedOrderDto.setDateEndOrder(order.getDateEndOrder().format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss")));
        } else {
            completedOrderDto.setDateEndOrder(null);
        }

        completedOrderDto.setCalculated(order.isCalculated());
        completedOrderDto.setComment(order.getComment());
        completedOrderDto.setPacking(order.getPacking());
        completedOrderDto.setPainting(order.getPainting());
        completedOrderDto.setEconomist(order.getEconomist().getFio_i_o());
        completedOrderDto.setManager(order.getManager().getFio_i_o());
        completedOrderDto.setIncrement(order.getIncrement());

        List<CompletedDetailsOrder> detailsOrdersForDto = order.getDetailsOrders();
        List<DetailsOrderDto> detailsOrderDtos = new ArrayList<>();

        for (CompletedDetailsOrder detailsOrder : detailsOrdersForDto) {
            DetailsOrderDto detailsOrderDto = new DetailsOrderDto();
            detailsOrderDto.setId(detailsOrder.getId());
            detailsOrderDto.setIncrement(detailsOrder.getIncrement());
            detailsOrderDto.setCount(detailsOrder.getCount());

            CompletedDetailOrder detailOrder = detailsOrder.getDetailOrder();
            DetailOrderDto detailOrderDto = new DetailOrderDto();
            detailOrderDto.setId(detailOrder.getId());
            detailOrderDto.setName(detailOrder.getName());
            detailOrderDto.setTimePacking(detailOrder.getTimePacking());
            detailOrderDto.setMaterial(detailOrder.getMaterial());

            List<Map<String, Object>> mapList = db.call(String.format(
                    "select  o.id, ddbw.detail_date_start, ddbw.detail_date_end, ddbw.priority\n" +
                            "from completed_orders\n" +
                            "         join completed_orders_details_orders odo on completed_orders.id = odo.completed_order_id\n" +
                            "         join completed_details_order d on odo.details_orders_id = d.id\n" +
                            "         join completed_detail_order o on d.detail_order_id = o.id\n" +
                            "         join completed_detail_order_detail_order_lists dodol on o.id = dodol.completed_detail_order_id\n" +
                            "         join completed_detail_order_list dol on dodol.detail_order_lists_id = dol.id\n" +
                            "         join completed_detail_order_list_detail_date_by_workbench dolddbw on dol.id = dolddbw.completed_detail_order_list_id\n" +
                            "         join completed_detail_date_by_workbench ddbw on dolddbw.detail_date_by_workbench_id = ddbw.id\n" +
                            "where completed_orders.id = '%1$s'\n" +
                            "  and detail_date_start is not null\n" +
                            "  and detail_date_end is not null\n" +
                            "  and o.id ='%2$s'\n" +
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
            List<CompletedDetailOrderList> detailOrderLists = detailOrder.getDetailOrderLists();
            List<DetailOrderListDto> detailOrderListsDtos = new ArrayList<>();

            for (CompletedDetailOrderList detailOrderList : detailOrderLists) {
                DetailOrderListDto detailOrderListDto = new DetailOrderListDto();
                detailOrderListDto.setId(detailOrderList.getId());
                detailOrderListDto.setSelected(detailOrderList.isSelected());
                detailOrderListDto.setMainOrAlternative(detailOrderList.getMainOrAlternative());

                List<CompletedDetailOrderInfo> detailOrderInfos = detailOrderList.getDetailOrderInfos();
                List<DetailOrderInfoDto> detailOrderInfosDtos = new ArrayList<>();

                for (CompletedDetailOrderInfo detailOrderInfo : detailOrderInfos) {
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
                List<CompletedDetailDateByWorkbench> detailDateByWorkbenches = detailOrderList.getDetailDateByWorkbench();
                List<DetailDateByWorkbenchDto> detailDateByWorkbenchesDtos = new ArrayList<>();

                for (CompletedDetailDateByWorkbench detailDateByWorkbench : detailDateByWorkbenches) {
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
        completedOrderDto.setDetailsOrders(detailsOrderDtos);
        return completedOrderDto;
    }

    /**
     * Удаление завершенных заказов, если прошел месяц
     */
    public void deleteCompletedOrderByUpdateDate() {
        List<Map<String, Object>> ids = db.call("select id from  completed_orders where  update_date + interval '1 month' < current_date");
        for (Map<String, Object> id : ids) {
            completedOrderRepository.delete(completedOrderRepository.getById((UUID) id.get("id")));
        }
    }
}
