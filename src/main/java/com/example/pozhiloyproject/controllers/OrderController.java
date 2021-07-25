package com.example.pozhiloyproject.controllers;

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

@Controller
public class OrderController {

    @Autowired
    OrderService orderService;

    @Autowired
    DetailService detailService;

    @Autowired
    ContragentService contragentService;

    @Autowired
    ManagerService managerService;

    @Autowired
    DetailInfoService detailInfoService;

    @Autowired
    CompletedOrderService completedOrderService;


    @GetMapping("/orders")
    public String getAllOrders(Model model) {
        model.addAttribute("orders", orderService.getAllOrders());
        return "orders";
    }

    @GetMapping("/orders/{numberOrder}")
    public String getOneOrder(@PathVariable(value = "numberOrder") int numberOrder, Model model) {
        Order oneOrder = orderService.findOneOrder(numberOrder);

        model.addAttribute("order", orderService.findOneOrder(numberOrder));
        return "oneOrder";
    }

    @GetMapping("/addOrder")
    public String addOrderGet(Model model) {
        model.addAttribute("contragents", contragentService.getAllContragents());
        model.addAttribute("managers", managerService.getAllManagers());
        model.addAttribute("details", detailService.getAllDetails());
        return "addOrder";
    }


    @PostMapping("/addOrder")
    public String addOrderPost(@RequestParam(required = false) String numberOrder,
                               @RequestParam(required = true) String objectName,
                               @RequestParam(required = true) String manager,
                               @RequestParam(required = true) List<String> detailName,
                               @RequestParam(required = true) List<String> countDetail,
                               @RequestParam(required = true) List<String> dateStart,
                               @RequestParam(required = true) String comment,

                               Model model
    ) {
        Order order = new Order();
        Order findOrder = null;
        CompletedOrder findCompletedOrder = null;
        try {
            findOrder = orderService.findOneOrder(Integer.parseInt(numberOrder));
            findCompletedOrder = completedOrderService.findOneCompletedOrder(Integer.parseInt(numberOrder));
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        if (findOrder != null || findCompletedOrder != null) {
            model.addAttribute("contragents", contragentService.getAllContragents());
            model.addAttribute("managers", managerService.getAllManagers());
            model.addAttribute("details", detailService.getAllDetails());
            model.addAttribute("numberOrderError", "Заказ с таким номером уже существует!");
            return "addOrder";
        }
        order.setId(UUID.randomUUID());
        order.setNumberOrder(Integer.parseInt(numberOrder));
        order.setObjectName(contragentService.getOneContragent(objectName));
        order.setManager(managerService.getOneManager(manager.substring(0, manager.length() - 5)));
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
            if (detailName.get(i).equals("Выбирите деталь") && countDetailList.get(i) == 0) {
                continue;
            } else {
                detailInfo.setDetail(detailService.findByName(detailName.get(i)));
                isCalculated = new ArrayList<>();
                for (WorkBench workBench : detailService.findByName(detailName.get(i)).getWorkBenches()) {
                    isCalculated.add(false);
                }
                detailInfo.setIsCalculated(isCalculated);
                detailInfo.setCount(countDetailList.get(i));
                detailInfoService.save(detailInfo);
            }
            list.add(detailInfo);
        }

        order.setDetailInfos(list);
        orderService.saveOrder(order);
        return "redirect:/orders";
    }


    @GetMapping("/orders/change/{numberOrder}")
    public String changeOrderGet(@PathVariable(value = "numberOrder") String numberOrder, Model model) {
        model.addAttribute("contragents", contragentService.getAllContragents());
        model.addAttribute("managers", managerService.getAllManagers());
        model.addAttribute("details", detailService.getAllDetails());
        model.addAttribute("order", orderService.findOneOrder(Integer.parseInt(numberOrder)));
        return "changeOrder";
    }

    @PostMapping("/orders/change/{numberOrder}")
    public String changeOrderPost(@PathVariable(value = "numberOrder") String numberOrder,
                                  @RequestParam(required = true) String[] detailName,
                                  @RequestParam(required = true) int[] countDetail
    ) {

        Order order = orderService.findOneOrder(Integer.parseInt(numberOrder));
        for (int i = 0; i < detailName.length; i++) {
            if (!detailName[i].contains("Выбранная: ")) {
                order.getDetailInfos().get(i).setDetail(detailService.findByName((detailName[i].replace("Выбранная: ", ""))));
            }
            order.getDetailInfos().get(i).setCount(countDetail[i]);
        }
        orderService.saveOrder(order);
        return "redirect:/orders/" + numberOrder;
    }

