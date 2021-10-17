package com.example.pozhiloyproject.models;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Comparator;
import java.util.List;
import java.util.UUID;

import com.example.pozhiloyproject.models.detail.DetailsOrder;
import lombok.Getter;
import lombok.Setter;

/**
 * Заказ
 */
@Entity
@Table(name = "orders")
@Getter
@Setter
public class Order {

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

    private LocalDateTime dateStartFirstPackage;

    private LocalDateTime dateEndFirstPackage;

    private LocalDateTime dateStartPainting;

    private LocalDateTime dateEndPainting;

    private LocalDateTime dateStartSecondPackage;

    private LocalDateTime dateEndSecondPackage;

    private LocalDateTime dateEnd;

    private boolean isCalculated;

    public static List<Order> compareIncrement(List<Order> orderList) {
        Comparator<Order> comparator = Comparator.comparing(Order::getIncrement);
        orderList.sort(comparator);
        return orderList;
    }

    public static List<DetailsOrder> compareIncrementDetailsOrder(List<DetailsOrder> detailsOrders) {
        Comparator<DetailsOrder> comparator = Comparator.comparing(DetailsOrder::getIncrement);
        detailsOrders.sort(comparator);
        return detailsOrders;
    }
}
