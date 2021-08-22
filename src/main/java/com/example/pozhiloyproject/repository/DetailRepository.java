package com.example.pozhiloyproject.repository;

import com.example.pozhiloyproject.models.Detail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface DetailRepository extends JpaRepository<Detail, UUID> {

    Detail findByName(String name);
}
