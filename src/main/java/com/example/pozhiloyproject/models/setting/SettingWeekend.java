package com.example.pozhiloyproject.models.setting;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.time.LocalDate;
import java.util.UUID;

@Setter
@Getter
@Entity
@Table
public class SettingWeekend {

    @Id
    UUID id;

    String name;

    LocalDate dateStart;

    LocalDate dateEnd;
}
