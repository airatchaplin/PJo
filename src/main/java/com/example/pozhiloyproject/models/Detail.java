package com.example.pozhiloyproject.models;

import java.util.ArrayList;
import javax.persistence.*;
import java.util.List;
import java.util.UUID;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "details")
@Getter
@Setter
public class Detail {

    @Id
    private UUID id;

    private String name;

    @ManyToOne
    private Material material;

    @OneToMany
    private List<TimeWorkDetail> timeWorkDetails;

    @ManyToMany
    private List<WorkBench> workBenches;


}
