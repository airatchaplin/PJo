package com.example.pozhiloyproject.models;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "completed_orders")
@Getter
@Setter
public class CompletedOrder {

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
}
