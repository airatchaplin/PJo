package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.models.WorkBench;
import com.example.pozhiloyproject.repository.WorkBenchRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

/**
 * Сервис станков
 */
@Service
public class WorkBenchService {

    @Autowired
    WorkBenchRepository workBenchRepository;

    /**
     * Сохранение станка
     *
     * @param workBench Станок
     */
    public void save(WorkBench workBench) {
        workBenchRepository.save(workBench);
    }

    /**
     * Получение всех станков
     *
     * @return Список всех станков
     */
    public List<WorkBench> getAllWorkBench() {
        return workBenchRepository.findAll();
    }

    /**
     * Получение станка по наименованию
     *
     * @param name Наименование станка
     * @return Станок
     */
    public WorkBench getOneWorkBenchByName(String name) {
        return workBenchRepository.findByName(name);
    }

    /**
     * Получение станка по наименованию
     *
     * @param id Идентификатор станка
     * @return Станок
     */
    public WorkBench getOneWorkBenchById(UUID id) {
        return workBenchRepository.findById(id).orElseThrow();
    }

    /**
     * Удаление станка
     *
     * @param workBench Станок
     */
    public void deleteWorkBench(WorkBench workBench) {
        workBenchRepository.delete(workBench);
    }

    /**
     * Получение станков по фильтру типа операции
     *
     * @param id Идентификатор типа операции
     * @return Список станков
     */
    public List<WorkBench> getWorkBenchesFilterOperationName(UUID id) {
        return workBenchRepository.findByWorkBenchesFilterOperationName(id);
    }
}
