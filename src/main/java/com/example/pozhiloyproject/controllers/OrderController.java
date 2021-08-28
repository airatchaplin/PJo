package com.example.pozhiloyproject.controllers;

import com.example.pozhiloyproject.dto.DetailDto;
import com.example.pozhiloyproject.models.*;
import com.example.pozhiloyproject.services.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
    DetailInfoService detailInfoService;

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
        model.addAttribute("details",DetailDto.compareMaterialName( detailService.getAllDetails()));
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
        order.setManager(userService.getUserWeb());
        order.setPainting("00:00");
        order.setPacking("00:00");
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
        List<DetailInfo> list = new ArrayList<>();
        List<Boolean> isCalculated = null;

        for (int i = 0; i < timesList.size(); i++) {
            DetailInfo detailInfo = new DetailInfo();
            detailInfo.setId(UUID.randomUUID());
            detailInfo.setIncrement(i);
            detailInfo.setDateStart(timesList.get(i));
            if (detailId.get(i).equals("Выбирите деталь") && countDetailList.get(i) == 0) {
                continue;
            } else {
                detailInfo.setDetail(detailService.getDetailById(UUID.fromString(detailId.get(i))));
                isCalculated = new ArrayList<>();
                for (WorkBench workBench : detailService.getDetailById(UUID.fromString(detailId.get(i))).getWorkBenches()) {
                    isCalculated.add(false);
                }
                detailInfo.setIsCalculated(isCalculated);
                detailInfo.setCount(countDetailList.get(i));
                detailInfoService.saveDetailInfo(detailInfo);
            }
            list.add(detailInfo);
        }

        order.setDetailInfos(list);
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
        model.addAttribute("contragents", contragentService.getAllContragents());
        model.addAttribute("managers", userService.getManagers());
        model.addAttribute("details", detailService.getAllDetails());
        model.addAttribute("order", orderService.getOrderById(UUID.fromString(id)));
        model.addAttribute("user", userService.getUserWeb());
        return "changeOrder";
    }

    /**
     * Страница изменения заказа метод POST
     *
     * @param id          Идентификатор заказа
     * @param detailId    Идентификатор детали
     * @param countDetail Количество деталей
     * @param packing     Упаковка
     * @param painting    Покраска
     * @return Страница всех заказов
     */
    @PostMapping("/orders/change/{id}")
    public String changeOrderPost(@PathVariable(value = "id") String id,
                                  @RequestParam(required = true) List<String> detailId,
                                  @RequestParam(required = true) List<Integer> countDetail,
                                  @RequestParam(required = true) String packing,
                                  @RequestParam(required = true) String painting) {

        Order order = orderService.getOrderById(UUID.fromString(id));
        order.setPacking(packing);
        order.setPainting(painting);
        for (int i = 0; i < detailId.size(); i++) {
            if (!detailId.get(i).contains("Выбранная: ")) {
                order.getDetailInfos().get(i).setDetail(detailService.getDetailById(UUID.fromString((detailId.get(i).replace("Выбранная: ", "")))));
            }
            order.getDetailInfos().get(i).setCount(countDetail.get(i));
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
        List<DetailInfo> detailInfos = order.getDetailInfos();
        int increment = detailInfos.size();
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

            DetailInfo detailInfo = new DetailInfo();
            detailInfo.setIncrement(increment);
            detailInfo.setId(UUID.randomUUID());
            detailInfo.setDetail(detailService.getDetailById(UUID.fromString(detailId.get(i))));
            detailInfo.setCount(Integer.parseInt(countDetail.get(i)));
            detailInfo.setDateStart(dateStart.get(i).equals("") ? null : LocalDateTime.parse(dateStart.get(i)));

            List<Boolean> isCalculated = new ArrayList<>();
            for (int j = 0; j < detailInfo.getDetail().getWorkBenches().size(); j++) {
                isCalculated.add(false);
            }
            detailInfo.setIsCalculated(isCalculated);
            detailInfos.add(detailInfo);
            increment++;
        }
        order.setDetailInfos(detailInfos);
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
        List<DetailInfo> detailInfos = order.getDetailInfos();
        detailInfos.remove(increment);
        for (int i = 0; i < detailInfos.size(); i++) {
            detailInfos.get(i).setIncrement(i);
        }
        order.setDetailInfos(detailInfos);
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
    @GetMapping("orders/check1/{id}")
    public String check1(@PathVariable(value = "id") String id, Model model) {
        model.addAttribute("order", orderService.getOrderById(UUID.fromString(id)));
        model.addAttribute("user", userService.getUserWeb());
        return "check1";
    }

    /**
     * Страница расчета заказа метод POST
     *
     * @param id Идентификатор заказа
     * @return Страница заказа
     */
    @PostMapping("orders/check1/{id}")
    public String check1(@PathVariable(value = "id") String id) {
        orderService.raschet(Integer.parseInt(id));
        return "redirect:/orders/check1/" + id;
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
    @PostMapping("orders/complete/{id}")
    public String completeOrder(@PathVariable(value = "id") String id, Model model) {
        completedOrderService.saveCompletedOrder(orderService.getOrderById(UUID.fromString(id)));
        return "redirect:/orders";
    }
}
