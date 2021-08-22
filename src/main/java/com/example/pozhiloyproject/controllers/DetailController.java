package com.example.pozhiloyproject.controllers;

import com.example.pozhiloyproject.dto.DetailDto;
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
    TimeWorkDetailService timeWorkDetailService;

    @Autowired
    UserService userService;

    @Autowired
    TypeOperationService typeOperationService;

    @Autowired
    SubsequenceTypeOperationService subsequenceTypeOperationService;

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
        model.addAttribute("details", detailService.getAllDetails());
        model.addAttribute("user", userService.getUserWeb());
        return "details";
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
        model.addAttribute("details", DetailDto.compare(detailService.getAllDetails()));
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
     * @param length      Длина детали
     * @param width       Ширина детали
     * @param materialId  Идентификатор материала
     * @param workBenchId Список идентификаторов станков
     * @param timeWork    Список времяни
     * @param model       Модель
     * @return Страница всех деталей
     */
    @PostMapping("/addDetail")
    public String addDetailPost(@RequestParam(required = false) String detailName,
                                @RequestParam(required = false) String length,
                                @RequestParam(required = false) String width,
                                @RequestParam(required = false) String materialId,
                                @RequestParam(required = false) List<String> workBenchId,
                                @RequestParam(required = false) List<String> timeWork,
                                Model model) {
        detailName = detailName.replace(",", ".");
        if (detailService.checkDetail(detailName)) {
            model.addAttribute("details", detailService.getAllDetails());
            model.addAttribute("workbenches", workBenchService.getAllWorkBench());
            model.addAttribute("materials", materialService.getAllMaterials());
            model.addAttribute("detailError", "Деталь с таким наименованием уже существует. Придумайте другое название!");
            return "addDetail";
        }
        Detail detail = new Detail();
        detail.setId(UUID.randomUUID());
        detail.setName(detailName);
        detail.setLength(length);
        detail.setWidth(width);
        detail.setMaterial(materialId.equals("Выберите материал") ? null : materialService.getOneMaterial(UUID.fromString(materialId)));

        List<UUID> idWorkBenches = new ArrayList<>();
        List<WorkBench> workBenches = new ArrayList<>();
        for (String id : workBenchId) {
            if (!id.equals("Выберите станок")) {
                WorkBench workBench = workBenchService.getOneWorkBenchById(UUID.fromString(id));
                workBenches.add(workBench);
                idWorkBenches.add(workBench.getId());
            }
        }
        List<UUID> idTimeWorks = new ArrayList<>();
        List<TimeWorkDetail> timeWorkDetailsList = new ArrayList<>();
        for (String time : timeWork) {
            if (!time.equals("")) {
                TimeWorkDetail timeWorkDetail = new TimeWorkDetail();
                timeWorkDetail.setId(UUID.randomUUID());
                timeWorkDetail.setTimeWork(time);
                timeWorkDetailService.saveTimeWorkDetail(timeWorkDetail);
                timeWorkDetailsList.add(timeWorkDetail);
                idTimeWorks.add(timeWorkDetail.getId());
            }
        }
        detail.setTimeWorkDetails(timeWorkDetailsList);
        detail.setWorkBenches(workBenches);
        detailService.saveDetail(detail);

        for (int i = 0; i < idWorkBenches.size(); i++) {
            db.execute("update details_work_benches  set priority =" + i
                    + " where detail_id = '" + detail.getId()
                    + "' and work_benches_id ='" + idWorkBenches.get(i) + "'");
            db.execute("update details_time_work_details  set priority =" + i
                    + " where detail_id = '" + detail.getId()
                    + "' and time_work_details_id ='" + idTimeWorks.get(i) + "'");
        }
        return "redirect:/details";
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
        model.addAttribute("materials", materialService.getAllMaterials());
        model.addAttribute("workbenches", workBenchService.getAllWorkBench());
        model.addAttribute("user", userService.getUserWeb());
        return "changeDetail";
    }

    /**
     * Страница изменения детали метод POST
     *
     * @param id          Идентификатор детали
     * @param detailName  Наименование детали
     * @param materialId  Идентификатор материала
     * @param length      Длина детали
     * @param width       Ширина детали
     * @param workBenchId Список идентификторов станков детали
     * @param timeWork    Список времени на станках детали
     * @param model       Модель
     * @return Страница всех деталей
     */
    @PostMapping("details/change/{id}")
    public String changeDetailPost(@PathVariable(value = "id") String id,
                                   @RequestParam(required = false) String detailName,
                                   @RequestParam(required = false) String materialId,
                                   @RequestParam(required = false) String length,
                                   @RequestParam(required = false) String width,
                                   @RequestParam(required = false) List<String> workBenchId,
                                   @RequestParam(required = false) List<String> timeWork,
                                   Model model) {

        Detail detail = detailService.getDetailById(UUID.fromString(id));
        detail.setName(detailName);
        detail.setLength(length);
        detail.setWidth(width);
        detail.setMaterial(materialService.getOneMaterial(UUID.fromString(materialId)));
        List<WorkBench> workBenchList = new ArrayList<>();
        List<TimeWorkDetail> timeWorkDetailsList = new ArrayList<>();
        for (int i = 0; i < workBenchId.size(); i++) {
            detail.getTimeWorkDetails().get(i).setTimeWork(timeWork.get(i));
            workBenchList.add(workBenchService.getOneWorkBenchById(UUID.fromString(workBenchId.get(i).replace("Выбранная: ", ""))));
        }
        detail.setWorkBenches(workBenchList);

        detailService.saveDetail(detail);
        return "redirect:/details";
    }
}
