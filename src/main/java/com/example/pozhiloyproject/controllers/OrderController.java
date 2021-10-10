package com.example.pozhiloyproject.controllers;

import com.example.pozhiloyproject.dto.*;
import com.example.pozhiloyproject.helper.Db;
import com.example.pozhiloyproject.models.*;
import com.example.pozhiloyproject.models.completedOrder.CompletedOrder;
import com.example.pozhiloyproject.services.*;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * Контроллер заказов
 */
@Controller
public class OrderController {

    @Autowired
    OrderService orderService;

    @Autowired
    DetailService detailService;

    @Autowired
    ContragentService contragentService;

    @Autowired
    DetailsOrderService detailInfoService;

    @Autowired
    CompletedOrderService completedOrderService;

    @Autowired
    UserService userService;

    @Autowired
    DetailDateByWorkbenchService detailDateByWorkbenchService;

    @Autowired
    DetailOrderService detailOrderService;

    @Autowired
    DetailOrderListService detailOrderListService;

    @Autowired
    DetailOrderInfoService detailOrderInfoService;

    @Autowired
    OldOrderService oldOrderService;

    @Autowired
    WorkBenchService workBenchService;

    @Autowired
    Db db;

    /**
     * Страница всех заказов метод GET
     *
     * @param model Модель
     * @return Страница всех заказов
     */
    @GetMapping("/orders")
    public String getAllOrders(Model model) {
        model.addAttribute("orders", orderService.getAllOrders());
        model.addAttribute("user", userService.getUserWeb());
        return "orders";
    }

    /**
     * Страница заказа метод GET
     *
     * @param id    Идентификатор заказа
     * @param model Модель
     * @return Страница заказа
     */
    @GetMapping("/orders/{id}")
    public String getOneOrder(@PathVariable(value = "id") String id, Model model) {
        model.addAttribute("order", orderService.getOrderDtoById(UUID.fromString(id)));
        model.addAttribute("user", userService.getUserWeb());
        return "oneOrder";
    }

    /**
     * Страница добавления заказа метод GET
     *
     * @param model Модель
     * @return Страница добавления заказа
     */
    @GetMapping("/addOrder")
    public String addOrderGet(Model model) {
        model.addAttribute("contragents", contragentService.getAllContragents());
        model.addAttribute("details", DetailDto.compareMaterialName(detailService.getAllDetails()));
        model.addAttribute("user", userService.getUserWeb());
        model.addAttribute("managers", userService.getManagers());
        return "addOrder";
    }

