package com.example.pozhiloyproject.repository;

import com.example.pozhiloyproject.models.DetailOrderList;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface DetailOrderListRepository extends JpaRepository<DetailOrderList, UUID> {
}
