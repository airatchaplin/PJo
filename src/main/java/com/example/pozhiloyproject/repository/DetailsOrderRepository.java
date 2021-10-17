package com.example.pozhiloyproject.repository;

import com.example.pozhiloyproject.models.detail.DetailsOrder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface DetailsOrderRepository extends JpaRepository<DetailsOrder, UUID> {
}
