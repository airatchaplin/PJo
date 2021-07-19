package com.example.pozhiloyproject.controllers;

import com.example.pozhiloyproject.models.Material;
import com.example.pozhiloyproject.services.MaterialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.UUID;

@Controller
public class MaterialController {

    @Autowired
    MaterialService materialService;

    @GetMapping("/materials")
    public String getAllMaterials(Model model){
        model.addAttribute("materials",materialService.getAllMaterials());
        return "materials";
    }

    @GetMapping("/addMaterial")
    public String addMaterialGet(){
        return "addMaterial";
    }

    @PostMapping("/addMaterial")
    public String addMaterialPost(@RequestParam(required = false) String materialName){
        Material material = new Material();
        material.setId(UUID.randomUUID());
        material.setName(materialName);
        materialService.saveMaterial(material);
        return "redirect:/materials";
    }
}
