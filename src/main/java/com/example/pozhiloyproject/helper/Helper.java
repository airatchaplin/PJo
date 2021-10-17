package com.example.pozhiloyproject.helper;

import com.example.pozhiloyproject.models.setting.Setting;
import com.example.pozhiloyproject.services.SettingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.util.Arrays;

@Component
public class Helper {

    @Autowired
    SettingService settingService;

    public static String EmptyOrNull(Object object) {
        return object == null ? "" : object.toString();
    }

}
