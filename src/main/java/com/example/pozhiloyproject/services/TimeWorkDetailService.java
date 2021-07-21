package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.models.TimeWorkDetail;
import com.example.pozhiloyproject.repository.TimeWorkDetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.Id;
import java.util.List;
import java.util.UUID;

@Service
public class TimeWorkDetailService {

    @Autowired
    TimeWorkDetailRepository timeWorkDetailRepository;

    public void saveTimeWorkDetail(TimeWorkDetail timeWorkDetail){

        timeWorkDetailRepository.save(timeWorkDetail);
    }

    public List<TimeWorkDetail> getAllTimeWorkDetail(){
        return timeWorkDetailRepository.findAll();
    }


}
