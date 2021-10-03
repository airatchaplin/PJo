package com.example.pozhiloyproject.dto;

import com.example.pozhiloyproject.models.DetailDateByWorkbench;
import com.example.pozhiloyproject.models.WorkBench;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Id;
import javax.persistence.ManyToOne;
import java.time.LocalDateTime;
import java.util.Comparator;
import java.util.List;
import java.util.UUID;

@Getter
@Setter
public class DetailDateByWorkbenchDto {

    UUID id;

    WorkBench workBench;

    String detailDateStart;
    String detailDateEnd;
    boolean isSetting;
    int priority;

    public static List<DetailDateByWorkbenchDto> comparePriority(List<DetailDateByWorkbenchDto> detailDateByWorkbenches) {
        Comparator<DetailDateByWorkbenchDto> comparator = Comparator.comparing(DetailDateByWorkbenchDto::getPriority);
        detailDateByWorkbenches.sort(comparator);
        return detailDateByWorkbenches;
    }
}
