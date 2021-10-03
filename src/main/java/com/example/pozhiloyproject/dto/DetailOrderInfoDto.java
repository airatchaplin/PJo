package com.example.pozhiloyproject.dto;

import com.example.pozhiloyproject.models.DetailInfo;
import com.example.pozhiloyproject.models.WorkBench;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Id;
import javax.persistence.ManyToOne;
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
