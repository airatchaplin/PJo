package com.example.pozhiloyproject.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.Comparator;
import java.util.List;
import java.util.UUID;


@Getter
@Setter
public class DetailDto {


    private UUID id;

    /**
     * Название детали
     */
    private String name;

    private UUID materialId;

    /**
     * Название материала детали
     */
    private String materialName;

    /**
     * Название материала детали
     */
    private double materialThickness;

    /**
     * Инфомация о детали
     */
    private List<DetailInfoDto> detailInfoDtos;

    String subsequenceTypeOperation;

    private String timePacking;


    public static List<DetailDto> compareDetailName(List<DetailDto> detailDtos) {
        Comparator<DetailDto> comparator = Comparator.comparing(DetailDto::getName);
        detailDtos.sort(comparator);
        return detailDtos;
    }

    public static List<DetailDto> compareMaterialName(List<DetailDto> detailDtos) {
        Comparator<DetailDto> comparator = Comparator.comparing(DetailDto::getMaterialName);
        detailDtos.sort(comparator);
        return detailDtos;
    }

    public static List<DetailDto> compareMaterialThickness(List<DetailDto> detailDtos) {
        Comparator<DetailDto> comparator = Comparator.comparing(DetailDto::getMaterialThickness);
        detailDtos.sort(comparator);
        return detailDtos;
    }
}
