package com.example.pozhiloyproject.models.oldOrder;

import com.example.pozhiloyproject.models.TypeOperation;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table
@Getter
@Setter
public class OldWorkBench {

    /**
     * Id
     */
    @Id
    private UUID id;

    /**
     * Наименование станка
     */
    private String name;

    /**
     * Время окончания на этом станке
     */
    private LocalDateTime dateEndDetail;

    /**
     * Тип операции
     */
    @ManyToOne
    private TypeOperation typeOperation;

    /**
     * Толщина материала
     */
    private Double currentThickness;

    UUID idWorkbench;
}
