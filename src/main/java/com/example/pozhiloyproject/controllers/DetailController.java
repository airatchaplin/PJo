package com.example.pozhiloyproject.controllers;

import com.example.pozhiloyproject.dto.DetailDto;
import com.example.pozhiloyproject.dto.DetailInfoDto;
import com.example.pozhiloyproject.helper.Db;
import com.example.pozhiloyproject.models.*;
import com.example.pozhiloyproject.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * Контроллер деталей
 */
@Controller
public class DetailController {

    @Autowired
    DetailService detailService;

    @Autowired
    WorkBenchService workBenchService;

    @Autowired
    MaterialService materialService;

    @Autowired
    UserService userService;

    @Autowired
    TypeOperationService typeOperationService;

    @Autowired
    SubsequenceTypeOperationService subsequenceTypeOperationService;
    @Autowired
    DetailInfoService detailInfoService;

    @Autowired
    Db db;

    /**
     * Страница всех деталей метод GET
     *
     * @param model Модель
     * @return Страница всех деталей
     */
    @GetMapping("/details")
    public String getAllDetails(Model model) {
        User user = userService.getUserWeb();
        if (user.getFilter_details() != null) {
            switch (user.getFilter_details()) {
                case "thickness" -> model.addAttribute("details", DetailDto.compareMaterialThickness(detailService.getAllDetails()));
                case "details" -> model.addAttribute("details", DetailDto.compareDetailName(detailService.getAllDetails()));
                case "materials" -> model.addAttribute("details", DetailDto.compareMaterialName(detailService.getAllDetails()));
            }
        } else {
            model.addAttribute("details", detailService.getAllDetails());
        }
        model.addAttribute("user", userService.getUserWeb());
        return "details";
    }

    /**
     * Страница всех деталей метод POST
     *
     * @param filter Фильтр
     * @return Страница всех деталей
     */
    @PostMapping("/details")
    public String getAllDetails(@RequestParam(required = false) String filter) {
        User user = userService.getUserWeb();
        switch (filter) {
            case "thickness" -> user.setFilter_details("thickness");
            case "details" -> user.setFilter_details("details");
            case "materials" -> user.setFilter_details("materials");
        }
        userService.saveUser(user);
        return "redirect:/details";
    }

    /**
     * Страница детали метод GET
     *
     * @param id    Идентификатор детали
     * @param model Модель
     * @return Страница детали
     */
    @GetMapping("/details/{id}")
    public String getOneDetail(@PathVariable(value = "id") String id, Model model) {
        model.addAttribute("detail", detailService.getDetailDtoById(UUID.fromString(id)));
        model.addAttribute("user", userService.getUserWeb());
        return "oneDetail";
    }

    /**
     * Страница добавления детали метод GET
     *
     * @param model Модель
     * @return Страница добавления детали
     */
    @GetMapping("/addDetail")
    public String addDetailGet(Model model) {
        model.addAttribute("details", DetailDto.compareMaterialName(detailService.getAllDetails()));
        model.addAttribute("workbenches", workBenchService.getAllWorkBench());
        model.addAttribute("materials", Material.compare(materialService.getAllMaterials()));
        model.addAttribute("user", userService.getUserWeb());
        model.addAttribute("operations", subsequenceTypeOperationService.getAllSubsequenceTypeOperation());
        for (TypeOperation typeOperation : typeOperationService.getAllTypeOperations()) {
            List<WorkBench> workBenches = workBenchService.getWorkBenchesFilterOperationName(typeOperation.getId());
            model.addAttribute(typeOperation.getName(), workBenches);
        }
        return "addDetail";
    }

    /**
     * Страница добавления детали метод POST
     *
     * @param detailName  Наименование детали
     * @param materialId  Идентификатор материала
     * @param workBenchId Список идентификаторов станков
     * @param timeWork    Список времяни
     * @param model       Модель
     * @return Страница всех деталей
     */
    @PostMapping("/addDetail")
    public String addDetailPost(@RequestParam(required = false) String detailName,
                                @RequestParam(required = false) String materialId,
                                @RequestParam(required = false) List<String> workBenchId,
                                @RequestParam(required = false) List<String> timeWork,
                                @RequestParam(required = false) String timePacking,
                                @RequestParam(required = false) List<String> comment,
                                Model model) {
        detailName = detailName.replace(",", ".");
        if (detailService.checkDetail(detailName)) {
            model.addAttribute("details", detailService.getAllDetails());
            model.addAttribute("workbenches", workBenchService.getAllWorkBench());
            model.addAttribute("materials", materialService.getAllMaterials());
            model.addAttribute("operations", subsequenceTypeOperationService.getAllSubsequenceTypeOperation());
            model.addAttribute("detailError", "Деталь с таким наименованием уже существует. Придумайте другое название!");
            return "addDetail";
        }
        Detail detail = new Detail();
        detail.setId(UUID.randomUUID());
        detail.setName(detailName);
        detail.setMaterial(materialId.equals("Выберите материал") ? null : materialService.getOneMaterial(UUID.fromString(materialId)));


        List<WorkBench> workBenches = new ArrayList<>();
        for (String id : workBenchId) {
            if (!id.equals("Выберите станок")) {
                WorkBench workBench = workBenchService.getOneWorkBenchById(UUID.fromString(id));
                workBenches.add(workBench);
            }
        }
        List<DetailInfo> detailInfos = new ArrayList<>();
        for (int i = 0; i < workBenches.size(); i++) {
            DetailInfo detailInfo = new DetailInfo();
            detailInfo.setId(UUID.randomUUID());
            detailInfo.setTimeWork(timeWork.get(i));
            detailInfo.setComment(comment.get(i));
            detailInfo.setPriority(i);
            detailInfo.setWorkBenches(workBenches.get(i));
            detailInfos.add(detailInfo);
            detailInfoService.saveDetailInfo(detailInfo);

        }
        detail.setTimePacking(timePacking);
        detail.setDetailInfos(detailInfos);
        detailService.saveDetail(detail);
        return "redirect:/details/" + detail.getId();
    }

