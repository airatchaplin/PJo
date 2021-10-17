package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.models.detail.DetailOrder;
import com.example.pozhiloyproject.repository.DetailOrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DetailOrderService {

    @Autowired
    DetailOrderRepository detailOrderRepository;

    public void saveDetailOrder(DetailOrder detailOrder){
        detailOrderRepository.save(detailOrder);
    }
}
