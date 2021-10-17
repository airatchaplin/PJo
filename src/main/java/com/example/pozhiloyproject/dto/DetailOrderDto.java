package com.example.pozhiloyproject.dto;

import com.example.pozhiloyproject.models.Material;
import lombok.Getter;
import lombok.Setter;

import java.util.List;
import java.util.UUID;

@Getter
@Setter
public class DetailOrderDto {

    private UUID id;

    /**
     * Название детали
     */
    private String name;

    /**
     * Материал детали
     */
    private Material material;

    /**
     * Информация о детали
     */
    private List<DetailOrderListDto> detailOrderLists;

    private String timePacking;

    String dateStartDetail;

    String dateEndDetail;
}
