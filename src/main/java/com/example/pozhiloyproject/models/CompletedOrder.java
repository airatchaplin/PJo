package com.example.pozhiloyproject.models;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;
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
     * ID
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
     * Детали в заказе
     */
    @ManyToMany(cascade = CascadeType.ALL)
    private List<DetailsOrder> detailInfos;

    /**
     * Дата запуска в производство
     */
    private LocalDateTime dateStart;

    /**
     * Дата завершения заказа
     */
    private LocalDateTime dateEnd;

    /**
     * Комментарий
     */
    private String comment;

}
