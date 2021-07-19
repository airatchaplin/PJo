package com.example.pozhiloyproject.controllers;

import com.example.pozhiloyproject.models.Detail;
import com.example.pozhiloyproject.models.Order;
import com.example.pozhiloyproject.services.OrderService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class Rest {

    final OrderService detailService;

    public Rest(OrderService detailService) {
        this.detailService = detailService;
    }


    @GetMapping("/rest")
    public List<Order> get(){
        return detailService.getAllOrders();
    }
}
