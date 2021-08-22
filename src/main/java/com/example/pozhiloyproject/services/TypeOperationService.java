package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.models.TypeOperation;
import com.example.pozhiloyproject.repository.TypeOperationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

/**
 * Сервис типов операций
 */
@Service
public class TypeOperationService {

    @Autowired
    TypeOperationRepository typeOperationRepository;

    public List<TypeOperation> getAllTypeOperations() {
        return typeOperationRepository.findAll();
    }

    /**
     * Сохранение типа операции
     *
     * @param typeOperation Тип операции
     */
    public void save(TypeOperation typeOperation) {
        typeOperationRepository.save(typeOperation);
    }

    /**
     * Получение типа операции по id
     *
     * @param id Идентификатор типа операции
     * @return Тип операции
     */
    public TypeOperation getOneTypeOperation(UUID id) {
        return typeOperationRepository.findById(id).orElseThrow();
    }

    /**
     * Удаление типа операции
     *
     * @param typeOperation Тип операции
     */
    public void deleteTypeOperation(TypeOperation typeOperation) {
        typeOperationRepository.delete(typeOperation);
    }
}
