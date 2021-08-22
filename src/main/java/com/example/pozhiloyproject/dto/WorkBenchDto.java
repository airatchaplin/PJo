package com.example.pozhiloyproject.dto;

import com.example.pozhiloyproject.models.TypeOperation;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.CascadeType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import java.time.LocalDateTime;
import java.util.Comparator;
import java.util.List;
import java.util.UUID;

@Getter
@Setter
public class WorkBenchDto {


    private UUID id;

    private String name;

    private LocalDateTime dateEndDetail;


    private TypeOperation typeOperation;

    int priority;

    public static List<WorkBenchDto> compare(List<WorkBenchDto> workBenches) {
        Comparator<WorkBenchDto> comparator = Comparator.comparing(WorkBenchDto::getPriority);
        workBenches.sort(comparator);
        return workBenches;
    }

}
