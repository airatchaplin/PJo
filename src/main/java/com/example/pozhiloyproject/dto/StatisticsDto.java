package com.example.pozhiloyproject.dto;

import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;

@Getter
@Setter
public class StatisticsDto {

    String dateStartTime;
    String dayStart;
    String dayEnd;
    String dateEndTime;
    String orderNumber;
    String detailName;


}
