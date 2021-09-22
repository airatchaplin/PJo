package com.example.pozhiloyproject.models;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.UUID;

@Entity
@Table
@Getter
@Setter
public class DetailInfo {

    @Id
    private UUID id;

    /**
     * Время
     */
    private String timeWork;

    @ManyToOne
    private WorkBench workBenches;

    private String comment;

    private int priority;


}
