package com.example.pozhiloyproject.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.Comparator;
import java.util.List;
import java.util.UUID;

@Getter
@Setter
public class CompletedOrderDto {

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

    public static List<CompletedOrderDto> compareIncrement(List<CompletedOrderDto> orderList) {
        Comparator<CompletedOrderDto> comparator = Comparator.comparing(CompletedOrderDto::getIncrement);
        orderList.sort(comparator);
        return orderList;
    }
}
