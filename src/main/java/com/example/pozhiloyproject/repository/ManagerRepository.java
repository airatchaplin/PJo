package com.example.pozhiloyproject.repository;

import com.example.pozhiloyproject.models.Manager;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface ManagerRepository extends JpaRepository<Manager, UUID> {

    public Manager findByFio(String name);
}
