package com.example.pozhiloyproject.controllers;

import com.example.pozhiloyproject.models.Detail;
import com.example.pozhiloyproject.models.DetailInfo;
import com.example.pozhiloyproject.models.Order;
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
      @RequestParam(required = true) String detailName,
      @RequestParam(required = true) String countDetail,
      @RequestParam(required = true) String dateStart,
      @RequestParam(required = true) String detailName1,
      @RequestParam(required = true) String countDetail1,
      @RequestParam(required = true) String dateStart1,
      @RequestParam(required = true) String detailName2,
      @RequestParam(required = true) String countDetail2,
      @RequestParam(required = true) String dateStart2,
      @RequestParam(required = true) String comment,
      Model model
  ) {
    Order order = new Order();
    Order order1 = null;
    try {
      order1 = orderService.findOneOrder(Integer.parseInt(numberOrder));
    } catch (NumberFormatException e) {
      e.printStackTrace();
    }
    if (order1 != null) {
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
    List<String> details = Stream.of(detailName, detailName1, detailName2).collect(Collectors.toList());
    List<Integer> countDetails = new ArrayList<>();
    List<String> counts = Arrays.asList(countDetail, countDetail1, countDetail2);
    for (String s : counts) {
      if (s.equals("")) {
        countDetails.add(0);
      } else {
        countDetails.add(Integer.parseInt(s));
      }
    }
    List<LocalDateTime> times = new ArrayList<>();
    List<String> time = Arrays.asList(dateStart, dateStart1, dateStart2);
    for (String s : time) {
      if (s.equals("")) {
        times.add(null);
      } else {
        times.add(LocalDateTime.parse(s));
      }
    }
    List<DetailInfo> list = new ArrayList<>();

    for (int i = 0; i < times.size(); i++) {
      DetailInfo detailInfo = new DetailInfo();
      detailInfo.setIncrement(i);
      detailInfo.setId(UUID.randomUUID());
      detailInfo.setDateStart(times.get(i));
      if (details.get(i).equals("Выбирите деталь") && countDetails.get(i) == 0) {
        continue;
      } else {
        detailInfo.setDetail(detailService.findByName(details.get(i)));
        detailInfo.setCount(countDetails.get(i));
        detailInfoService.save(detailInfo);
      }
      list.add(detailInfo);
    }
    order.setDetailInfos(list);

    orderService.saveOrder(order);
    return "redirect:/orders";
  }


  @GetMapping("/orders/change/{numberOrder}")
  public String changeOrderGet(@PathVariable(value = "numberOrder") int numberOrder, Model model) {
    model.addAttribute("contragents", contragentService.getAllContragents());
    model.addAttribute("managers", managerService.getAllManagers());
    model.addAttribute("details", detailService.getAllDetails());
    model.addAttribute("order", orderService.findOneOrder(numberOrder));
    return "changeOrder";
  }

  @PostMapping("/orders/change/{numberOrder}")
  public String changeOrderPost(@PathVariable(value = "numberOrder") int numberOrder,
      @RequestParam(required = true) String[] detailName,
      @RequestParam(required = true) int[] countDetail
  ) {

    Order order = orderService.findOneOrder(numberOrder);
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
  public String addNewElementForOrderGet(@PathVariable(value = "numberOrder") int numberOrder, Model model) {
    model.addAttribute("contragents", contragentService.getAllContragents());
    model.addAttribute("managers", managerService.getAllManagers());
    model.addAttribute("details", detailService.getAllDetails());
    model.addAttribute("order", orderService.findOneOrder(numberOrder));
    return "addNewElementForOrder";
  }


  @PostMapping("/orders/add/{numberOrder}")
  public String addNewElementForOrderPost(@RequestParam(required = true) int numberOrder,
      @RequestParam(required = true) String detailName,
      @RequestParam(required = true) String countDetail,
      @RequestParam(required = true) String dateStart,
      @RequestParam(required = true) String comment, Model model
  ) {
    Order order = orderService.findOneOrder(numberOrder);
    List<DetailInfo> detailInfos = order.getDetailInfos();
    int increment = detailInfos.size();
    if (detailName.equals("Выбирите деталь")) {
      allModel(model);
      model.addAttribute("order", orderService.findOneOrder(numberOrder));
      model.addAttribute("detailError", "Не выбрана деталь!");
      return "addNewElementForOrder";
    }
    if (countDetail.equals("")) {
      allModel(model);
      model.addAttribute("order", orderService.findOneOrder(numberOrder));
      model.addAttribute("countDetailError", "Не может быть пустым!");
      return "addNewElementForOrder";
    }

    DetailInfo detailInfo = new DetailInfo();
    detailInfo.setIncrement(increment);
    detailInfo.setId(UUID.randomUUID());
    detailInfo.setDetail(detailService.findByName(detailName));
    detailInfo.setCount(Integer.parseInt(countDetail));
    detailInfo.setDateStart(dateStart.equals("") ? null : LocalDateTime.parse(dateStart));
    detailInfos.add(detailInfo);
    order.setDetailInfos(detailInfos);
    order.setComment(comment.equals("") ? order.getComment() : "; " + comment);
    orderService.saveOrder(order);
    return "redirect:/orders";
  }

  @PostMapping("/orders/{numberOrder}")
  public String deleteOrderPost(@PathVariable(value = "numberOrder") int numberOrder) {
    orderService.deleteOrderByNumberOrder(numberOrder);
    return "redirect:/orders";
  }

  @PostMapping("/orders/{numberOrder}/{increment}")
  public String deleteElementFromOrderPost(@PathVariable(value = "numberOrder") int numberOrder,
      @PathVariable(value = "increment") int increment) {
    Order order = orderService.findOneOrder(numberOrder);
    List<DetailInfo> detailInfos = order.getDetailInfos();
    detailInfos.remove(increment);
    for (int i = 0; i < detailInfos.size(); i++) {
      detailInfos.get(i).setIncrement(i);
    }
    order.setDetailInfos(detailInfos);
    orderService.saveOrder(order);
    return "redirect:/orders";
  }

//    @PostMapping("/check/{detailName}")
//    public String checkWorkBench(@PathVariable(value = "detailName") String detailName){
//        return "check";
//    }


  @PostMapping("orders/check1/{numberOrder}")
  public String check1(@PathVariable(value = "numberOrder") int numberOrder) {
    System.out.println("");
    orderService.raschet(numberOrder);
    return "redirect:/orders/check1/" + numberOrder;
  }

  @GetMapping("orders/check1/{numberOrder}")
  public String check1(@PathVariable(value = "numberOrder") int numberOrder, Model model) {
    Order oneOrder = orderService.findOneOrder(numberOrder);

    model.addAttribute("order", orderService.findOneOrder(numberOrder));
    return "check1";
  }

  @GetMapping("orders/deletion/{numberOrder}")
  public String deletionElementOrOrder(@PathVariable(value = "numberOrder") int numberOrder, Model model) {
    model.addAttribute("order", orderService.findOneOrder(numberOrder));
    return "deletionOrder";
  }

  public void allModel(Model model) {
    model.addAttribute("contragents", contragentService.getAllContragents());
    model.addAttribute("managers", managerService.getAllManagers());
    model.addAttribute("details", detailService.getAllDetails());
  }
}
