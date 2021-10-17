package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.models.setting.SettingWeekend;
import com.example.pozhiloyproject.repository.SettingWeekendRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class SettingWeekendService {

    @Autowired
    SettingWeekendRepository settingWeekendRepository;

    public SettingWeekend getSettingWeekend(UUID id) {
        return settingWeekendRepository.findById(id).orElse(new SettingWeekend());
    }

    public void saveSettingWeekend(SettingWeekend settingWeekend) {
        settingWeekendRepository.save(settingWeekend);
    }

    public void deleteSettingWeekend(SettingWeekend settingWeekend) {
        settingWeekendRepository.delete(settingWeekend);
    }

    public List<SettingWeekend> getAllSettingWeekend() {
        return settingWeekendRepository.findAll();
    }
}
