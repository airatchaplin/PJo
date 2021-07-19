package com.example.pozhiloyproject.models;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(name = "workbench")
public class WorkBench {

    @Id
    UUID id;

    String name;

    LocalDateTime dateEndDetail;

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

    public LocalDateTime getDateEndDetail() {
        return dateEndDetail;
    }

    public void setDateEndDetail(LocalDateTime dateEndDetail) {
        this.dateEndDetail = dateEndDetail;
    }
}
