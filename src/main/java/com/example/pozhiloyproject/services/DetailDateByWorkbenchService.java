package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.models.DetailDateByWorkbench;
import com.example.pozhiloyproject.repository.DetailDateByWorkbenchRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DetailDateByWorkbenchService {

    @Autowired
    DetailDateByWorkbenchRepository detailDateByWorkbenchRepository;

    public void saveDetailDateByWorkbench(DetailDateByWorkbench detailDateByWorkbench){
        detailDateByWorkbenchRepository.save(detailDateByWorkbench);
    }
}