    @GetMapping("/orders/add/{numberOrder}")
    public String addNewElementForOrderGet(@PathVariable(value = "numberOrder") String numberOrder, Model model) {
        model.addAttribute("contragents", contragentService.getAllContragents());
        model.addAttribute("managers", managerService.getAllManagers());
        model.addAttribute("details", detailService.getAllDetails());
        model.addAttribute("order", orderService.findOneOrder(Integer.parseInt(numberOrder)));
        return "addNewElementForOrder";
    }


    @PostMapping("/orders/add/{numberOrder}")
    public String addNewElementForOrderPost(@RequestParam(required = true) String numberOrder,
                                            @RequestParam(required = true) List<String> detailName,
                                            @RequestParam(required = true) List<String> countDetail,
                                            @RequestParam(required = true) List<String> dateStart,
                                            @RequestParam(required = true) String comment, Model model
    ) {
        Order order = orderService.findOneOrder(Integer.parseInt(numberOrder));
        List<DetailInfo> detailInfos = order.getDetailInfos();
        int increment = detailInfos.size();
        for (int i = 0; i < detailName.size(); i++) {


            if (detailName.get(i).equals("Выбирите деталь")) {
                allModel(model);
                model.addAttribute("order", orderService.findOneOrder(Integer.parseInt(numberOrder)));
                model.addAttribute("detailError", "Не выбрана деталь!");
                return "addNewElementForOrder";
            }
            if (countDetail.get(i).equals("")) {
                allModel(model);
                model.addAttribute("order", orderService.findOneOrder(Integer.parseInt(numberOrder)));
                model.addAttribute("countDetailError", "Не может быть пустым!");
                return "addNewElementForOrder";
            }

            DetailInfo detailInfo = new DetailInfo();
            detailInfo.setIncrement(increment);
            detailInfo.setId(UUID.randomUUID());
            detailInfo.setDetail(detailService.findByName(detailName.get(i)));
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

    @PostMapping("/orders/{numberOrder}")
    public String deleteOrderPost(@PathVariable(value = "numberOrder") String numberOrder) {
        orderService.deleteOrderByNumberOrder(orderService.findOneOrder(Integer.parseInt(numberOrder)));
        return "redirect:/orders";
    }

    @PostMapping("/orders/{numberOrder}/{increment}")
    public String deleteElementFromOrderPost(@PathVariable(value = "numberOrder") String numberOrder,
                                             @PathVariable(value = "increment") int increment) {
        Order order = orderService.findOneOrder(Integer.parseInt(numberOrder));
        List<DetailInfo> detailInfos = order.getDetailInfos();
        detailInfos.remove(increment);
        for (int i = 0; i < detailInfos.size(); i++) {
            detailInfos.get(i).setIncrement(i);
        }
        order.setDetailInfos(detailInfos);
        orderService.saveOrder(order);
        return "redirect:/orders";
    }


    @PostMapping("orders/check1/{numberOrder}")
    public String check1(@PathVariable(value = "numberOrder") int numberOrder) {
        System.out.println("");
        orderService.raschet(numberOrder);
        return "redirect:/orders/check1/" + numberOrder;
    }

    @GetMapping("orders/check1/{numberOrder}")
    public String check1(@PathVariable(value = "numberOrder") String numberOrder, Model model) {
        model.addAttribute("order", orderService.findOneOrder(Integer.parseInt(numberOrder)));
        return "check1";
    }

    @GetMapping("orders/deletion/{numberOrder}")
    public String deletionElementOrOrder(@PathVariable(value = "numberOrder") String numberOrder, Model model) {
        model.addAttribute("order", orderService.findOneOrder(Integer.parseInt(numberOrder)));
        return "deletionOrder";
    }

    public void allModel(Model model) {
        model.addAttribute("contragents", contragentService.getAllContragents());
        model.addAttribute("managers", managerService.getAllManagers());
        model.addAttribute("details", detailService.getAllDetails());
    }

    @GetMapping("/completed_orders")
    public String getAllCompletedOrders(Model model) {
        model.addAttribute("completed_order", completedOrderService.getAllCompletedOrders());
        return "completedOrders";
    }

    @PostMapping("orders/complete/{numberOrder}")
    public String completeOrder(@PathVariable(value = "numberOrder") String numberOrder, Model model) {
        completedOrderService.saveCompletedOrder(orderService.findOneOrder(Integer.parseInt(numberOrder)));
        orderService.deleteOrderByNumberOrder(orderService.findOneOrder(Integer.parseInt(numberOrder)));
        return "redirect:/orders";
    }
}
