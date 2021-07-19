package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.models.Contragent;
import com.example.pozhiloyproject.repository.ContragentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ContragentService {

    @Autowired
    ContragentRepository contragentRepository;

    public List<Contragent> getAllContragents(){
        return contragentRepository.findAll();
    }

    public void saveContragent(Contragent contragent){
        contragentRepository.save(contragent);
    }

    public Contragent getOneContragent(String name){
        return contragentRepository.findByName(name);
    }
}
