package com.example.pozhiloyproject.repository;

import com.example.pozhiloyproject.models.Material;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface MaterialRepository extends JpaRepository<Material, UUID> {

    Material findByName(String name);
}
