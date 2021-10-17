package com.example.pozhiloyproject.repository;

import com.example.pozhiloyproject.models.detail.DetailInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface DetailInfoRepository extends JpaRepository<DetailInfo, UUID> {
}
