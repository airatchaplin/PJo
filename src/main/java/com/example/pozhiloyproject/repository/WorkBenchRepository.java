package com.example.pozhiloyproject.repository;

import com.example.pozhiloyproject.models.WorkBench;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface WorkBenchRepository extends JpaRepository<WorkBench, UUID> {
    WorkBench findByName(String name);

    @Query("SELECT w from WorkBench w where w.typeOperation.id =:id ")
    List<WorkBench> findByWorkBenchesFilterOperationName(@Param("id") UUID id);
}
