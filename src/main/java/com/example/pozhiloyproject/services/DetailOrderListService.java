package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.models.detail.DetailOrderList;
import com.example.pozhiloyproject.repository.DetailOrderListRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DetailOrderListService {

    @Autowired
    DetailOrderListRepository detailOrderListRepository;

    public void saveDetailOrderList(DetailOrderList detailOrderList){
        detailOrderListRepository.save(detailOrderList);
    }
}
