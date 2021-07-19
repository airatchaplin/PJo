package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.models.WorkBench;
import com.example.pozhiloyproject.repository.WorkBenchRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WorkBenchService {

    @Autowired
    WorkBenchRepository workBenchRepository;

    public void save(WorkBench workBench){
        workBenchRepository.save(workBench);
    }

    public List<WorkBench> getAllWorkBench(){
        return workBenchRepository.findAll();
    }

    public WorkBench getOneWorkBench(String name){
        return workBenchRepository.findByName(name);
    }
}
