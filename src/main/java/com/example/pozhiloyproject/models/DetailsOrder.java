package com.example.pozhiloyproject.models;

import java.util.List;
import javax.persistence.*;
import java.util.UUID;

import lombok.Getter;
import lombok.Setter;

/**
 * Деталь в заказе
 */
@Entity
@Table
@Getter
@Setter
public class DetailsOrder {

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
    private DetailOrder detailOrder;

    /**
     * Последовательность
     */
    private int increment;




}
