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


    @OneToMany(cascade = CascadeType.ALL)
    List<SettingWeekend> settingWeekends;

    @OneToMany(cascade = CascadeType.ALL)
    List<SettingView> settingViews;

    @OneToMany(cascade = CascadeType.ALL)
    List<SettingDailySchedule> settingDailySchedules;

    /**
     * Сортировка по наименованию
     *
     * @param settingViews Список
     * @return Отсортированный список
     */
    public static List<SettingView> compare(List<SettingView> settingViews) {
        return settingViews.stream().sorted(Comparator.comparing(SettingView::getName)).collect(Collectors.toList());
    }

    /**
     * Сортировка по наименованию
     *
     * @param settingDailySchedules Список
     * @return Отсортированный список
     */
    public static List<SettingDailySchedule> compareSettingDailySchedule(List<SettingDailySchedule> settingDailySchedules) {
        return settingDailySchedules.stream().sorted(Comparator.comparing(SettingDailySchedule::getPriority)).collect(Collectors.toList());
    }

}
