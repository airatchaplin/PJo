package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.models.DetailInfo;
import com.example.pozhiloyproject.repository.DetailInfoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Сервис деталей в заказе
 */
@Service
public class DetailInfoService {

    /**
     * Репозиторий деталей в заказе
     */
    @Autowired
    DetailInfoRepository detailInfoRepository;

    /**
     * Сохранение детали в заказе
     *
     * @param detailInfo Деталь в заказе
     */
    public void saveDetailInfo(DetailInfo detailInfo) {
        detailInfoRepository.save(detailInfo);
    }
}
