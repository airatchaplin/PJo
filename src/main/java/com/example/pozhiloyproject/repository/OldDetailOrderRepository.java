package com.example.pozhiloyproject.repository;

import com.example.pozhiloyproject.models.oldOrder.OldDetailOrder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface OldDetailOrderRepository extends JpaRepository<OldDetailOrder, UUID> {
}
