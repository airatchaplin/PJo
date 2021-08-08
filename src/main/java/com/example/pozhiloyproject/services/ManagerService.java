package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.models.Manager;
import com.example.pozhiloyproject.repository.ManagerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class ManagerService {

    @Autowired
    ManagerRepository managerRepository;

    public List<Manager> getAllManagers() {
        return managerRepository.findAll();
    }

    public void saveManager(Manager manager) {
        managerRepository.save(manager);
    }

    public Manager getOneManager(String fio, String name, String lastName) {
        Manager manager = managerRepository.findByFioAndAndNameAndLastName(fio, name, lastName);
        return manager;
    }

    public Manager getOneManager(String name) {
        Manager manager = managerRepository.findByFio(name);
        return manager;
    }

    public Manager getManagerByUUID(String id){
        return managerRepository.findById(UUID.fromString(id)).orElseThrow();
    }


    public void deleteManager(Manager manager) {
        managerRepository.delete(manager);
    }


}
