package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.models.detail.DetailsOrder;
import com.example.pozhiloyproject.repository.DetailsOrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Сервис деталей в заказе
 */
@Service
public class DetailsOrderService {

    /**
     * Репозиторий деталей в заказе
     */
    @Autowired
    DetailsOrderRepository detailInfoRepository;

    /**
     * Сохранение детали в заказе
     *
     * @param detailsOrder Деталь в заказе
     */
    public void saveDetailInfo(DetailsOrder detailsOrder) {
        detailInfoRepository.save(detailsOrder);
    }
}
