package com.example.pozhiloyproject.repository;

import com.example.pozhiloyproject.models.Contragent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface ContragentRepository extends JpaRepository<Contragent, UUID> {

    Contragent findByName(String name);
}
