package com.example.pozhiloyproject.models;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Comparator;
import java.util.List;
import java.util.UUID;

@Entity
@Table
@Getter
@Setter
public class DetailDateByWorkbench {

    @Id
    UUID id;

    @ManyToOne
    WorkBench workBench;

    LocalDateTime detailDateStart;
    LocalDateTime detailDateEnd;
    boolean isSetting;
    int priority;

    public static List<DetailDateByWorkbench> comparePriority(List<DetailDateByWorkbench> detailDateByWorkbenches) {
        Comparator<DetailDateByWorkbench> comparator = Comparator.comparing(DetailDateByWorkbench::getPriority);
        detailDateByWorkbenches.sort(comparator);
        return detailDateByWorkbenches;
    }
}
