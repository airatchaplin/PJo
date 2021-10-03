package com.example.pozhiloyproject.models;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;
import java.util.UUID;

@Entity
@Table
@Getter
@Setter
public class DetailOrder {
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
//    @ManyToMany(cascade = CascadeType.ALL)
    @OneToMany(cascade = CascadeType.ALL)
    private List<DetailOrderList> detailOrderLists;

    private String timePacking;
}
