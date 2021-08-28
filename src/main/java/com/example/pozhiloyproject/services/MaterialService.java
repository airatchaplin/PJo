package com.example.pozhiloyproject.services;

import com.example.pozhiloyproject.models.Material;
import com.example.pozhiloyproject.repository.MaterialRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * Сервис материалов
 */
@Service
public class MaterialService {

    @Autowired
    MaterialRepository materialsRepository;

    /**
     * Получить список всех материалов
     *
     * @return Список всех материалов
     */
    public List<Material> getAllMaterials() {
        return materialsRepository.findAll();
    }

    /**
     * Сохранение материала
     *
     * @param material Материал
     */
    public void saveMaterial(Material material) {
        materialsRepository.save(material);
    }

    /**
     * Получение материала по id
     *
     * @param id Идентификатор материала
     * @return Материал
     */
    public Material getOneMaterial(UUID id) {
        return materialsRepository.findById(id).orElseThrow();
    }

    /**
     * Удаление матерериала
     *
     * @param material Материал
     */
    public void deleteMaterial(Material material) {
        materialsRepository.delete(material);
    }

    public boolean checkMaterial(String name, String thickness) {
        List<Material> materials = materialsRepository.findAllByName(name);
        if (thickness.contains(",")) {
            thickness = thickness.replace(",", ".");
        }
        double finalThickness = Double.parseDouble(thickness);
        return materials.stream().anyMatch(material -> material.getThickness().equals(finalThickness));
    }


}
