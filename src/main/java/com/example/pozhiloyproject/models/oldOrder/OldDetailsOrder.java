package com.example.pozhiloyproject.models.oldOrder;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
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
    @ManyToOne
    private OldDetailOrder detailOrder;

    /**
     * Последовательность
     */
    private int increment;

}
