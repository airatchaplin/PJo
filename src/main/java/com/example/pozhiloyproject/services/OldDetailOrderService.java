package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.models.oldOrder.OldDetailOrder;
import com.example.pozhiloyproject.repository.OldDetailOrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OldDetailOrderService {

    @Autowired
    OldDetailOrderRepository oldDetailOrderRepository;

    public void saveOldDetailOrder(OldDetailOrder oldDetailOrder){
        oldDetailOrderRepository.save(oldDetailOrder);
    }
}