    /**
     * Страница добавления заказа метод POST
     *
     * @param numberOrder  Номер заказа
     * @param contragentId Идентификатор контрагента
     * @param managerId    Идентификатор  менеджера
     * @param detailId     Идентификатор детали
     * @param countDetail  Количество деталей
     * @param comment      Комментарий
     * @param model        Модель
     * @return Страница всех заказов
     */
    @PostMapping("/addOrder")
    public String addOrderPost(@RequestParam(required = false) String numberOrder,
                               @RequestParam(required = true) String contragentId,
                               @RequestParam(required = true) String managerId,
                               @RequestParam(required = true) List<String> detailId,
                               @RequestParam(required = true) List<String> countDetail,
                               @RequestParam(required = true) String comment,
                               Model model) {
        Order order = new Order();
        Order findOrder = null;
        CompletedOrder findCompletedOrder = null;
        try {
            findOrder = orderService.getOrderByNumber(Integer.parseInt(numberOrder));
            findCompletedOrder = completedOrderService.getOneCompletedOrderByNumber(Integer.parseInt(numberOrder));
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        if (findOrder != null || findCompletedOrder != null) {
            model.addAttribute("contragents", contragentService.getAllContragents());
            model.addAttribute("managers", userService.getManagers());
            model.addAttribute("details", DetailDto.compareMaterialName(detailService.getAllDetails()));
            model.addAttribute("numberOrderError", "Заказ с таким номером уже существует!");
            model.addAttribute("user", userService.getUserWeb());
            return "addOrder";
        }

        List<Map<String, Object>> call = db.call("select max(increment) from orders");
        long incr = 0;
        if (call.get(0).get("max") == null) {
            order.setIncrement(incr);
        } else {
            incr = (long) call.get(0).get("max");
            incr++;
        }
        order.setIncrement(incr);
        order.setId(UUID.randomUUID());
        order.setNumberOrder(Integer.parseInt(numberOrder));
        order.setObjectName(contragentService.getOneContragentById(UUID.fromString(contragentId)));
        order.setManager(userService.getUserById(UUID.fromString(managerId)));
        order.setEconomist(userService.getUserWeb());
        order.setPainting("00/00/00/00");
        order.setPacking("00/00/00/00");
        order.setComment(comment);

        List<Integer> countDetailList = new ArrayList<>();

        for (String s : countDetail) {
            if (s.equals("")) {
                countDetailList.add(0);
            } else {
                countDetailList.add(Integer.parseInt(s));
            }
        }

        List<DetailsOrder> list = new ArrayList<>();

        for (int i = 0; i < countDetailList.size(); i++) {
            DetailsOrder detailsOrder = new DetailsOrder();
            detailsOrder.setId(UUID.randomUUID());
            detailsOrder.setIncrement(i);
            detailsOrder.setCount(Integer.parseInt(countDetail.get(i)));

            if (detailId.get(i).equals("Выбирите деталь") && countDetailList.get(i) == 0) {
                continue;
            } else {
                Detail detailById = detailService.getDetailById(UUID.fromString(detailId.get(i)));

                DetailOrder detailOrder = new DetailOrder();
                detailOrder.setId(UUID.randomUUID());
                detailOrder.setName(detailById.getName());
                detailOrder.setMaterial(detailById.getMaterial());
                detailOrder.setTimePacking(detailById.getTimePacking());

                List<DetailList> detailLists = detailById.getDetailLists();
                List<DetailOrderList> detailOrderLists = new ArrayList<>();
                for (DetailList detailList : detailLists) {
                    DetailOrderList detailOrderList = new DetailOrderList();
                    detailOrderList.setId(UUID.randomUUID());
                    detailOrderList.setMainOrAlternative(detailList.getMainOrAlternative());
                    detailOrderList.setSelected(false);


                    List<DetailInfo> detailInfos = detailList.getDetailInfos();
                    List<DetailOrderInfo> detailOrderInfos = new ArrayList<>();
                    List<DetailDateByWorkbench> detailDateByWorkbenchs = new ArrayList<>();
                    for (DetailInfo detailInfo : detailInfos) {
                        DetailOrderInfo detailOrderInfo = new DetailOrderInfo();
                        detailOrderInfo.setId(UUID.randomUUID());
                        detailOrderInfo.setPriority(detailInfo.getPriority());
                        detailOrderInfo.setTimeWork(detailInfo.getTimeWork());
                        detailOrderInfo.setComment(detailInfo.getComment());
                        detailOrderInfo.setWorkBenches(detailInfo.getWorkBenches());
                        detailOrderInfo.setSetting(false);

                        DetailDateByWorkbench detailDateByWorkbench = new DetailDateByWorkbench();
                        detailDateByWorkbench.setId(UUID.randomUUID());
                        detailDateByWorkbench.setDetailDateEnd(null);
                        detailDateByWorkbench.setDetailDateStart(null);
                        detailDateByWorkbench.setWorkBench(detailInfo.getWorkBenches());
                        detailDateByWorkbench.setPriority(detailInfo.getPriority());
                        detailDateByWorkbench.setSetting(false);

                        detailOrderInfos.add(detailOrderInfo);
                        detailDateByWorkbenchs.add(detailDateByWorkbench);
                    }
                    detailOrderLists.add(detailOrderList);
                    detailOrderList.setDetailOrderInfos(detailOrderInfos);
                    detailOrderList.setDetailDateByWorkbench(detailDateByWorkbenchs);
                    detailOrderListService.saveDetailOrderList(detailOrderList);
                }
                detailOrder.setDetailOrderLists(detailOrderLists);
                detailsOrder.setDetailOrder(detailOrder);
                detailOrderService.saveDetailOrder(detailOrder);
            }
            list.add(detailsOrder);
        }
        order.setDetailsOrders(list);

        oldOrderService.fillOldOrderByOrder(order);
        orderService.saveOrder(order);
        return "redirect:/orders";
    }

    /**
     * Страница изменения заказа метод GET
     *
     * @param id    Идентификатор заказа
     * @param model Модель
     * @return Страница изменения заказа
     */
    @GetMapping("/orders/change/{id}")
    public String changeOrderGet(@PathVariable(value = "id") String id, Model model) {
        List<Integer> weeks = Stream.of(1, 2, 3, 4, 5, 6, 7).collect(Collectors.toList());
        List<Integer> days = Stream.of(1, 2, 3, 4, 5, 6, 7).collect(Collectors.toList());
        List<Integer> hours = Stream.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23).collect(Collectors.toList());
        List<Integer> minutes = new ArrayList<>();
        for (int i = 1; i <= 59; i++) {
            minutes.add(i);
        }
        model.addAttribute("contragents", contragentService.getAllContragents());
        model.addAttribute("managers", userService.getManagers());
        model.addAttribute("details", detailService.getAllDetails());
        model.addAttribute("order", orderService.getOrderById(UUID.fromString(id)));
        model.addAttribute("user", userService.getUserWeb());
        model.addAttribute("weeks", weeks);
        model.addAttribute("days", days);
        model.addAttribute("hours", hours);
        model.addAttribute("minutes", minutes);
        return "changeOrder";
    }

