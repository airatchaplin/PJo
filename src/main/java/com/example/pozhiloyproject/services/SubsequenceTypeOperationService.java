package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.models.SubsequenceTypeOperation;
import com.example.pozhiloyproject.repository.SubsequenceTypeOperationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

/**
 * Сервис последовательноси операций
 */
@Service
public class SubsequenceTypeOperationService {

    @Autowired
    SubsequenceTypeOperationRepository subsequenceTypeOperationRepository;

    /**
     * Сохранение последовательности операции
     *
     * @param subsequenceTypeOperation Последовательность операции
     */
    public void saveSubsequenceTypeOperation(SubsequenceTypeOperation subsequenceTypeOperation) {
        subsequenceTypeOperationRepository.save(subsequenceTypeOperation);
    }

    /**
     * Получение всех последовательностей операции
     *
     * @return Список последовательностей операции
     */
    public List<SubsequenceTypeOperation> getAllSubsequenceTypeOperation() {
        return subsequenceTypeOperationRepository.findAll();
    }

    /**
     * Получение последовательности операции по id
     *
     * @param id Идентификатор последовательности операции
     * @return Последовательность операции
     */
    public SubsequenceTypeOperation getOneSubsequenceTypeOperation(UUID id) {
        return subsequenceTypeOperationRepository.findById(id).orElseThrow();
    }

    /**
     * Удаление последовательности операции
     *
     * @param subsequenceTypeOperation Последовательность операции
     */
    public void deleteSubsequenceTypeOperation(SubsequenceTypeOperation subsequenceTypeOperation) {
        subsequenceTypeOperationRepository.delete(subsequenceTypeOperation);
    }
}
