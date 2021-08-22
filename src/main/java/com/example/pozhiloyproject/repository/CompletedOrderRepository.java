package com.example.pozhiloyproject.repository;

import com.example.pozhiloyproject.models.CompletedOrder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface CompletedOrderRepository extends JpaRepository<CompletedOrder, UUID> {

    CompletedOrder findByNumberOrder(int numberOrder);
}
