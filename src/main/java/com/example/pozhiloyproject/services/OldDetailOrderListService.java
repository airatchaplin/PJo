package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.models.oldOrder.OldDetailOrderList;
import com.example.pozhiloyproject.repository.OldDetailOrderListRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OldDetailOrderListService {

    @Autowired
    OldDetailOrderListRepository oldDetailOrderListRepository;

    public void saveOldDetailOrderList(OldDetailOrderList oldDetailOrderList){
        oldDetailOrderListRepository.save(oldDetailOrderList);
    }

    public void deleteOldDetailOrderList(OldDetailOrderList oldDetailOrderList) {
        oldDetailOrderListRepository.delete(oldDetailOrderList);
    }
}