    /**
     * Страница изменения заказа метод POST
     *
     * @param id          Идентификатор заказа
     * @param detailId    Идентификатор детали
     * @param countDetail Количество деталей
     * @return Страница всех заказов
     */
    @PostMapping("/orders/change/{id}")
    public String changeOrderPost(@PathVariable(value = "id") String id,
                                  @RequestParam(required = true) List<String> detailId,
                                  @RequestParam(required = true) List<Integer> countDetail,
                                  @RequestParam(required = true) String weeksPaiting,
                                  @RequestParam(required = true) String daysPaiting,
                                  @RequestParam(required = true) String hoursPaiting,
                                  @RequestParam(required = true) String minutesPaiting,
                                  @RequestParam(required = true) String weeksPacking,
                                  @RequestParam(required = true) String daysPacking,
                                  @RequestParam(required = true) String hoursPacking,
                                  @RequestParam(required = true) String minutesPacking,
                                  @RequestParam(required = true) String comment) {

        Order order = orderService.getOrderById(UUID.fromString(id));
        String packing = String.format("%1$s/%2$s/%3$s/%4$s", weeksPacking, daysPacking, hoursPacking, minutesPacking);
        String painting = String.format("%1$s/%2$s/%3$s/%4$s", weeksPaiting, daysPaiting, hoursPaiting, minutesPaiting);
        order.setPacking(packing);
        order.setPainting(painting);
        for (int i = 0; i < detailId.size(); i++) {
            if (order.getDetailsOrders().get(i).getDetailOrder().getId().toString().equals(detailId.get(i))) {
                order.getDetailsOrders().get(i).setCount(countDetail.get(i));
            }
        }
        String comment1 = order.getComment();
        comment1 += "\n" + comment;
        order.setComment(comment1);
        oldOrderService.deleteOldOrder(order.getNumberOrder());
        oldOrderService.fillOldOrderByOrder(order);
        orderService.saveOrder(order);
        return "redirect:/orders/" + id;
    }

    /**
     * Страница добавления детали к заказу метод GET
     *
     * @param id    Идентификатор заказа
     * @param model Модель
     * @return Страница добавления детали к заказу
     */
    @GetMapping("/orders/add/{id}")
    public String addNewElementForOrderGet(@PathVariable(value = "id") String id, Model model) {
        model.addAttribute("contragents", contragentService.getAllContragents());
        model.addAttribute("managers", userService.getManagers());
        List<DetailDto> allDetails = detailService.getAllDetails();
        Order order = orderService.getOrderById(UUID.fromString(id));
        for (int i = 0; i < order.getDetailsOrders().size(); i++) {
            int finalI = i;
            allDetails.removeIf(x -> x.getName().equals(order.getDetailsOrders().get(finalI).getDetailOrder().getName()));
        }
        model.addAttribute("details", allDetails);
        model.addAttribute("order", orderService.getOrderById(UUID.fromString(id)));
        model.addAttribute("user", userService.getUserWeb());
        return "addNewElementForOrder";
    }

