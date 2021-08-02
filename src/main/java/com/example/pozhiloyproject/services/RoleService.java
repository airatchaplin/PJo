package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.models.Role;
import com.example.pozhiloyproject.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;

@Service
public class RoleService {

    @Autowired
    RoleRepository roleRepository;

    public Role getRoleUser(){
        return roleRepository.findByName("ROLE_USER");
    }

    public Role getRoleAdmin(){
        return roleRepository.findByName("ROLE_ADMIN");
    }

    public List<Role> getAllRoles(){
        return roleRepository.findAll();
    }
}
