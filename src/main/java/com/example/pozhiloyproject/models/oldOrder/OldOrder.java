package com.example.pozhiloyproject.models.oldOrder;

import com.example.pozhiloyproject.models.Contragent;
import com.example.pozhiloyproject.models.DetailsOrder;
import com.example.pozhiloyproject.models.Order;
import com.example.pozhiloyproject.models.User;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Entity
@Table
@Getter
@Setter
public class OldOrder {

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
    private List<OldDetailsOrder> detailsOrders;


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

    UUID orderId;
}
