package com.example.pozhiloyproject.models;

import lombok.Getter;
import lombok.Setter;
import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.UUID;

/**
 * Станок
 */
@Entity
@Table(name = "workbench")
@Getter
@Setter
public class WorkBench {

    /**
     * Id
     */
    @Id
    private UUID id;

    /**
     * Наименование станка
     */
    private String name;

    /**
     * Время окончания на этом станке
     */
    private LocalDateTime dateEndDetail;

    /**
     * Тип операции
     */
    @ManyToOne
    private TypeOperation typeOperation;

//    public static List<WorkBench> compare(List<WorkBench> workBenches){
//        Comparator<WorkBench> comparator = Comparator.comparing(WorkBench::getName);
//        workBenches.sort(comparator);
//        return workBenches;
//    }

    /**
     * Толщина материала
     */
    private Double currentThickness;
}
