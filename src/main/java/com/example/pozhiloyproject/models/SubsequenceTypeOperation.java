package com.example.pozhiloyproject.models;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "subsequence_type_operation")
@Getter
@Setter
public class SubsequenceTypeOperation {

    @Id
    UUID id;

    @ManyToMany
    List<TypeOperation> typeOperations;

    private String description;
}
