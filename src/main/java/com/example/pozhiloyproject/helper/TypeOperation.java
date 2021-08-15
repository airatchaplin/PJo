package com.example.pozhiloyproject.helper;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public enum TypeOperation {

    PUNCHING("Пробивка"),
    CUTTING("Резка"),
    BENDING("Гибка"),
    PACKING("Упаковка"),
    PAINTING("Покраска");

    String description;

    private TypeOperation(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public static List<TypeOperation> getAllTypeOperation() {
        return Stream.of(TypeOperation.PUNCHING,
                TypeOperation.CUTTING,
                TypeOperation.BENDING,
                TypeOperation.PACKING,
                TypeOperation.PAINTING).collect(Collectors.toList());
    }
}
