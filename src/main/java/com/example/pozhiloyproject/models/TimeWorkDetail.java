package com.example.pozhiloyproject.models;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.UUID;

@Entity
@Table(name = "timeworkdetail")
public class TimeWorkDetail {

    @Id
    UUID id;

    String timeWork;

    public TimeWorkDetail() {
    }

    public TimeWorkDetail(UUID id, String timeWork) {
        this.id = id;
        this.timeWork = timeWork;
    }

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public String getTimeWork() {
        return timeWork;
    }

    public void setTimeWork(String timeWork) {
        this.timeWork = timeWork;
    }
}
