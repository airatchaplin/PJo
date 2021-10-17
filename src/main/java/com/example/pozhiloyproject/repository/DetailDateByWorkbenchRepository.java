package com.example.pozhiloyproject.repository;

import com.example.pozhiloyproject.models.detail.DetailDateByWorkbench;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface DetailDateByWorkbenchRepository extends JpaRepository<DetailDateByWorkbench, UUID> {
}