    /**
     * Страница добавления детали к заказу метод POST
     *
     * @param detailId    Идентификатор детали
     * @param countDetail Количество детаелй
     * @param model       Модель
     * @return Страница всех заказов
     */
    @PostMapping("/orders/add/{id}")
    public String addNewElementForOrderPost(@PathVariable(value = "id") String id,
                                            @RequestParam(required = true) List<String> detailId,
                                            @RequestParam(required = true) List<String> countDetail, Model model) {
        Order order = orderService.getOrderById(UUID.fromString(id));
        List<DetailsOrder> detailsOrders = order.getDetailsOrders();
        int increment = detailsOrders.size();
        for (int i = 0; i < detailId.size(); i++) {
            if (detailId.get(i).equals("Выбирите деталь")) {
                allModel(model);
                model.addAttribute("user", userService.getUserWeb());
                model.addAttribute("order", orderService.getOrderById(UUID.fromString(id)));
                List<DetailDto> allDetails = detailService.getAllDetails();
                for (int j = 0; j < order.getDetailsOrders().size(); j++) {
                    int finalJ = j;
                    allDetails.removeIf(x -> x.getName().equals(order.getDetailsOrders().get(finalJ).getDetailOrder().getName()));
                }
                model.addAttribute("details", allDetails);
                model.addAttribute("order", orderService.getOrderById(UUID.fromString(id)));
                model.addAttribute("detailError", "Не выбрана деталь!");
                return "addNewElementForOrder";
            }

            Detail detail = detailService.getDetailById(UUID.fromString(detailId.get(i)));

            DetailsOrder detailsOrder = new DetailsOrder();
            detailsOrder.setIncrement(increment);
            detailsOrder.setId(UUID.randomUUID());

            DetailOrder detailOrder = new DetailOrder();
            detailOrder.setId(UUID.randomUUID());
            detailOrder.setName(detail.getName());
            detailOrder.setMaterial(detail.getMaterial());
            detailOrder.setTimePacking(detail.getTimePacking());

            List<DetailOrderList> detailOrderLists = new ArrayList<>();
            List<DetailList> detailLists = detail.getDetailLists();
            for (DetailList detailList : detailLists) {
                DetailOrderList detailOrderList = new DetailOrderList();
                detailOrderList.setId(UUID.randomUUID());
                detailOrderList.setMainOrAlternative(detailList.getMainOrAlternative());
                detailOrderList.setSelected(false);

                List<DetailInfo> detailInfos = detailList.getDetailInfos();
                List<DetailDateByWorkbench> detailDateByWorkbenches = new ArrayList<>();
                List<DetailOrderInfo> detailOrderInfos = new ArrayList<>();

                for (int k = 0; k < detailInfos.size(); k++) {
                    DetailOrderInfo detailOrderInfo = new DetailOrderInfo();
                    detailOrderInfo.setId(UUID.randomUUID());
                    detailOrderInfo.setSetting(false);
                    detailOrderInfo.setComment(detailInfos.get(k).getComment());
                    detailOrderInfo.setWorkBenches(detailInfos.get(k).getWorkBenches());
                    detailOrderInfo.setPriority(detailInfos.get(k).getPriority());
                    detailOrderInfo.setTimeWork(detailInfos.get(k).getTimeWork());
                    detailOrderInfos.add(detailOrderInfo);

                    DetailDateByWorkbench detailDateByWorkbench = new DetailDateByWorkbench();
                    detailDateByWorkbench.setId(UUID.randomUUID());
                    detailDateByWorkbench.setDetailDateStart(null);
                    detailDateByWorkbench.setDetailDateEnd(null);
                    detailDateByWorkbench.setSetting(false);
                    detailDateByWorkbench.setWorkBench(detailInfos.get(k).getWorkBenches());
                    detailDateByWorkbench.setPriority(k);
                    detailDateByWorkbenches.add(detailDateByWorkbench);
                }
                detailOrderList.setDetailDateByWorkbench(detailDateByWorkbenches);
                detailOrderList.setDetailOrderInfos(detailOrderInfos);
                detailOrderListService.saveDetailOrderList(detailOrderList);
                detailOrderLists.add(detailOrderList);
            }
            detailOrder.setDetailOrderLists(detailOrderLists);
            detailsOrder.setDetailOrder(detailOrder);
            detailOrderService.saveDetailOrder(detailOrder);

            detailsOrder.setCount(Integer.parseInt(countDetail.get(i)));
            detailsOrders.add(detailsOrder);
            increment++;
        }
        order.setDetailsOrders(detailsOrders);

        oldOrderService.deleteOldOrder(order.getNumberOrder());
        oldOrderService.fillOldOrderByOrder(order);
        orderService.saveOrder(order);
        return "redirect:/orders/" + id;
    }

