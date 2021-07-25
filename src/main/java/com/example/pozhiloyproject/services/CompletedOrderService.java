package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.models.CompletedOrder;
import com.example.pozhiloyproject.models.Order;
import com.example.pozhiloyproject.repository.CompletedOrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CompletedOrderService {

    @Autowired
    CompletedOrderRepository completedOrderRepository;

    public void saveCompletedOrder(Order order){
        CompletedOrder completedOrder = new CompletedOrder();
        completedOrder.setId(order.getId());
        completedOrder.setNumberOrder(order.getNumberOrder());
        completedOrder.setObjectName(order.getObjectName());
        completedOrder.setManager(order.getManager());
        completedOrder.setDetailInfos(order.getDetailInfos());
        completedOrder.setDateStart(order.getDateStart());
        completedOrder.setDateEnd(order.getDateEnd());
        completedOrder.setComment(order.getComment());
        completedOrderRepository.save(completedOrder);
    }

    public List<CompletedOrder> getAllCompletedOrders(){
        return completedOrderRepository.findAll();
    }

    public CompletedOrder findOneCompletedOrder(int numberOrder){
        return completedOrderRepository.findByNumberOrder(numberOrder);
    }
}
