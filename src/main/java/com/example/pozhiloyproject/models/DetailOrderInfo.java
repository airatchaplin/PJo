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
public class DetailOrderInfo {
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

    boolean isSetting;

    public static List<DetailOrderInfo> comparePriority(List<DetailOrderInfo> detailInfos) {
        Comparator<DetailOrderInfo> comparator = Comparator.comparing(DetailOrderInfo::getPriority);
        detailInfos.sort(comparator);
        return detailInfos;
    }

}
