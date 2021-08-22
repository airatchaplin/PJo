package com.example.pozhiloyproject.models;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Comparator;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

/**
 * Материал
 */
@Entity
@Table(name = "materials")
@Getter
@Setter
public class Material {

    /**
     * Id
     */
    @Id
    private UUID id;

    /**
     * Наименование материала
     */
    private String name;

    /**
     * Толщина материала
     */
    private String thickness;

    /**
     * Сортировка списка материала по наименованию
     *
     * @param materials Список материала
     * @return Отсортированный список
     */
    public static List<Material> compare(List<Material> materials) {
        return materials.stream().sorted(Comparator.comparing(Material::getName).thenComparing(Material::getThickness)).collect(Collectors.toList());
    }

}
