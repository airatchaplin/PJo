package com.example.pozhiloyproject.repository;

import com.example.pozhiloyproject.models.oldOrder.OldOrder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface OldOrderRepository extends JpaRepository<OldOrder, UUID> {

    OldOrder findByOrderId(UUID id);
}
