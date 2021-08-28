package com.example.pozhiloyproject.dto;

import com.example.pozhiloyproject.models.Material;
import com.example.pozhiloyproject.models.TimeWorkDetail;
import com.example.pozhiloyproject.models.WorkBench;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import java.sql.Array;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.UUID;


@Getter
@Setter
public class DetailDto {


    private UUID id;

    /**
     * Название детали
     */
    private String name;

    /**
     * Название материала детали
     */
    private String materialName;

    /**
     * Название материала детали
     */
    private double materialThickness;


    /**
     * Список времяни изготовления детали
     */
    private List<TimeWorkDetailDto> timeWorkDetailsDtos;

    /**
     * Список станков для детали
     */

    private List<WorkBenchDto> workBenchDtos;

    /**
     * Длина детали
     */
    private String length;

    /**
     * Ширина детали
     */
    private String width;


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
