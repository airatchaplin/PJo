package com.example.pozhiloyproject.models.detail;

import javax.persistence.*;
import java.util.List;
import java.util.UUID;

import com.example.pozhiloyproject.models.Material;
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
     * Информация о детали
     */
//    @ManyToMany(cascade = CascadeType.ALL)
            @OneToMany(cascade = CascadeType.ALL)
    private List<DetailList> detailLists;


    private String timePacking;

}
