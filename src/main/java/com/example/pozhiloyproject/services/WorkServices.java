package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.models.Work;
import com.example.pozhiloyproject.repository.WorkRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WorkServices {
    @Autowired
    WorkRepo workrepo;
    public void saveWork(Work work){
        workrepo.save(work);
    }
    public Work find(Long id){
        return workrepo.findById(id).orElseThrow();
    }
    public List<Work> findAll(){
        return workrepo.findAll();
    }
}