    /**
     * Страница удаления детали метод GET
     *
     * @param id    Идентификатор детали
     * @param model Модель
     * @return Страница удаления детали
     */
    @GetMapping("details/deletion/{id}")
    public String deletionDetailGet(@PathVariable(value = "id") String id, Model model) {
        model.addAttribute("detail", detailService.getDetailDtoById(UUID.fromString(id)));
        model.addAttribute("user", userService.getUserWeb());
        return "deletionDetail";
    }

    /**
     * Страница удаления детали метод POST
     *
     * @param id    Идентификатор детали
     * @param model Модель
     * @return Страница всех деталей
     */
    @PostMapping("details/deletion/{id}")
    public String deletionDetailPost(@PathVariable(value = "id") String id, Model model) {
        try {
            detailService.deleteDetail(detailService.getDetailById(UUID.fromString(id)));
        } catch (Exception e) {
            model.addAttribute("detail", detailService.getDetailDtoById(UUID.fromString(id)));
            model.addAttribute("check", true);
            model.addAttribute("detailError", "Деталь нельзя удалить, потому что она используется в заказах!");
            return "deletionDetail";
        }
        return "redirect:/details";
    }

    /**
     * Страница изменения детали метод GET
     *
     * @param id    Идентификатор детали
     * @param model Модель
     * @return Страница изменения детали
     */
    @GetMapping("details/change/{id}")
    public String changeDetailGet(@PathVariable(value = "id") String id, Model model) {
        model.addAttribute("detail", detailService.getDetailDtoById(UUID.fromString(id)));
        model.addAttribute("materials", Material.compare(materialService.getAllMaterials()));
        model.addAttribute("workbenches", workBenchService.getAllWorkBench());
        model.addAttribute("user", userService.getUserWeb());
        for (TypeOperation typeOperation : typeOperationService.getAllTypeOperations()) {
            List<WorkBench> workBenches = workBenchService.getWorkBenchesFilterOperationName(typeOperation.getId());
            model.addAttribute(typeOperation.getName(), workBenches);
        }
        return "changeDetail";
    }

    /**
     * Страница изменения детали метод POST
     *
     * @param id         Идентификатор детали
     * @param detailName Наименование детали
     * @param materialId Идентификатор материала
     * @param timeWork   Список времени на станках детали
     * @param model      Модель
     * @return Страница всех деталей
     */
    @PostMapping("details/change/{id}")
    public String changeDetailPost(@PathVariable(value = "id") String id,
                                   @RequestParam(required = false) String detailName,
                                   @RequestParam(required = false) String materialId,
                                   @RequestParam(required = false) List<String> timeWork,
                                   @RequestParam(required = false) List<String> comment,
                                   @RequestParam(required = false) String timePacking,
                                   Model model) {

        Detail detail = detailService.getDetailById(UUID.fromString(id));
        detail.setName(detailName);
        detail.setMaterial(materialService.getOneMaterial(UUID.fromString(materialId)));
        detail.setTimePacking(timePacking);
        for (int i = 0; i < detail.getDetailInfos().size(); i++) {
            detail.getDetailInfos().get(i).setTimeWork(timeWork.get(i));
            detail.getDetailInfos().get(i).setComment(comment.get(i));
            detailInfoService.saveDetailInfo(detail.getDetailInfos().get(i));
        }
        detailService.saveDetail(detail);
        return "redirect:/details/" + id;
    }

    @GetMapping("details/addWorkbench/{id}")
    public String addWorkBenchForDetail(@PathVariable(value = "id") String id,Model model) {
        DetailDto detailDtoById = detailService.getDetailDtoById(UUID.fromString(id));
        List<DetailInfoDto> detailInfoDtos = detailDtoById.getDetailInfoDtos();
        List<DetailInfoDto> das = new ArrayList<>();
        das.add(detailInfoDtos.get(2));
        das.add(detailInfoDtos.get(0));
        das.add(detailInfoDtos.get(1));
        detailDtoById.setDetailInfoDtos(das);
        model.addAttribute("detail", detailDtoById);
        model.addAttribute("workbenches", workBenchService.getUniqueWorkBench(UUID.fromString(id)));
        model.addAttribute("materials", Material.compare(materialService.getAllMaterials()));
        model.addAttribute("user", userService.getUserWeb());
        model.addAttribute("operations", subsequenceTypeOperationService.getAllSubsequenceTypeOperation());
        for (TypeOperation typeOperation : typeOperationService.getAllTypeOperations()) {
            List<WorkBench> workBenches = workBenchService.getWorkBenchesFilterOperationName(typeOperation.getId());
            model.addAttribute(typeOperation.getName(), workBenches);
        }
        return "addWorkbenchForDetail";
    }

    @PostMapping("details/addWorkbench/{id}")
    public String addWorkBenchForDetail(@PathVariable(value = "id") String id) {

        return "addWorkbenchForDetail";
    }
}
