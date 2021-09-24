package com.example.pozhiloyproject.controllers;

import com.example.pozhiloyproject.dto.DetailDto;
import com.example.pozhiloyproject.models.*;
import com.example.pozhiloyproject.services.*;

import java.util.ArrayList;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

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
        model.addAttribute("order", orderService.getOrderById(UUID.fromString(id)));
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
     * @param dateStart    Дата запуска в производство
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
                               @RequestParam(required = true) List<String> dateStart,
                               @RequestParam(required = true) String comment,
                               Model model
    ) {
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
        List<LocalDateTime> timesList = new ArrayList<>();

        if (dateStart.isEmpty()) {
            for (int i = 0; i < countDetailList.size(); i++) {
                timesList.add(null);
            }
        } else {

            for (String s : dateStart) {
                if (s.equals("")) {
                    timesList.add(null);
                } else {
                    timesList.add(LocalDateTime.parse(s));
                }

            }
        }
        List<DetailsOrder> list = new ArrayList<>();
        List<Boolean> isCalculated = null;

        for (int i = 0; i < timesList.size(); i++) {
            DetailsOrder detailsOrder = new DetailsOrder();
            detailsOrder.setId(UUID.randomUUID());
            detailsOrder.setIncrement(i);
            detailsOrder.setDateStart(timesList.get(i));
            if (detailId.get(i).equals("Выбирите деталь") && countDetailList.get(i) == 0) {
                continue;
            } else {
                detailsOrder.setDetail(detailService.getDetailById(UUID.fromString(detailId.get(i))));
                isCalculated = new ArrayList<>();
//                for (WorkBench workBench : detailService.getDetailById(UUID.fromString(detailId.get(i))).getWorkBenches()) {
//                    isCalculated.add(false);
//                }
                detailsOrder.setIsCalculated(isCalculated);
                detailsOrder.setCount(countDetailList.get(i));
                detailInfoService.saveDetailInfo(detailsOrder);
            }
            list.add(detailsOrder);
        }

        order.setDetailsOrders(list);
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
                                  @RequestParam(required = true) String minutesPacking) {

        Order order = orderService.getOrderById(UUID.fromString(id));
        String packing = String.format("%1$s/%2$s/%3$s/%4$s", weeksPacking, daysPacking, hoursPacking, minutesPacking);
        String painting = String.format("%1$s/%2$s/%3$s/%4$s", weeksPaiting, daysPaiting, hoursPaiting, minutesPaiting);
        order.setPacking(packing);
        order.setPainting(painting);
        for (int i = 0; i < detailId.size(); i++) {
            if (!detailId.get(i).contains("Выбранная: ")) {
                order.getDetailsOrders().get(i).setDetail(detailService.getDetailById(UUID.fromString((detailId.get(i).replace("Выбранная: ", "")))));
            }
            order.getDetailsOrders().get(i).setCount(countDetail.get(i));
        }
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
        model.addAttribute("details", detailService.getAllDetails());
        model.addAttribute("order", orderService.getOrderById(UUID.fromString(id)));
        model.addAttribute("user", userService.getUserWeb());
        return "addNewElementForOrder";
    }

    /**
     * Страница добавления детали к заказу метод POST
     *
     * @param numberOrder Номер заказа
     * @param detailId    Идентификатор детали
     * @param countDetail Количество детаелй
     * @param dateStart   Дата запуска в производство
     * @param comment     Комментарий
     * @param model       Модель
     * @return Страница всех заказов
     */
    @PostMapping("/orders/add/{id}")
    public String addNewElementForOrderPost(@RequestParam(required = true) String numberOrder,
                                            @RequestParam(required = true) List<String> detailId,
                                            @RequestParam(required = true) List<String> countDetail,
                                            @RequestParam(required = true) List<String> dateStart,
                                            @RequestParam(required = true) String comment, Model model
    ) {
        Order order = orderService.getOrderByNumber(Integer.parseInt(numberOrder));
        List<DetailsOrder> detailsOrders = order.getDetailsOrders();
        int increment = detailsOrders.size();
        for (int i = 0; i < detailId.size(); i++) {
            if (detailId.get(i).equals("Выбирите деталь")) {
                allModel(model);
                model.addAttribute("order", orderService.getOrderByNumber(Integer.parseInt(numberOrder)));
                model.addAttribute("detailError", "Не выбрана деталь!");
                return "addNewElementForOrder";
            }
            if (countDetail.get(i).equals("")) {
                allModel(model);
                model.addAttribute("order", orderService.getOrderByNumber(Integer.parseInt(numberOrder)));
                model.addAttribute("countDetailError", "Не может быть пустым!");
                return "addNewElementForOrder";
            }

            DetailsOrder detailsOrder = new DetailsOrder();
            detailsOrder.setIncrement(increment);
            detailsOrder.setId(UUID.randomUUID());
            detailsOrder.setDetail(detailService.getDetailById(UUID.fromString(detailId.get(i))));
            detailsOrder.setCount(Integer.parseInt(countDetail.get(i)));
            detailsOrder.setDateStart(dateStart.get(i).equals("") ? null : LocalDateTime.parse(dateStart.get(i)));

            List<Boolean> isCalculated = new ArrayList<>();
//            for (int j = 0; j < detailsOrder.getDetail().getWorkBenches().size(); j++) {
//                isCalculated.add(false);
//            }
            detailsOrder.setIsCalculated(isCalculated);
            detailsOrders.add(detailsOrder);
            increment++;
        }
        order.setDetailsOrders(detailsOrders);
        order.setComment(comment.equals("") ? order.getComment() : "; " + comment);
        orderService.saveOrder(order);
        return "redirect:/orders";
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
        orderService.deleteOrder(orderService.getOrderById(UUID.fromString(id)));
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
        model.addAttribute("order", orderService.getOrderById(UUID.fromString(id)));
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
    public String calculationOrder(@PathVariable(value = "id") String id) {
        orderService.raschet(UUID.fromString(id));
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
     * @param model
     * @return Страница завершенного заказа
     */
    @GetMapping("completed_orders/{id}")
    public String getOneCompletedOrder(@PathVariable(value = "id") String id, Model model) {
        model.addAttribute("completed_order", completedOrderService.getOneCompletedOrderById(UUID.fromString(id)));
        model.addAttribute("user", userService.getUserWeb());
        return "oneCompletedOrders";
    }
}
