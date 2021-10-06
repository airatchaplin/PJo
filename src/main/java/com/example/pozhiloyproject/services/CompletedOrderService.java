package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.models.CompletedOrder;
import com.example.pozhiloyproject.models.Order;
import com.example.pozhiloyproject.repository.CompletedOrderRepository;
import com.example.pozhiloyproject.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

/**
 * Сервис заказов
 */
@Service
public class CompletedOrderService {

    /**
     * Репозиторий завершенных заказов
     */
    @Autowired
    CompletedOrderRepository completedOrderRepository;

    /**
     * Репозиторий заказов
     */
    @Autowired
    OrderRepository orderRepository;

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
        completedOrder.setDetailsOrders(order.getDetailsOrders());
        completedOrder.setDateStartOrder(order.getDateStartOrder());
        completedOrder.setDateEndOrder(order.getDateEndOrder());
        completedOrder.setComment(order.getComment());
        completedOrder.setCalculated(order.isCalculated());
        completedOrder.setEconomist(order.getEconomist());
        completedOrder.setIncrement(order.getIncrement());
        completedOrder.setPacking(order.getPacking());
        completedOrder.setPainting(order.getPainting());

        completedOrderRepository.save(completedOrder);

        orderRepository.delete(order);
    }

    /**
     * Получить список всех завершенных заказов
     *
     * @return Список всех завершенных заказов
     */
    public List<CompletedOrder> getAllCompletedOrders() {
        return completedOrderRepository.findAll();
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

}
