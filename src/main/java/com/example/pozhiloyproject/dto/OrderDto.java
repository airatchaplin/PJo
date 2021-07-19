package com.example.pozhiloyproject.dto;

import com.example.pozhiloyproject.models.Contragent;
import com.example.pozhiloyproject.models.Detail;
import com.example.pozhiloyproject.models.Manager;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.CascadeType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

public class OrderDto {


    @Getter
    @Setter
    private UUID id;

    @Getter
    @Setter
    private int numberOrder;

    @Getter
    @Setter
    private String objectName;

    @Getter
    @Setter
    private String manager;

    @Getter
    @Setter
    private String detailName;

    @Getter
    @Setter
    private int countDetail;

    @Getter
    @Setter
    private String typeMaterial;

    @Getter
    @Setter
    private LocalDate dateStart;

    @Getter
    @Setter
    private LocalDate dateEnd;

    @Getter
    @Setter
    private String comment;



}