    /**
     * Страница удаления заказа или деталей заказа метод GET
     *
     * @param id    Идентификатор заказа
     * @param model Модель
     * @return Cтраница удаления заказа или деталей заказа
     */
    @GetMapping("orders/deletion/{id}")
    public String deletionElementOrOrder(@PathVariable(value = "id") String id, Model model) {
        model.addAttribute("order", orderService.getOrderById(UUID.fromString(id)));
        model.addAttribute("user", userService.getUserWeb());
        return "deletionOrder";
    }

    /**
     * Страница удаления заказа метод POST
     *
     * @param id Идентификатор заказа
     * @return Страница всех заказов
     */
    @PostMapping("/orders/deletion/{id}")
    public String deleteOrderPost(@PathVariable(value = "id") String id) {
        Order order = orderService.getOrderById(UUID.fromString(id));
        oldOrderService.deleteOldOrder(order.getNumberOrder());
        orderService.deleteOrder(order);
        return "redirect:/orders";
    }

    /**
     * Страница удаления деталей из заказа метод POST
     *
     * @param id        Идентификатор заказа
     * @param increment Номер детали
     * @return Страница всех заказов
     */
    @PostMapping("/orders/deletion/{id}/{increment}")
    public String deleteElementFromOrderPost(@PathVariable(value = "id") String id,
                                             @PathVariable(value = "increment") int increment) {
        Order order = orderService.getOrderById(UUID.fromString(id));
        List<DetailsOrder> detailsOrders = order.getDetailsOrders();
        detailsOrders.remove(increment);
        for (int i = 0; i < detailsOrders.size(); i++) {
            detailsOrders.get(i).setIncrement(i);
        }
        order.setDetailsOrders(detailsOrders);
        oldOrderService.deleteOldOrder(order.getNumberOrder());
        oldOrderService.fillOldOrderByOrder(order);
        orderService.saveOrder(order);
        return "redirect:/orders";
    }

    /**
     * Страница расчета заказа метод GET
     *
     * @param id    Идентификатор заказа
     * @param model Модель
     * @return Страница расчета
     */
    @GetMapping("orders/calculationOrder/{id}")
    public String calculationOrder(@PathVariable(value = "id") String id, Model model) {
        OrderDto orderDto = orderService.getOrderDtoById(UUID.fromString(id));
        List<DetailsOrderDto> detailsOrders = orderDto.getDetailsOrders();

        List<Integer> incr = new ArrayList<>();
        for (int i = 0; i < detailsOrders.size(); i++) {
            incr.add(i);
        }
        model.addAttribute("order", orderDto);
        model.addAttribute("incr", incr);
        model.addAttribute("user", userService.getUserWeb());
        return "calculationOrder";
    }


    /**
     * Страница расчета заказа метод POST
     *
     * @param id Идентификатор заказа
     * @return Страница заказа
     */
    @PostMapping("orders/calculationOrder/{id}")
    public String calculationOrder(@PathVariable(value = "id") String id,
                                   @RequestParam(required = true) List<String> detailId,
                                   @RequestParam(required = true) List<String> increment) {
        Order order = orderService.getOrderById(UUID.fromString(id));
        if (!order.isCalculated()) {
            List<DetailsOrder> detailsOrders = order.getDetailsOrders();
            for (int i = 0; i < detailsOrders.size(); i++) {
                DetailsOrder detailsOrder = detailsOrders.get(i);
                if (detailsOrder.getId().equals(UUID.fromString(detailId.get(i)))) {
                    detailsOrder.setIncrement(Integer.parseInt(increment.get(i)));
                }
            }
            orderService.saveOrder(order);
            orderService.raschet(order);
        }
        return "redirect:/orders/calculationOrder/" + id;
    }

