package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.models.completedOrder.CompletedDetailOrder;
import com.example.pozhiloyproject.repository.CompletedDetailOrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompletedDetailOrderService {

    @Autowired
    CompletedDetailOrderRepository completedDetailOrderRepository;

    public void saveCompletedDetailOrder (CompletedDetailOrder completedDetailOrder){
        completedDetailOrderRepository.save(completedDetailOrder);
    }
}
