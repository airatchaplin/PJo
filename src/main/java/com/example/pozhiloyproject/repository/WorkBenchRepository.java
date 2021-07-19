package com.example.pozhiloyproject.repository;

import com.example.pozhiloyproject.models.WorkBench;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface WorkBenchRepository extends JpaRepository<WorkBench, UUID> {
    WorkBench findByName(String name);
}
