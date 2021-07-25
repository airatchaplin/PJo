package com.example.pozhiloyproject.models;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.UUID;

@Entity
@Table(name = "managers")
@Getter
@Setter
public class Manager {

    @Id
    private UUID id;

    private String name;

    private String fio;

    private String lastName;

    private String fio_i_o;


}
