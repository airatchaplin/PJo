package com.example.pozhiloyproject.models;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
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

}
