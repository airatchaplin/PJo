package com.example.pozhiloyproject.dto;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Id;
import java.util.Comparator;
import java.util.List;
import java.util.UUID;

@Getter
@Setter
public class TimeWorkDetailDto {

    private UUID id;

    private String timeWork;

    int priority;

    public static List<TimeWorkDetailDto> compare(List<TimeWorkDetailDto> timeWorkDetailDtos) {
        Comparator<TimeWorkDetailDto> comparator = Comparator.comparing(TimeWorkDetailDto::getPriority);
        timeWorkDetailDtos.sort(comparator);
        return timeWorkDetailDtos;
    }

}
