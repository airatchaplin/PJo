package com.example.pozhiloyproject.repository;

import com.example.pozhiloyproject.models.DetailOrderInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface DetailOrderInfoRepository extends JpaRepository<DetailOrderInfo, UUID> {
}
