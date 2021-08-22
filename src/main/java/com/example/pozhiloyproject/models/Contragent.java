package com.example.pozhiloyproject.models;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.UUID;

/**
 * Контрагент
 */
@Entity
@Table(name = "contragents")
@Getter
@Setter
public class Contragent {

    /**
     * Id
     */
    @Id
    private UUID id;

    /**
     * Наименование контрагента
     */
    private String name;

}
