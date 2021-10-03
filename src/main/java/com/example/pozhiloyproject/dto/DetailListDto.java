package com.example.pozhiloyproject.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.List;
import java.util.UUID;

@Getter
@Setter
public class DetailListDto {

    UUID id;

    List<DetailInfoDto> detailInfoDtos;

    int mainOrAlternative;
}
