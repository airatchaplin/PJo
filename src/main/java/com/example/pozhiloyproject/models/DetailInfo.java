package com.example.pozhiloyproject.models;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Comparator;
import java.util.List;
import java.util.UUID;

@Entity
@Table
@Getter
@Setter
public class DetailInfo {

    @Id
    private UUID id;

    /**
     * Время
     */
    private String timeWork;

    @ManyToOne
    private WorkBench workBenches;

    private String comment;

    private int priority;

    @Transient
    boolean isSetting;

    public static List<DetailInfo> comparePriority(List<DetailInfo> detailInfos) {
        Comparator<DetailInfo> comparator = Comparator.comparing(DetailInfo::getPriority);
        detailInfos.sort(comparator);
        return detailInfos;
    }

}
