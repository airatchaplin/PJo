package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.models.TypeOperation;
import com.example.pozhiloyproject.repository.TypeOperationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
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
        Optional<TypeOperation> typeOperation = typeOperationRepository.findById(id);
        return typeOperation.orElse(new TypeOperation());
    }

    /**
     * Удаление типа операции
     *
     * @param typeOperation Тип операции
     */
    public void deleteTypeOperation(TypeOperation typeOperation) {
        typeOperationRepository.delete(typeOperation);
    }

    /**
     * Проверка при добавлении типа операции
     *
     * @param name Наименование операции
     * @return Результат
     */
    public boolean checkAddTypeOperation(String name) {
        TypeOperation findTypeOperation = typeOperationRepository.findByName(name);
        return findTypeOperation != null;
    }

    /**
     * Проверка при добавлении типа операции
     *
     * @param id   Идентификатор операции
     * @param name Наименование операции
     * @return Результат
     */
    public boolean checkAddTypeOperation(UUID id, String name) {
        TypeOperation currentTypeOperation = getOneTypeOperation(id);
        TypeOperation findTypeOperation = typeOperationRepository.findByName(name);
        if (currentTypeOperation.equals(findTypeOperation)) {
            return false;
        } else if (findTypeOperation != null && !findTypeOperation.equals(currentTypeOperation)) {
            return true;
        } else if (findTypeOperation == null) {
            return false;
        }
        return false;
    }
}
