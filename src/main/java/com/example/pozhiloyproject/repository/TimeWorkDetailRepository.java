package com.example.pozhiloyproject.repository;

import com.example.pozhiloyproject.models.TimeWorkDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface TimeWorkDetailRepository extends JpaRepository<TimeWorkDetail, UUID> {
}
