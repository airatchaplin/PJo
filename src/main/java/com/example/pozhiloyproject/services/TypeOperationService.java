package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.models.TypeOperation;
import com.example.pozhiloyproject.repository.TypeOperationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class TypeOperationService {

    @Autowired
    TypeOperationRepository typeOperationRepository;

    public List<TypeOperation> getAllTypeOperations(){
        return typeOperationRepository.findAll();
    }

    public void save(TypeOperation typeOperation) {
        typeOperationRepository.save(typeOperation);
    }

    public TypeOperation getOneTypeOperation(UUID id){
        return typeOperationRepository.findById(id).orElseThrow();
    }

    public void deleteTypeOperation(TypeOperation typeOperation) {
        typeOperationRepository.delete(typeOperation);
    }
}
