package com.example.pozhiloyproject.repository;

import com.example.pozhiloyproject.models.setting.SettingWeekend;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface SettingWeekendRepository extends JpaRepository<SettingWeekend, UUID> {
}
