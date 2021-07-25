package com.example.pozhiloyproject.models;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.UUID;

@Entity
@Table(name = "timeworkdetail")
@Getter
@Setter
public class TimeWorkDetail {

    @Id
    private UUID id;

    private String timeWork;

}
