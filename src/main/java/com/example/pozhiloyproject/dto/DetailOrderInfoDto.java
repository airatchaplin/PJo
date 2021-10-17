package com.example.pozhiloyproject.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.Comparator;
import java.util.List;
import java.util.UUID;

@Getter
@Setter
public class DetailOrderInfoDto {

    private UUID id;

    /**
     * Время
     */
    private String timeWork;

    private WorkBenchDto workBenches;

    private String comment;

    private int priority;

    boolean isSetting;

    public static List<DetailOrderInfoDto> comparePriority(List<DetailOrderInfoDto> detailInfos) {
        Comparator<DetailOrderInfoDto> comparator = Comparator.comparing(DetailOrderInfoDto::getPriority);
        detailInfos.sort(comparator);
        return detailInfos;
    }
}
