package com.example.pozhiloyproject.models.completedOrder;

import com.example.pozhiloyproject.models.DetailOrderList;
import com.example.pozhiloyproject.models.Material;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;
import java.util.UUID;

@Entity
@Table
@Getter
@Setter
public class CompletedDetailOrder {

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
     * Информация о детали
     */
    @OneToMany(cascade = CascadeType.ALL)
    private List<CompletedDetailOrderList> detailOrderLists;

    /**
     * Время упаковки в формате 00:00:00
     */
    private String timePacking;
}
