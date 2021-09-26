package com.example.pozhiloyproject.models;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Set;
import java.util.UUID;

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
}
