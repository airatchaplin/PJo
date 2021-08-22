package com.example.pozhiloyproject.models;

import java.util.List;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.time.LocalDateTime;
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
public class DetailInfo {

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
    private Detail detail;

    /**
     * Последовательность
     */
    private int increment;

    /**
     * Дата запуска в производство детали
     */
    private LocalDateTime dateStart;

    /**
     * Дата завершения детали
     */
    private LocalDateTime dateEnd;

    /**
     * Признак что деталь рассчитана
     */
    @ElementCollection
    private List<Boolean> isCalculated;


}
