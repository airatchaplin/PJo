package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.dto.TimeWorkDetailDto;
import com.example.pozhiloyproject.models.TimeWorkDetail;
import com.example.pozhiloyproject.repository.TimeWorkDetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.Id;
import java.util.List;
import java.util.UUID;

/**
 * Сервис времени работы детали
 */
@Service
public class TimeWorkDetailService {

    @Autowired
    TimeWorkDetailRepository timeWorkDetailRepository;

    /**
     * Сохранение времени работы детали
     *
     * @param timeWorkDetail Время работы детали
     */
    public void saveTimeWorkDetail(TimeWorkDetail timeWorkDetail) {
        timeWorkDetailRepository.save(timeWorkDetail);
    }

    /**
     * Получение времени работы детали по id
     *
     * @param id Идентификатор времени работы детали
     * @return TimeWorkDetailDto
     */
    public TimeWorkDetailDto getTimeWorkDetailDtoById(UUID id) {
        TimeWorkDetail timeWorkDetail = timeWorkDetailRepository.findById(id).orElseThrow();
        TimeWorkDetailDto timeWorkDetailDto = new TimeWorkDetailDto();

        timeWorkDetailDto.setId(timeWorkDetail.getId());
        timeWorkDetailDto.setTimeWork(timeWorkDetail.getTimeWork());

        return timeWorkDetailDto;
    }
}
