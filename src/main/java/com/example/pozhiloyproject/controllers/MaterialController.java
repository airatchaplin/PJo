package com.example.pozhiloyproject.controllers;

import com.example.pozhiloyproject.models.Material;
import com.example.pozhiloyproject.services.ManagerService;
import com.example.pozhiloyproject.services.MaterialService;
import com.example.pozhiloyproject.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.UUID;

@Controller
public class MaterialController {

    @Autowired
    MaterialService materialService;

    @Autowired
    ManagerService managerService;

    @Autowired
    UserService userService;

    @GetMapping("/materials")
    public String getAllMaterials(Model model) {
        model.addAttribute("materials", materialService.getAllMaterials());
        model.addAttribute("user",userService.getUserWeb());
        return "materials";
    }

    @GetMapping("/addMaterial")
    public String addMaterialGet(Model model) {
        model.addAttribute("user",userService.getUserWeb());
        return "addMaterial";
    }

    @PostMapping("/addMaterial")
    public String addMaterialPost(@RequestParam(required = false) String materialName,@RequestParam(required = false) String thickness,Model model) {
        Material findMaterial = null;
        try {
            findMaterial = materialService.getOneMaterial(materialName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (findMaterial!=null){
            model.addAttribute("material",materialService.getOneMaterial(materialName));
            model.addAttribute("materialNameRepeatError","Материал с таким названием уже существует! \nПридумайте другое название!");
        return "addMaterial";
        }
        Material material = new Material();
        material.setId(UUID.randomUUID());
        material.setName(materialName);
        material.setThickness(thickness);
        materialService.saveMaterial(material);
        return "redirect:/materials";
    }

    @GetMapping("materials/{nameMaterial}")
    public String getOneMaterial(@PathVariable(name = "nameMaterial") String nameMaterial, Model model) {
        model.addAttribute("material", materialService.getOneMaterial(nameMaterial));
        model.addAttribute("user",userService.getUserWeb());
        return "oneMaterial";
    }

    @GetMapping("materials/change/{nameMaterial}")
    public String changeMaterialGet(@PathVariable(name = "nameMaterial") String nameMaterial, Model model) {
        model.addAttribute("material", materialService.getOneMaterial(nameMaterial));
        model.addAttribute("user",userService.getUserWeb());
        return "changeMaterial";
    }

    @PostMapping("materials/change/{nameMaterial}")
    public String changeMaterialPost(@PathVariable(name = "nameMaterial") String nameMaterial,
                                     @RequestParam(required = false) String materialName,@RequestParam(required = false) String thickness, Model model) {
        Material findMaterial = null;
        try {
            findMaterial = materialService.getOneMaterial(materialName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (findMaterial!=null){
            model.addAttribute("material",materialService.getOneMaterial(nameMaterial));
            model.addAttribute("materialNameRepeatError","Материал с таким названием уже существует! \nПридумайте другое название!");
            return "changeMaterial";
        }
        Material material = materialService.getOneMaterial(nameMaterial);
        material.setName(materialName);
        material.setThickness(thickness);
        materialService.saveMaterial(material);
        return "redirect:/materials";
    }

    @GetMapping("materials/deletion/{nameMaterial}")
    public String deleteMaterialGet(@PathVariable(name = "nameMaterial") String nameMaterial, Model model) {
        model.addAttribute("material", materialService.getOneMaterial(nameMaterial));
        model.addAttribute("user",userService.getUserWeb());
        return "deletionMaterial";
    }

    @PostMapping("materials/deletion/{nameMaterial}")
    public String deleteMaterialPost(@PathVariable(name = "nameMaterial") String nameMaterial, Model model) {
        try {
            materialService.deleteMaterial(materialService.getOneMaterial(nameMaterial));
        } catch (Exception e) {
            model.addAttribute("material", materialService.getOneMaterial(nameMaterial));
            model.addAttribute("materialError", "Материал нельзя удалить, потому что он используется в заказах!");
            return "deletionMaterial";
        }

        return "redirect:/materials";
    }
}
