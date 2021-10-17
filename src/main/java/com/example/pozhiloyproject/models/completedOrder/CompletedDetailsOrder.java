package com.example.pozhiloyproject.models.completedOrder;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.UUID;

@Entity
@Table
@Getter
@Setter
public class CompletedDetailsOrder {

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
    private CompletedDetailOrder detailOrder;

    /**
     * Последовательность
     */
    private int increment;

}
