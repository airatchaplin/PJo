package com.example.pozhiloyproject.models;

import java.util.List;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.time.LocalDateTime;
import java.util.UUID;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table
@Getter
@Setter
public class DetailInfo {

    @Id
    private UUID id;

    private int count;

    @ManyToOne
    private Detail detail;

    private int increment;

    private LocalDateTime dateStart;

    private LocalDateTime dateEnd;

    @ElementCollection
    private List<Boolean> isCalculated;


}
