package com.example.pozhiloyproject.repository;

import com.example.pozhiloyproject.models.Role;
import com.example.pozhiloyproject.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Collection;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface UserRepository extends JpaRepository<User, UUID> {

    Optional<User> findById(UUID id);

    User findByUsername(String username);

}
