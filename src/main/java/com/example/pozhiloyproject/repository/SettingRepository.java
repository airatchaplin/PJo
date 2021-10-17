package com.example.pozhiloyproject.repository;

import com.example.pozhiloyproject.models.setting.Setting;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface SettingRepository extends JpaRepository<Setting, UUID> {
}
