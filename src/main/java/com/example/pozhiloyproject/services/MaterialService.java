package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.models.Material;
import com.example.pozhiloyproject.repository.MaterialRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class MaterialService {

    @Autowired
    MaterialRepository materialsRepository;

    public List<Material> getAllMaterials() {
        return materialsRepository.findAll();
    }

    public void saveMaterial(Material material) {
        materialsRepository.save(material);
    }

    public Material getOneMaterial(String name) {
        return materialsRepository.findByName(name);
    }

    public void deleteMaterial(Material material){
        materialsRepository.delete(material);
    }
}
