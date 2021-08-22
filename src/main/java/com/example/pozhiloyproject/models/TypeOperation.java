package com.example.pozhiloyproject.models;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Comparator;
import java.util.List;
import java.util.UUID;

/**
 * Тип иперации
 */
@Entity
@Table(name = "type_operation")
@Getter
@Setter
public class TypeOperation {

    /**
     * Id
     */
    @Id
    private UUID id;

    /**
     * Наименование
     */
    private String name;

    /**
     * Список станков
     */
    @OneToMany(cascade = CascadeType.ALL)
    private List<WorkBench> workBenches;

    /**
     * Сортировка списка операций
     *
     * @param typeOperations Список операций
     * @return Отсортированный список
     */
    public static List<TypeOperation> compare(List<TypeOperation> typeOperations) {
        Comparator<TypeOperation> comparator = Comparator.comparing(TypeOperation::getName);
        typeOperations.sort(comparator);
        return typeOperations;
    }
}
