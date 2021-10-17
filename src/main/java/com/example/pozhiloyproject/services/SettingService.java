package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.models.setting.Setting;
import com.example.pozhiloyproject.repository.SettingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class SettingService {

    @Autowired
    SettingRepository settingRepository;

    public void saveSetting(Setting setting) {
        settingRepository.save(setting);
    }

    public Setting getSetting() {
        return settingRepository.findById(UUID.fromString("a7566ccd-7729-4592-a675-28638ca72e65")).orElse(new Setting());
    }
}
