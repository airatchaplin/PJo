package com.example.pozhiloyproject.repository;

import com.example.pozhiloyproject.models.Test;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface TestRepo extends JpaRepository<Test, Long> {
    public Optional<Test> findById(Long id);
}
