package com.example.pozhiloyproject.models.oldOrder;

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
public class OldDetailOrder {

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
    private List<OldDetailOrderList> detailOrderLists;

    private String timePacking;
}
