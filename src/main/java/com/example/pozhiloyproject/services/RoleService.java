package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.models.Role;
import com.example.pozhiloyproject.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;

/**
 * Сервис прав
 */
@Service
public class RoleService {

    @Autowired
    RoleRepository roleRepository;

    /**
     * Получение права ROLE_USER
     *
     * @return Права
     */
    public Role getRoleUser() {
        return roleRepository.findByName("ROLE_USER");
    }

    /**
     * Получение права ROLE_ADMIN
     *
     * @return Права
     */
    public Role getRoleAdmin() {
        return roleRepository.findByName("ROLE_ADMIN");
    }

    /**
     * Получение всех прав
     *
     * @return Список прав
     */
    public List<Role> getAllRoles() {
        return roleRepository.findAll();
    }
}
