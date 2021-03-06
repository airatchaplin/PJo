package com.example.pozhiloyproject.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.Comparator;
import java.util.List;
import java.util.UUID;

@Getter
@Setter
public class DetailsOrderDto {

    /**
     * Id
     */
    private UUID id;

    /**
     * Колличество детали
     */
    private int count;

    /**
     * Деталь
     */
    private DetailOrderDto detailOrder;

    /**
     * Последовательность
     */
    private int increment;

    public static List<DetailsOrderDto> comparePriority(List<DetailsOrderDto> detailsOrderDtos) {
        Comparator<DetailsOrderDto> comparator = Comparator.comparing(DetailsOrderDto::getIncrement);
        detailsOrderDtos.sort(comparator);
        return detailsOrderDtos;
    }
}
