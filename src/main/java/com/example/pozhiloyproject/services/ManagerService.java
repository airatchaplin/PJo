package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.models.Manager;
import com.example.pozhiloyproject.repository.ManagerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ManagerService {

    @Autowired
    ManagerRepository managerRepository;

    public List<Manager> getAllManagers(){
        return managerRepository.findAll();
    }

    public void saveManager(Manager manager){
        managerRepository.save(manager);
    }

    public Manager getOneManager(String fio,String name,String lastName){
        Manager manager = managerRepository.findByFioAndAndNameAndLastName(fio, name, lastName);
        return manager;
    }

    public Manager getOneManager(String name){
        Manager manager = managerRepository.findByFio( name);
        return manager;
    }

    public void deleteManager(Manager manager){
        managerRepository.delete(manager);
    }
}
