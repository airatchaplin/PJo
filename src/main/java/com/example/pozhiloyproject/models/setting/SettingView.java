package com.example.pozhiloyproject.models.setting;


import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.UUID;

@Getter
@Setter
@Entity
@Table
public class SettingView {

    @Id
    UUID id;

    String name;

    boolean isViewing;

}
