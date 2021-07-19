package com.example.pozhiloyproject.models;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.UUID;

@Entity
@Table(name = "managers")
public class Manager {

    @Id
    private UUID id;
    private String name;
    private String fio;
    private String lastName;
    private String fio_i_o;

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

    public String getFio() {
        return fio;
    }

    public void setFio(String fio) {
        this.fio = fio;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFio_i_o() {
        return fio_i_o;
    }

    public void setFio_i_o(String fio_i_o) {
        this.fio_i_o = fio_i_o;
    }
}
