package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.models.SubsequenceTypeOperation;
import com.example.pozhiloyproject.repository.SubsequenceTypeOperationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class SubsequenceTypeOperationService {

    @Autowired
    SubsequenceTypeOperationRepository subsequenceTypeOperationRepository;

    public void saveSubsequenceTypeOperation(SubsequenceTypeOperation subsequenceTypeOperation){
        subsequenceTypeOperationRepository.save(subsequenceTypeOperation);
    }

    public List<SubsequenceTypeOperation> getAllSubsequenceTypeOperation(){
        return subsequenceTypeOperationRepository.findAll();
    }

    public SubsequenceTypeOperation getOneSubsequenceTypeOperation(UUID id){
        return subsequenceTypeOperationRepository.findById(id).orElseThrow();
    }

    public void deleteSubsequenceTypeOperation(SubsequenceTypeOperation subsequenceTypeOperation) {
        subsequenceTypeOperationRepository.delete(subsequenceTypeOperation);
    }
}
