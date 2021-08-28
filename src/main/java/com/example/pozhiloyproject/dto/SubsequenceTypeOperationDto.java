package com.example.pozhiloyproject.dto;

import com.example.pozhiloyproject.models.TypeOperation;

import javax.persistence.Id;
import javax.persistence.ManyToMany;
import java.util.List;
import java.util.UUID;

public class SubsequenceTypeOperationDto {

    private UUID id;

    /**
     * Список операций
     */

    private List<TypeOperation> typeOperations;

    /**
     * Описание
     */
    private String description;

    private int priority;
}
