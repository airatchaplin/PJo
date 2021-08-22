package com.example.pozhiloyproject.models;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;
import java.util.UUID;

/**
 * Последовательность операций
 */
@Entity
@Table(name = "subsequence_type_operation")
@Getter
@Setter
public class SubsequenceTypeOperation {

    /**
     * Id
     */
    @Id
    private UUID id;

    /**
     * Список операций
     */
    @ManyToMany
    private List<TypeOperation> typeOperations;

    /**
     * Описание
     */
    private String description;
}
