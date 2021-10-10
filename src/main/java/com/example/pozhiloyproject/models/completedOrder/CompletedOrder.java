package com.example.pozhiloyproject.models.completedOrder;

import com.example.pozhiloyproject.models.Contragent;
import com.example.pozhiloyproject.models.DetailsOrder;
import com.example.pozhiloyproject.models.Order;
import com.example.pozhiloyproject.models.User;
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
    private List<CompletedDetailsOrder> detailsOrders;


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

    private LocalDateTime updateDate;

    public static List<Order> compareIncrement(List<Order> orderList) {
        Comparator<Order> comparator = Comparator.comparing(Order::getIncrement);
        orderList.sort(comparator);
        return orderList;
    }

}
