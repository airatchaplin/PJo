package com.example.pozhiloyproject.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.Comparator;
import java.util.List;
import java.util.UUID;

@Getter
@Setter
public class DetailInfoDto {

    private UUID id;

    private String comment;

    private String timeWork;

    private WorkBenchDto workBenchDto;

    private int priority;

    public static List<DetailInfoDto> comparePriority(List<DetailInfoDto> detailInfoDtos) {
        Comparator<DetailInfoDto> comparator = Comparator.comparing(DetailInfoDto::getPriority);
        detailInfoDtos.sort(comparator);
        return detailInfoDtos;
    }
}
