package com.example.pozhiloyproject.models;

import javax.persistence.*;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "details")
public class Detail {

    @Id
    UUID id;
    String name;

    @ManyToMany
    List<WorkBench> workBenches;

    //    @ManyToOne(cascade = CascadeType.ALL)
//    Order order;

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<WorkBench> getWorkBenches() {
        return workBenches;
    }

    public void setWorkBenches(List<WorkBench> workBenches) {
        this.workBenches = workBenches;
    }
}
