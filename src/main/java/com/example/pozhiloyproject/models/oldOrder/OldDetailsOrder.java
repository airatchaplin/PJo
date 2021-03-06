package com.example.pozhiloyproject.models.oldOrder;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.UUID;

@Entity
@Table
@Getter
@Setter
public class OldDetailsOrder {

    /**
     * Id
     */
    @Id
    private UUID id;

    /**
     * Колличество детали
     */
    private int count;

    /**
     * Деталь
     */
    @ManyToOne(cascade = CascadeType.ALL)
    private OldDetailOrder detailOrder;

    /**
     * Последовательность
     */
    private int increment;

}
