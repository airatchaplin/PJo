package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.models.Order;
import com.example.pozhiloyproject.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService {

    @Autowired
    OrderRepository orderRepository;

    public List<Order> getAllOrders() {
        return orderRepository.findAll();
    }

    public void saveOrder(Order order) {
        orderRepository.save(order);
    }

    public Order findOneOrder(int numberOrder) {
        return orderRepository.findByNumberOrder(numberOrder);
    }

    public void deleteOrderByNumberOrder(int numberOrder){
        Order order = orderRepository.findByNumberOrder(numberOrder);
        orderRepository.delete(order);
    }
}
