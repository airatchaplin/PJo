package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.models.DetailOrderInfo;
import com.example.pozhiloyproject.repository.DetailOrderInfoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DetailOrderInfoService {

    @Autowired
    DetailOrderInfoRepository detailOrderInfoRepository;

    public void saveDetailOrderInfo(DetailOrderInfo detailOrderInfo){
        detailOrderInfoRepository.save(detailOrderInfo);
    }

    public void deleteDetailOrderInfo(DetailOrderInfo detailOrderInfo) {
        detailOrderInfoRepository.delete(detailOrderInfo);
    }
}
