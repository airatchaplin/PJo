package com.example.pozhiloyproject.controllers;

import com.example.pozhiloyproject.models.setting.Setting;
import com.example.pozhiloyproject.models.setting.SettingDailySchedule;
import com.example.pozhiloyproject.models.setting.SettingView;
import com.example.pozhiloyproject.models.setting.SettingWeekend;
import com.example.pozhiloyproject.services.SettingService;
import com.example.pozhiloyproject.services.SettingWeekendService;
import com.example.pozhiloyproject.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.LinkedList;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Controller
@RequestMapping("/admin")
public class SettingController {

    @Autowired
    UserService userService;

    @Autowired
    SettingWeekendService settingWeekendService;

    @Autowired
    SettingService settingService;


    @GetMapping("/settings")
    public String settings(Model model) {
        Setting setting = settingService.getSetting();
        setting.setSettingViews(Setting.compare(setting.getSettingViews()));
        model.addAttribute("user", userService.getUserWeb());
        model.addAttribute("setting", setting);
        model.addAttribute("settingView", Stream.of("Просмотр", "Редактирование").collect(Collectors.toList()));
        model.addAttribute("settingDaily", Setting.compareSettingDailySchedule(setting.getSettingDailySchedules()));

        return "settings";
    }

    @PostMapping("/settings")
    public String settings(

            @RequestParam(required = true) List<String> idOld,
            @RequestParam(required = true) List<String> nameOld,
            @RequestParam(required = true) List<String> dateStartOld,
            @RequestParam(required = true) List<String> dateEndOld,
            @RequestParam(required = true) List<String> name,
            @RequestParam(required = true) List<String> dateStart,
            @RequestParam(required = true) List<String> dateEnd,
            @RequestParam(required = true) List<String> nameView,
            @RequestParam(required = true) List<String> viewing,
            @RequestParam(required = true) List<String> settingDayName,
            @RequestParam(required = true) List<String> settingDayStartDay,
            @RequestParam(required = true) List<String> settingEndStartDay,
            Model model) {

        List<SettingWeekend> settingWeekends = new LinkedList<>();
        for (int i = 0; i < idOld.size(); i++) {
            if (!idOld.get(i).equals("")) {
                SettingWeekend settingWeekend = settingWeekendService.getSettingWeekend(UUID.fromString(idOld.get(i)));
                settingWeekend.setName(nameOld.get(i));
                settingWeekend.setDateStart(LocalDate.parse(dateStartOld.get(i)));
                settingWeekend.setDateEnd(LocalDate.parse(dateEndOld.get(i)));
                settingWeekends.add(settingWeekend);
            }
        }

        for (int i = 0; i < name.size(); i++) {
            if (!name.get(i).equals("")) {
                SettingWeekend settingWeekend = new SettingWeekend();
                settingWeekend.setId(UUID.randomUUID());
                settingWeekend.setName(name.get(i));
                settingWeekend.setDateStart(LocalDate.parse(dateStart.get(i)));
                settingWeekend.setDateEnd(LocalDate.parse(dateEnd.get(i)));
                settingWeekends.add(settingWeekend);
            }
        }
        Setting setting = settingService.getSetting();
        setting.setSettingWeekends(settingWeekends);


        List<SettingView> settingViews = Setting.compare(setting.getSettingViews());
        for (int i = 0; i < settingViews.size(); i++) {
            if (settingViews.get(i).getName().equals(nameView.get(i))) {
                if (viewing.get(i).equals("Просмотр")) {
                    settingViews.get(i).setViewing(true);
                } else {
                    settingViews.get(i).setViewing(false);
                }
            }
        }
        setting.setSettingViews(Setting.compare(settingViews));

        List<SettingDailySchedule> settingDailySchedules = setting.getSettingDailySchedules();
        for (int i = 0; i < settingDailySchedules.size(); i++) {
            SettingDailySchedule settingDailySchedule = settingDailySchedules.get(i);
            settingDailySchedule.setName(settingDayName.get(i));
            settingDailySchedule.setStartDay(settingDayStartDay.get(i));
            settingDailySchedule.setEndDay(settingEndStartDay.get(i));
            settingDailySchedule.setPriority(i);
        }

        settingService.saveSetting(setting);
        model.addAttribute("user", userService.getUserWeb());
        return "redirect:/admin/settings";
    }

    @PostMapping("/settings/deleteWeekend/{id}")
    public String settingsDeleteWeekendPost(@PathVariable(value = "id") String id, Model model) {
        Setting setting = settingService.getSetting();
        List<SettingWeekend> settingWeekends = setting.getSettingWeekends();
        settingWeekends.removeIf(x -> x.getId().toString().equals(id));
        settingService.saveSetting(setting);
        return "redirect:/admin/settings";
    }


}
