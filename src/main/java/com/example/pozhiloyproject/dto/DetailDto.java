package com.example.pozhiloyproject.dto;

import com.example.pozhiloyproject.models.Material;
import com.example.pozhiloyproject.models.TimeWorkDetail;
import com.example.pozhiloyproject.models.WorkBench;

import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import java.util.List;
import java.util.Map;
import java.util.UUID;

public class DetailDto {


    private UUID id;

    /**
     * Название детали
     */
    private String name;

    /**
     * Материал детали
     */

    private Material material;

    /**
     * Список времяни изготовления детали
     */

    private List<TimeWorkDetail> timeWorkDetails;

    /**
     * Список станков для детали
     */

    private Map<String, List<WorkBench>> workBenchesOperation;

    /**
     * Длина детали
     */
    private String length;

    /**
     * Ширина детали
     */
    private String width;
}
