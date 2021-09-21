package com.example.pozhiloyproject.models;

import javax.persistence.*;
import java.util.List;
import java.util.UUID;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Cascade;

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
    @ManyToMany(cascade = CascadeType.ALL)
    private List<DetailInfo> detailInfos;

}
