package com.example.pozhiloyproject.helper;

import java.time.DayOfWeek;
import java.time.LocalDateTime;

public class Helper {

    public static String EmptyOrNull(Object object) {
        return object == null ? "" : object.toString();
    }

    public static LocalDateTime addTwoHoursWithoutDayOff(LocalDateTime localDateTime) {
        LocalDateTime dateStartDay = LocalDateTime.parse(localDateTime.toLocalDate() + "T08:30");
        LocalDateTime dateEndDay = LocalDateTime.parse(localDateTime.toLocalDate() + "T16:30");

        if (localDateTime.getDayOfWeek().equals(DayOfWeek.FRIDAY)) {
            for (int i = 0; i < 120; i++) {
                if (!localDateTime.isAfter(dateEndDay)) {
                    localDateTime = localDateTime.plusMinutes(1);
                } else {
                    dateStartDay = dateStartDay.plusDays(3);
                    dateEndDay = dateEndDay.plusDays(3);
                    localDateTime = dateStartDay;
                }
            }
        } else {
            for (int i = 0; i < 120; i++) {
                if (!localDateTime.isAfter(dateEndDay)) {
                    localDateTime = localDateTime.plusMinutes(1);
                } else {
                    dateStartDay = dateStartDay.plusDays(1);
                    dateEndDay = dateEndDay.plusDays(1);
                    localDateTime = dateStartDay;
                }
            }
        }
        return localDateTime;
    }
}
