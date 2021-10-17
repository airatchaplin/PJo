package com.example.pozhiloyproject.dto;

import lombok.Getter;
import lombok.Setter;

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

    private String dateStartFirstPackage;

    private String dateEndFirstPackage;

    private String dateStartPainting;

    private String dateEndPainting;

    private String dateStartSecondPackage;

    private String dateEndSecondPackage;

    private String dateEnd;

    private boolean isCalculated;

    public static List<OrderDto> compareIncrement(List<OrderDto> orderList) {
        Comparator<OrderDto> comparator = Comparator.comparing(OrderDto::getIncrement);
        orderList.sort(comparator);
        return orderList;
    }

}
