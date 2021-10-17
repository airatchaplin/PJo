package com.example.pozhiloyproject.controllers;

import com.example.pozhiloyproject.models.Material;
import com.example.pozhiloyproject.models.setting.SettingView;
import com.example.pozhiloyproject.services.MaterialService;
import com.example.pozhiloyproject.services.SettingService;
import com.example.pozhiloyproject.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

/**
 * Контроллер материалов
 */
@Controller
public class MaterialController {

    @Autowired
    MaterialService materialService;

    @Autowired
    UserService userService;

    @Autowired
    SettingService settingService;

    /**
     * Страница всех материалов метод GET
     *
     * @param model Модель
     * @return Страница всех матриалов
     */
    @GetMapping("/materials")
    public String getAllMaterials(Model model) {
        model.addAttribute("materials", Material.compare(materialService.getAllMaterials()));
        model.addAttribute("user", userService.getUserWeb());
        List<SettingView> settingViews = settingService.getSetting().getSettingViews();
        model.addAttribute("setting",settingViews.stream().filter(x -> x.getName().equals("Материалы")).collect(Collectors.toList()));
        return "materials";
    }

    /**
     * Страница добавления материала метод GET
     *
     * @param model Модель
     * @return Страница добавления материала
     */
    @GetMapping("/addMaterial")
    public String addMaterialGet(Model model) {
        model.addAttribute("user", userService.getUserWeb());
        return "addMaterial";
    }

    /**
     * Страница добавления материала метод POST
     *
     * @param materialName Наименование материала
     * @param thickness    Толщина материала
     * @param model        Модель
     * @return Страница всех матриалов
     */
    @PostMapping("/addMaterial")
    public String addMaterialPost(@RequestParam(required = false) String materialName, @RequestParam(required = false) String thickness, Model model) {
        if (materialService.checkMaterial(materialName, thickness)) {
            model.addAttribute("materials", materialService.getAllMaterials());
            model.addAttribute("user", userService.getUserWeb());
            model.addAttribute("materialNameRepeatError", "Материал с таким наименованием и толщиной уже существует. Придумайте другое название и толщину!");
            return "addMaterial";
        }

        if (thickness.contains(",")) {
            thickness = thickness.replace(",", ".");
        }

        Material material = new Material();
        material.setId(UUID.randomUUID());
        material.setName(materialName);
        material.setThickness(Double.valueOf(thickness));
        materialService.saveMaterial(material);
        return "redirect:/materials";
    }

    /**
     * Страница материала метод GET
     *
     * @param id    Идентификатор материала
     * @param model Модель
     * @return Страница материала
     */
    @GetMapping("materials/{id}")
    public String getOneMaterial(@PathVariable(name = "id") String id, Model model) {
        model.addAttribute("material", materialService.getOneMaterial(UUID.fromString(id)));
        model.addAttribute("user", userService.getUserWeb());
        List<SettingView> settingViews = settingService.getSetting().getSettingViews();
        model.addAttribute("setting",settingViews.stream().filter(x -> x.getName().equals("Материалы")).collect(Collectors.toList()));
        return "oneMaterial";
    }

    /**
     * Страница изменения материала метод GET
     *
     * @param id    Идентификатор материала
     * @param model Модель
     * @return Страница изменения материала
     */
    @GetMapping("materials/change/{id}")
    public String changeMaterialGet(@PathVariable(name = "id") String id, Model model) {
        model.addAttribute("material", materialService.getOneMaterial(UUID.fromString(id)));
        model.addAttribute("user", userService.getUserWeb());
        return "changeMaterial";
    }

    /**
     * Страница измененеия материала метод POST
     *
     * @param id           Идентификатор материала
     * @param materialName Наименование матераила
     * @param thickness    Толщина материала
     * @param model        Модель
     * @return Страница всех материалов
     */
    @PostMapping("materials/change/{id}")
    public String changeMaterialPost(@PathVariable(name = "id") String id,
                                     @RequestParam(required = false) String materialName, @RequestParam(required = false) String thickness, Model model) {
        if (materialService.checkMaterial(materialName, thickness)) {
            model.addAttribute("material", materialService.getOneMaterial(UUID.fromString(id)));
            model.addAttribute("user", userService.getUserWeb());
            model.addAttribute("materialNameRepeatError", "Материал с таким наименованием и толщиной уже существует!");
            return "changeMaterial";
        }

        Material material = materialService.getOneMaterial(UUID.fromString(id));
        material.setName(materialName);
        material.setThickness(Double.valueOf(thickness));
        materialService.saveMaterial(material);
        return "redirect:/materials";
    }

    /**
     * Страница удаления метод GET
     *
     * @param id    Идентификатор материала
     * @param model Модель
     * @return Страница удаления
     */
    @GetMapping("materials/deletion/{id}")
    public String deleteMaterialGet(@PathVariable(name = "id") String id, Model model) {
        model.addAttribute("material", materialService.getOneMaterial(UUID.fromString(id)));
        model.addAttribute("user", userService.getUserWeb());
        return "deletionMaterial";
    }

    /**
     * Страница удаления метод POST
     *
     * @param id    Идентификатор материала
     * @param model Модель
     * @return Страница всех материалов
     */
    @PostMapping("materials/deletion/{id}")
    public String deleteMaterialPost(@PathVariable(name = "id") String id, Model model) {
        try {
            materialService.deleteMaterial(materialService.getOneMaterial(UUID.fromString(id)));
        } catch (Exception e) {
            model.addAttribute("user", userService.getUserWeb());
            model.addAttribute("material", materialService.getOneMaterial(UUID.fromString(id)));
            model.addAttribute("materialError", "Материал нельзя удалить, потому что он используется в заказах!");
            return "deletionMaterial";
        }

        return "redirect:/materials";
    }
}
