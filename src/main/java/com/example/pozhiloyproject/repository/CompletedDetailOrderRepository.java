package com.example.pozhiloyproject.repository;

import com.example.pozhiloyproject.models.completedOrder.CompletedDetailOrder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface CompletedDetailOrderRepository extends JpaRepository<CompletedDetailOrder, UUID> {
}
