package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.models.Detail;
import com.example.pozhiloyproject.repository.DetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class DetailService {

    @Autowired
    DetailRepository detailRepository;


    //найти все детали
    public List<Detail> getAllDetails() {
        return detailRepository.findAll();
    }

    //найти  деталб по имени
    public Detail findByName(String name) {
        return detailRepository.findByName(name);
    }

    //сохранение детали
    public void saveDetail(Detail detail) {
        detailRepository.save(detail);
    }

    public List<Detail> findByNameArr(String... names) {
        List<Detail> details = new ArrayList<>();
        for (String name : names) {
            Detail detail = detailRepository.findByName(name);
            details.add(detail);
        }
        return details;
    }

}
