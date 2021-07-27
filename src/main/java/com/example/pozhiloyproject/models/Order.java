package com.example.pozhiloyproject.models;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "orders")
@Getter
@Setter
public class Order {

    @Id
    private UUID id;

    private int numberOrder;

    @ManyToOne
    private Contragent objectName;

    @ManyToOne
    private Manager manager;

    @ManyToMany(cascade = CascadeType.ALL)
    private List<DetailInfo> detailInfos;

    private LocalDateTime dateStart;

    private LocalDateTime dateEnd;

    private String comment;

    private String packing;

    private String painting;
}
