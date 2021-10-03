package com.example.pozhiloyproject.dto;

import com.example.pozhiloyproject.models.DetailOrder;
import com.example.pozhiloyproject.models.DetailOrderList;
import com.example.pozhiloyproject.models.Material;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.CascadeType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import java.util.List;
import java.util.UUID;

@Getter
@Setter
public class DetailsOrderDto {

    /**
     * Id
     */
    private UUID id;

    /**
     * Колличество детали
     */
    private int count;

    /**
     * Деталь
     */
    private DetailOrderDto detailOrder;

    /**
     * Последовательность
     */
    private int increment;
}
