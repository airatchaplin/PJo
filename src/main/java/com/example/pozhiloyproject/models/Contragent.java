package com.example.pozhiloyproject.models;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.UUID;

@Entity
@Table(name = "contragents")
@Getter
@Setter
public class Contragent {

    @Id
    private UUID id;

    private String name;


}