    public void allModel(Model model) {
        model.addAttribute("contragents", contragentService.getAllContragents());
        model.addAttribute("managers", userService.getManagers());
        model.addAttribute("details", detailService.getAllDetails());
    }

    /**
     * Страница всех завершенных заказов
     *
     * @param model Модель
     * @return Страница всех завершенных заказов
     */
    @GetMapping("/completed_orders")
    public String getAllCompletedOrders(Model model) {
        model.addAttribute("completed_order", completedOrderService.getAllCompletedOrders());
        model.addAttribute("user", userService.getUserWeb());
        return "completedOrders";
    }

    /**
     * Удаление завершенных заказов
     *
     * @param model Модель
     * @return Страница всех завершенных заказов
     */
    @PostMapping("/completed_orders")
    public String deleteCompletedOrdersByUpdateDate(Model model) {
        completedOrderService.deleteCompletedOrderByUpdateDate();
        return "redirect:/completed_orders";
    }

    /**
     * Перенос заказа в завершенные заказы
     *
     * @param id    Идентификатор заказа
     * @param model Модель
     * @return Страница всех заказов
     */
    @PostMapping("orders/{id}")
    public String completeOrder(@PathVariable(value = "id") String id, Model model) {
        completedOrderService.saveCompletedOrder(orderService.getOrderById(UUID.fromString(id)));
        return "redirect:/orders";
    }

    /**
     * Страница завершенного заказа
     *
     * @return Страница завершенного заказа
     */
    @GetMapping("completed_orders/{id}")
    public String getOneCompletedOrder(@PathVariable(value = "id") String id, Model model) {
        model.addAttribute("completed_order", completedOrderService.getCompleteOrderDto(UUID.fromString(id)));
        model.addAttribute("user", userService.getUserWeb());
        return "oneCompletedOrders";
    }

    /**
     * Откатить заказ после расчета
     *
     * @param id Идентификатор заказа
     */
    @PostMapping("orders/rollback/{id}")
    public String rollbackCalculateOrder(@PathVariable(value = "id") String id, Model model) {
        Order order = orderService.getOrderById(UUID.fromString(id));
        OrderDto orderDto = orderService.getOrderDtoById(UUID.fromString(id));
        List<Map<String, Object>> call = db.call("select max(increment) from orders");
        long maxIncrement = (long) call.get(0).get("max");
        if (maxIncrement == order.getIncrement()) {
            oldOrderService.fillOrderByOldOrder(UUID.fromString(id), order);
        } else {
            model.addAttribute("order", orderDto);
            model.addAttribute("user", userService.getUserWeb());
            model.addAttribute("errorRollback", "Откатить можео только последний");
            return "calculationOrder";
        }
        return "redirect:/orders/calculationOrder/" + id;
    }

    /**
     * Сохранение последовательности деталей
     *
     * @param id         Идентификатор заказа
     * @param isSelected Выбранные детали
     */
    @PostMapping("orders/select/{id}")
    public String selectCalculateOrder(@PathVariable(value = "id") String id, @RequestParam(required = true) List<String> isSelected, Model model) {
        Order order = orderService.getOrderById(UUID.fromString(id));
        List<DetailsOrder> detailsOrders = order.getDetailsOrders();
        for (String s : isSelected) {
            UUID detailListId = UUID.fromString(s);
            for (DetailsOrder detailsOrder : detailsOrders) {
                List<DetailOrderList> detailOrderLists = detailsOrder.getDetailOrder().getDetailOrderLists();
                for (DetailOrderList detailOrderList : detailOrderLists) {
                    if (detailOrderList.getId().equals(detailListId)) {
                        detailOrderList.setSelected(true);
                        break;
                    }
                }
            }
        }
        List<DetailsOrder> detailsOrder = order.getDetailsOrders();
        for (DetailsOrder value : detailsOrder) {
            List<DetailOrderList> detailOrderLists = value.getDetailOrder().getDetailOrderLists();
            DetailOrderList.removeIf(detailOrderLists);
        }
        orderService.saveOrder(order);
        return "redirect:/orders/calculationOrder/" + id;
    }
}
