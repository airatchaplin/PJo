package com.example.pozhiloyproject.dto;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

public class OrderDto {


    @Getter
    @Setter
    private UUID id;

    @Getter
    @Setter
    private int numberOrder;

    @Getter
    @Setter
    private String objectName;

    @Getter
    @Setter
    private String manager;

    @Getter
    @Setter
    private String economist;

    @Getter
    @Setter
    private LocalDate dateStart;

    @Getter
    @Setter
    private LocalDate dateEnd;

    @Getter
    @Setter
    private String comment;

    @Getter
    @Setter
    private List<DetailDto> detailDtos;

}
