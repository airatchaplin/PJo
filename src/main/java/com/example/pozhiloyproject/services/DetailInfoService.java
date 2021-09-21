package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.models.DetailInfo;
import com.example.pozhiloyproject.repository.DetailInfoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DetailInfoService {

    @Autowired
    DetailInfoRepository detailInfoRepository;

    public void saveDetailInfo(DetailInfo detailInfo){
        detailInfoRepository.save(detailInfo);
    }
}
