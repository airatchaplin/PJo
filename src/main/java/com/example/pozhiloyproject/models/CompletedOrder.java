package com.example.pozhiloyproject.models;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Comparator;
import java.util.List;
import java.util.UUID;

/**
 * Завершенные заказы
 */
@Entity
@Table(name = "completed_orders")
@Getter
@Setter
public class CompletedOrder {

    /**
     * Id
     */
    @Id
    private UUID id;

    long increment;

    /**
     * Номер заказа
     */
    private int numberOrder;

    /**
     * Контрагент
     */
    @ManyToOne
    private Contragent objectName;

    /**
     * Менеджер
     */
    @ManyToOne
    private User manager;

    /**
     * Экономист
     */
    @ManyToOne
    private User economist;

    /**
     * Список деталей в заказе
     */
    @ManyToMany(cascade = CascadeType.ALL)
    private List<DetailsOrder> detailsOrders;


    /**
     * Комментарий
     */
    private String comment;

    /**
     * Упаковка
     */
    private String packing;

    /**
     * Покраска
     */
    private String painting;


    /**
     * Дата запуска в производство
     */
    private LocalDateTime dateStartOrder;

    /**
     * Дата заверешнения
     */
    private LocalDateTime dateEndOrder;

    private boolean isCalculated;

    public static List<Order> compareIncrement(List<Order> orderList) {
        Comparator<Order> comparator = Comparator.comparing(Order::getIncrement);
        orderList.sort(comparator);
        return orderList;
    }

}
