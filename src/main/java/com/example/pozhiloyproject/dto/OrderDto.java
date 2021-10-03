package com.example.pozhiloyproject.dto;

import com.example.pozhiloyproject.models.Contragent;
import com.example.pozhiloyproject.models.DetailsOrder;
import com.example.pozhiloyproject.models.Order;
import com.example.pozhiloyproject.models.User;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.CascadeType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Comparator;
import java.util.List;
import java.util.UUID;

@Getter
@Setter
public class OrderDto {


    /**
     * Id
     */
    private UUID id;

    long increment;

    /**
     * Номер заказа
     */
    private int numberOrder;

    /**
     * Контрагент
     */

    private String objectName;

    /**
     * Менеджер
     */
    private String manager;

    /**
     * Экономист
     */
    private String economist;

    /**
     * Список деталей в заказе
     */

    private List<DetailsOrderDto> detailsOrders;


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
    private String dateStartOrder;

    /**
     * Дата заверешнения
     */
    private String dateEndOrder;

    private boolean isCalculated;

    public static List<Order> compareIncrement(List<Order> orderList) {
        Comparator<Order> comparator = Comparator.comparing(Order::getIncrement);
        orderList.sort(comparator);
        return orderList;
    }

}
