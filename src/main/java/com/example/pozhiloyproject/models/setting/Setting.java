package com.example.pozhiloyproject.models.setting;

import com.example.pozhiloyproject.models.Material;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Comparator;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Setter
@Getter
@Entity
@Table
public class Setting {

    @Id
    UUID id;

    String timeWorkAdjustment;

    @OneToMany(cascade = CascadeType.ALL)
    List<SettingWeekend> settingWeekends;

    @OneToMany(cascade = CascadeType.ALL)
    List<SettingView> settingViews;

    /**
     * Сортировка по наименованию
     *
     * @param settingViews Список
     * @return Отсортированный список
     */
    public static List<SettingView> compare(List<SettingView> settingViews) {
        return settingViews.stream().sorted(Comparator.comparing(SettingView::getName)).collect(Collectors.toList());
    }

}
