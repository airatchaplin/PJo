package com.example.pozhiloyproject.repository;

import com.example.pozhiloyproject.models.Work;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface WorkRepo extends JpaRepository<Work, Long> {
    public Optional<Work> findById(Long id);
}
