package com.example.pozhiloyproject.dto;

import com.example.pozhiloyproject.models.TypeOperation;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.CascadeType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import java.time.LocalDateTime;
import java.util.Comparator;
import java.util.List;
import java.util.UUID;

@Getter
@Setter
public class WorkBenchDto {


    private UUID id;

    private String name;

    private String dateEndDetail;


    private String typeOperation;

    int priority;

    private String timeWorkAdjustment;

    /**
     * Толщина материала
     */
    private Double currentThickness;

    public static List<WorkBenchDto> compareWorkBenchesPriority(List<WorkBenchDto> workBenches) {
        Comparator<WorkBenchDto> comparator = Comparator.comparing(WorkBenchDto::getPriority);
        workBenches.sort(comparator);
        return workBenches;
    }

    public static List<WorkBenchDto> compareWorkBenchesName(List<WorkBenchDto> workBenches) {
        Comparator<WorkBenchDto> comparator = Comparator.comparing(WorkBenchDto::getName);
        workBenches.sort(comparator);
        return workBenches;
    }
    public static List<WorkBenchDto> compareWorkBenchesTypeOperation(List<WorkBenchDto> workBenches) {
        Comparator<WorkBenchDto> comparator = Comparator.comparing(WorkBenchDto::getTypeOperation);
        workBenches.sort(comparator);
        return workBenches;
    }

    public static List<WorkBenchDto> compareWorkBenchesDateEnd(List<WorkBenchDto> workBenches) {
        Comparator<WorkBenchDto> comparator = Comparator.comparing(WorkBenchDto::getDateEndDetail);
        workBenches.sort(comparator);
        return workBenches;
    }



}
