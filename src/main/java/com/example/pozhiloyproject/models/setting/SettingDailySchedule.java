package com.example.pozhiloyproject.models.setting;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.UUID;

@Setter
@Getter
@Entity
@Table
public class SettingDailySchedule {

    @Id
    UUID id;
    String name;
    String startDay;
    String endDay;
    int priority;


}
