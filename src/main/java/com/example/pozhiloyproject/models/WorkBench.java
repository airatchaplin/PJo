package com.example.pozhiloyproject.models;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(name = "workbench")
@Getter
@Setter
public class WorkBench {

    @Id
    private UUID id;

    private String name;

    private LocalDateTime dateEndDetail;

    @ManyToOne(cascade = CascadeType.ALL)
    private TypeOperation typeOperation;


}
