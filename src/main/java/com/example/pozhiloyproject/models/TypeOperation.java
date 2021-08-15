package com.example.pozhiloyproject.models;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "type_operation")
@Getter
@Setter
public class TypeOperation {

    @Id
    private UUID id;

    private String name;

    @OneToMany(cascade = CascadeType.ALL)
    List<WorkBench> workBenches;

}
