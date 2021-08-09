package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.models.Test;
import com.example.pozhiloyproject.repository.TestRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TestServices {
    @Autowired
    TestRepo testRepo;
    public void saveTest(Test test){
        testRepo.save(test);
    }
    public Test find(Long id){
        return testRepo.findById(id).orElseThrow();
    }
    public List<Test> findAll(){
        return testRepo.findAll();
    }
}
