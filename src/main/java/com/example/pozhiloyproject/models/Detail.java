package com.example.pozhiloyproject.models;

import javax.persistence.*;
import java.util.List;
import java.util.UUID;
import lombok.Getter;
import lombok.Setter;

/**
 * Деталь
 */
@Entity
@Table(name = "details")
@Getter
@Setter
public class Detail {

    /**
     * id Детали
     */
    @Id
    private UUID id;

    /**
     * Название детали
     */
    private String name;

    /**
     * Материал детали
     */
    @ManyToOne
    private Material material;

    /**
     * Список времяни изготовления детали
     */
    @OneToMany
    private List<TimeWorkDetail> timeWorkDetails;

    /**
     * Список станков для детали
     */
    @ManyToMany
    private List<WorkBench> workBenches;

}
