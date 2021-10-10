package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.models.completedOrder.CompletedDetailOrderList;
import com.example.pozhiloyproject.repository.CompletedDetailOrderListRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompletedDetailOrderListService {

    @Autowired
    CompletedDetailOrderListRepository completedDetailOrderListRepository;

    public void saveCompletedDetailOrderList(CompletedDetailOrderList completedDetailOrderList){
        completedDetailOrderListRepository.save(completedDetailOrderList);
    }
}
