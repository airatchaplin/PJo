package com.example.pozhiloyproject.controllers;

import com.example.pozhiloyproject.dto.DetailDto;
import com.example.pozhiloyproject.dto.DetailInfoDto;
import com.example.pozhiloyproject.helper.Db;
import com.example.pozhiloyproject.models.*;
import com.example.pozhiloyproject.models.detail.Detail;
import com.example.pozhiloyproject.models.detail.DetailInfo;
import com.example.pozhiloyproject.models.detail.DetailList;
import com.example.pozhiloyproject.models.setting.SettingView;
import com.example.pozhiloyproject.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.*;
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
    SettingService settingService;

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
                case "thickness":
                    model.addAttribute("details", DetailDto.compareMaterialThickness(detailService.getAllDetails()));
                    break;
                case "details":
                    model.addAttribute("details", DetailDto.compareDetailName(detailService.getAllDetails()));
                    break;
                case "materials":
                    model.addAttribute("details", DetailDto.compareMaterialName(detailService.getAllDetails()));
                    break;
            }
        } else {
            model.addAttribute("details", detailService.getAllDetails());
        }
        List<SettingView> settingViews = settingService.getSetting().getSettingViews();
        model.addAttribute("setting",settingViews.stream().filter(x -> x.getName().equals("Детали")).collect(Collectors.toList()));
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
            case "thickness":
                user.setFilter_details("thickness");
                break;
            case "details":
                user.setFilter_details("details");
                break;
            case "materials":
                user.setFilter_details("materials");
                break;
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
        List<SettingView> settingViews = settingService.getSetting().getSettingViews();
        model.addAttribute("setting",settingViews.stream().filter(x -> x.getName().equals("Детали")).collect(Collectors.toList()));
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
                                @RequestParam(required = false) List<String> workBenchId1,
                                @RequestParam(required = false) List<String> timeWork,
                                @RequestParam(required = false) List<String> timeWork1,
                                @RequestParam(required = false) String timePacking,
                                @RequestParam(required = false) List<String> comment,
                                @RequestParam(required = false) List<String> comment1,
                                Model model) {
        detailName = detailName.replace(",", ".");
        if (detailService.checkDetail(detailName)) {
            model.addAttribute("details", detailService.getAllDetails());
            model.addAttribute("workbenches", workBenchService.getAllWorkBench());
            model.addAttribute("materials", materialService.getAllMaterials());
            model.addAttribute("user", userService.getUserWeb());
            model.addAttribute("operations", subsequenceTypeOperationService.getAllSubsequenceTypeOperation());
            model.addAttribute("detailError", "Деталь с таким наименованием уже существует. Придумайте другое название!");
            for (TypeOperation typeOperation : typeOperationService.getAllTypeOperations()) {
                List<WorkBench> workBenches = workBenchService.getWorkBenchesFilterOperationName(typeOperation.getId());
                model.addAttribute(typeOperation.getName(), workBenches);
            }
            return "addDetail";
        } else if (materialId.equals("Выберите материал")) {
            model.addAttribute("details", detailService.getAllDetails());
            model.addAttribute("workbenches", workBenchService.getAllWorkBench());
            model.addAttribute("materials", materialService.getAllMaterials());
            model.addAttribute("user", userService.getUserWeb());
            model.addAttribute("operations", subsequenceTypeOperationService.getAllSubsequenceTypeOperation());
            model.addAttribute("detailError", "Выбирите материал!");
            for (TypeOperation typeOperation : typeOperationService.getAllTypeOperations()) {
                List<WorkBench> workBenches = workBenchService.getWorkBenchesFilterOperationName(typeOperation.getId());
                model.addAttribute(typeOperation.getName(), workBenches);
            }
            return "addDetail";
        } else if (workBenchId == null && workBenchId1 == null) {
            model.addAttribute("details", detailService.getAllDetails());
            model.addAttribute("workbenches", workBenchService.getAllWorkBench());
            model.addAttribute("materials", materialService.getAllMaterials());
            model.addAttribute("user", userService.getUserWeb());
            model.addAttribute("operations", subsequenceTypeOperationService.getAllSubsequenceTypeOperation());
            model.addAttribute("detailError", "Выбирите станки!");
            for (TypeOperation typeOperation : typeOperationService.getAllTypeOperations()) {
                List<WorkBench> workBenches = workBenchService.getWorkBenchesFilterOperationName(typeOperation.getId());
                model.addAttribute(typeOperation.getName(), workBenches);
            }
            return "addDetail";
        }
        Detail detail = new Detail();
        detail.setId(UUID.randomUUID());
        detail.setName(detailName);
        detail.setMaterial(materialService.getOneMaterial(UUID.fromString(materialId)));

        List<DetailList> detailLists = Stream.of(detailService.getDetailLists(workBenchId, timeWork, comment, 1))
                .collect(Collectors.toList());

        if (workBenchId1 != null) {
            detailLists.add(detailService.getDetailLists(workBenchId1, timeWork1, comment1, 2));
        }

        detail.setTimePacking(timePacking);
        detail.setDetailLists(detailLists);
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
                                   @RequestParam(required = false) List<String> timeWork1,
                                   @RequestParam(required = false) List<String> comment,
                                   @RequestParam(required = false) List<String> comment1,
                                   @RequestParam(required = false) String timePacking,
                                   Model model) {
        Detail detail = detailService.getDetailById(UUID.fromString(id));
        detail.setName(detailName);
        detail.setMaterial(materialService.getOneMaterial(UUID.fromString(materialId)));
        detail.setTimePacking(timePacking);
        List<DetailList> detailLists = detail.getDetailLists();

        for (DetailList detailList : detailLists) {
            List<DetailInfo> detailInfos = detailList.getDetailInfos();
            DetailInfo.comparePriority(detailInfos);
            if (detailList.getMainOrAlternative() == 1) {
                for (int j = 0; j < detailInfos.size(); j++) {
                    DetailInfo detailInfo = detailInfos.get(j);
                    detailInfo.setTimeWork(timeWork.get(j));
                    if (comment != null && !comment.isEmpty()) {
                        detailInfo.setComment(comment.get(j));
                    }
                }
            } else if (detailList.getMainOrAlternative() == 2) {
                for (int j = 0; j < detailInfos.size(); j++) {
                    DetailInfo detailInfo = detailInfos.get(j);
                    detailInfo.setTimeWork(timeWork1.get(j));
                    if (comment1 != null && !comment1.isEmpty()) {
                        detailInfo.setComment(comment1.get(j));
                    }
                }
            }
        }
        detailService.saveDetail(detail);
        return "redirect:/details/" + id;
    }

    @GetMapping("details/addWorkbenchMain/{id}")
    public String addWorkBenchForDetail(@PathVariable(value = "id") String id, Model model) {
        model.addAttribute("detail", detailService.getDetailDtoById(UUID.fromString(id)));
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

    @GetMapping("details/addWorkbenchAlternative/{id}")
    public String addWorkBenchForDetail1(@PathVariable(value = "id") String id, Model model) {
        model.addAttribute("detail", detailService.getDetailDtoById(UUID.fromString(id)));
        model.addAttribute("workbenches", workBenchService.getUniqueWorkBench(UUID.fromString(id)));
        model.addAttribute("materials", Material.compare(materialService.getAllMaterials()));
        model.addAttribute("user", userService.getUserWeb());
        model.addAttribute("operations", subsequenceTypeOperationService.getAllSubsequenceTypeOperation());
        for (TypeOperation typeOperation : typeOperationService.getAllTypeOperations()) {
            List<WorkBench> workBenches = workBenchService.getWorkBenchesFilterOperationName(typeOperation.getId());
            model.addAttribute(typeOperation.getName(), workBenches);
        }
        return "addWorkbenchForDetail1";
    }

    @PostMapping("details/addWorkbenchMain/{id}")
    public String addWorkBenchForDetail(@PathVariable(value = "id") String id, Model model,
                                        @RequestParam(required = false) List<String> workbenchName,
                                        @RequestParam(required = false) List<String> timeWork,
                                        @RequestParam(required = false) List<String> comment) {
        Detail detail = detailService.getDetailById(UUID.fromString(id));
        DetailList detailList = detail.getDetailLists().get(0);
        List<DetailInfo> detailInfos = new ArrayList<>();
        Set<String> nameWorkbench = new HashSet<>(workbenchName);
        for (int i = 0; i < workbenchName.size(); i++) {
            DetailInfo detailInfo = new DetailInfo();
            detailInfo.setId(UUID.randomUUID());
            detailInfo.setWorkBenches(workBenchService.getOneWorkBenchByName(workbenchName.get(i)));
            detailInfo.setTimeWork(timeWork.get(0));
            detailInfo.setComment(comment.get(i));
            detailInfo.setPriority(i);
            detailInfos.add(detailInfo);
        }
        if (nameWorkbench.size() < detailInfos.size()) {
            model.addAttribute("detail", detailService.getDetailDtoById(UUID.fromString(id)));
            model.addAttribute("workbenches", workBenchService.getUniqueWorkBench(UUID.fromString(id)));
            model.addAttribute("materials", Material.compare(materialService.getAllMaterials()));
            model.addAttribute("user", userService.getUserWeb());
            model.addAttribute("operations", subsequenceTypeOperationService.getAllSubsequenceTypeOperation());
            for (TypeOperation typeOperation : typeOperationService.getAllTypeOperations()) {
                List<WorkBench> workBenches = workBenchService.getWorkBenchesFilterOperationName(typeOperation.getId());
                model.addAttribute(typeOperation.getName(), workBenches);
            }
            model.addAttribute("countWorkbenchError", "Нельзя добавлять одинаковые станки!");
            return "addWorkbenchForDetail";
        }
        detail.getDetailLists().get(0).setDetailInfos(detailInfos);
        detailService.saveDetail(detail);
        return "redirect:/details/" + id;
    }

    @PostMapping("details/addWorkbenchAlternative/{id}")
    public String addWorkBenchForDetail1(@PathVariable(value = "id") String id, Model model,
                                         @RequestParam(required = false) List<String> workbenchName,
                                         @RequestParam(required = false) List<String> timeWork,
                                         @RequestParam(required = false) List<String> comment) {
        Detail detail = detailService.getDetailById(UUID.fromString(id));
        DetailList detailList = detail.getDetailLists().get(1);
        List<DetailInfo> detailInfos = new ArrayList<>();
        Set<String> nameWorkbench = new HashSet<>(workbenchName);
        for (int i = 0; i < workbenchName.size(); i++) {
            DetailInfo detailInfo = new DetailInfo();
            detailInfo.setId(UUID.randomUUID());
            detailInfo.setWorkBenches(workBenchService.getOneWorkBenchByName(workbenchName.get(i)));
            detailInfo.setTimeWork(timeWork.get(0));
            detailInfo.setComment(comment.get(i));
            detailInfo.setPriority(i);
            detailInfos.add(detailInfo);
        }
        if (nameWorkbench.size() < detailInfos.size()) {
            model.addAttribute("detail", detailService.getDetailDtoById(UUID.fromString(id)));
            model.addAttribute("workbenches", workBenchService.getUniqueWorkBench(UUID.fromString(id)));
            model.addAttribute("materials", Material.compare(materialService.getAllMaterials()));
            model.addAttribute("user", userService.getUserWeb());
            model.addAttribute("operations", subsequenceTypeOperationService.getAllSubsequenceTypeOperation());
            for (TypeOperation typeOperation : typeOperationService.getAllTypeOperations()) {
                List<WorkBench> workBenches = workBenchService.getWorkBenchesFilterOperationName(typeOperation.getId());
                model.addAttribute(typeOperation.getName(), workBenches);
            }
            model.addAttribute("countWorkbenchError", "Нельзя добавлять одинаковые станки!");
            return "addWorkbenchForDetail";
        }
        detail.getDetailLists().get(1).setDetailInfos(detailInfos);
        detailService.saveDetail(detail);
        return "redirect:/details/" + id;
    }

    /**
     * Страница добавления запасного варианта детали метод GET
     *
     * @param model Модель
     * @return Страница добавления запасного варианта детали
     */
    @GetMapping("/addAlternative/{id}")
    public String addAlternativeDetailGet(@PathVariable(value = "id") String id, Model model) {
        DetailDto detailDto = detailService.getDetailDtoById(UUID.fromString(id));
        List<DetailInfoDto> detailInfoDtos = detailDto.getDetailListDtos().get(0).getDetailInfoDtos();

        List<String> typeOperationsName = new ArrayList<>();
        for (DetailInfoDto detailInfoDto : detailInfoDtos) {
            typeOperationsName.add(detailInfoDto.getWorkBenchDto().getTypeOperation());
        }
        String distinctTypeOperations = String.join(" -> ", new LinkedHashSet<>(typeOperationsName));

        model.addAttribute("details", DetailDto.compareMaterialName(detailService.getAllDetails()));
        model.addAttribute("workbenches", workBenchService.getAllWorkBench());
        model.addAttribute("typeOperationsName", distinctTypeOperations);
        model.addAttribute("detail", detailService.getDetailDtoById(UUID.fromString(id)));
        model.addAttribute("materials", Material.compare(materialService.getAllMaterials()));
        model.addAttribute("user", userService.getUserWeb());
        model.addAttribute("operations", subsequenceTypeOperationService.getAllSubsequenceTypeOperation());
        for (TypeOperation typeOperation : typeOperationService.getAllTypeOperations()) {
            List<WorkBench> workBenches = workBenchService.getWorkBenchesFilterOperationName(typeOperation.getId());
            model.addAttribute(typeOperation.getName(), workBenches);
        }
        return "addAlternativeForDetail";
    }

    /**
     * Страница добавления запасного варианта детали метод POST
     *
     * @param model Модель
     * @return Страница добавления запасного варианта детали
     */
    @PostMapping("/addAlternative/{id}")
    public String addAlternativeDetailPost(@PathVariable(value = "id") String id,
                                           @RequestParam(required = false) List<String> workBenchId1,
                                           @RequestParam(required = false) List<String> timeWork1,
                                           @RequestParam(required = false) List<String> comment1,
                                           Model model) {

        List<String> workbenchesId = workBenchId1.stream().filter(x -> !x.equals("Выберите станок")).collect(Collectors.toList());

        if (workbenchesId.isEmpty()) {
            DetailDto detailDto = detailService.getDetailDtoById(UUID.fromString(id));
            List<DetailInfoDto> detailInfoDtos = detailDto.getDetailListDtos().get(0).getDetailInfoDtos();
            List<String> typeOperationsName = new ArrayList<>();
            for (DetailInfoDto detailInfoDto : detailInfoDtos) {
                typeOperationsName.add(detailInfoDto.getWorkBenchDto().getTypeOperation());
            }
            String distinctTypeOperations = String.join(" -> ", new LinkedHashSet<>(typeOperationsName));

            model.addAttribute("details", DetailDto.compareMaterialName(detailService.getAllDetails()));
            model.addAttribute("workbenches", workBenchService.getAllWorkBench());
            model.addAttribute("typeOperationsName", distinctTypeOperations);
            model.addAttribute("detail", detailService.getDetailDtoById(UUID.fromString(id)));
            model.addAttribute("materials", Material.compare(materialService.getAllMaterials()));
            model.addAttribute("user", userService.getUserWeb());
            model.addAttribute("operations", subsequenceTypeOperationService.getAllSubsequenceTypeOperation());
            for (TypeOperation typeOperation : typeOperationService.getAllTypeOperations()) {
                List<WorkBench> workBenches = workBenchService.getWorkBenchesFilterOperationName(typeOperation.getId());
                model.addAttribute(typeOperation.getName(), workBenches);
            }
            return "addAlternativeForDetail";
        }
        Detail detail = detailService.getDetailById(UUID.fromString(id));
        DetailList detailList = new DetailList();
        detailList.setId(UUID.randomUUID());
        detailList.setMainOrAlternative(2);
        detailList.setSelected(false);

        List<DetailInfo> detailInfos = new ArrayList<>();
        for (int i = 0; i < workbenchesId.size(); i++) {
            DetailInfo detailInfo = new DetailInfo();
            detailInfo.setId(UUID.randomUUID());
            detailInfo.setSetting(false);
            detailInfo.setTimeWork(timeWork1.get(i));
            if (comment1 != null && !comment1.isEmpty()) {
                detailInfo.setComment(comment1.get(i));
            }
            detailInfo.setPriority(i);
            detailInfo.setWorkBenches(workBenchService.getOneWorkBenchById(UUID.fromString(workbenchesId.get(i))));
            detailInfos.add(detailInfo);
        }
        detailList.setDetailInfos(detailInfos);
        detail.getDetailLists().add(detailList);
        detailService.saveDetail(detail);
        return "redirect:/details/" + id;
    }

    @GetMapping("details/deleteWorkbenchMain/{id}")
    public String deleteWorkBenchForDetailGet(@PathVariable(value = "id") String id, Model model) {
        model.addAttribute("detail", detailService.getDetailDtoById(UUID.fromString(id)));
        model.addAttribute("workbenches", workBenchService.getUniqueWorkBench(UUID.fromString(id)));
        model.addAttribute("materials", Material.compare(materialService.getAllMaterials()));
        model.addAttribute("user", userService.getUserWeb());
        model.addAttribute("operations", subsequenceTypeOperationService.getAllSubsequenceTypeOperation());
        for (TypeOperation typeOperation : typeOperationService.getAllTypeOperations()) {
            List<WorkBench> workBenches = workBenchService.getWorkBenchesFilterOperationName(typeOperation.getId());
            model.addAttribute(typeOperation.getName(), workBenches);
        }
        return "deleteWorkbenchForDetail";
    }

    @PostMapping("details/deleteWorkbenchMain/{id}")
    public String deleteWorkBenchForDetailPost(@PathVariable(value = "id") String id,
                                               @RequestParam(required = false) String detailId, Model model) {
        Detail detail = detailService.getDetailById(UUID.fromString(detailId));
        List<DetailInfo> detailInfos = detail.getDetailLists().get(0).getDetailInfos();
        detailInfos.removeIf(x -> x.getWorkBenches().equals(workBenchService.getOneWorkBenchById(UUID.fromString(id))));
        for (int i = 0; i < detailInfos.size(); i++) {
            DetailInfo detailInfo = detailInfos.get(i);
            detailInfo.setPriority(i);
        }
        detailService.saveDetail(detail);
        return "redirect:/details/deleteWorkbenchMain/" + detailId;
    }

    @GetMapping("details/deleteWorkbenchAlternative/{id}")
    public String deleteWorkBenchForDetailGet1(@PathVariable(value = "id") String id, Model model) {
        model.addAttribute("detail", detailService.getDetailDtoById(UUID.fromString(id)));
        model.addAttribute("workbenches", workBenchService.getUniqueWorkBench(UUID.fromString(id)));
        model.addAttribute("materials", Material.compare(materialService.getAllMaterials()));
        model.addAttribute("user", userService.getUserWeb());
        model.addAttribute("operations", subsequenceTypeOperationService.getAllSubsequenceTypeOperation());
        for (TypeOperation typeOperation : typeOperationService.getAllTypeOperations()) {
            List<WorkBench> workBenches = workBenchService.getWorkBenchesFilterOperationName(typeOperation.getId());
            model.addAttribute(typeOperation.getName(), workBenches);
        }
        return "deleteWorkbenchForDetail1";
    }

    @PostMapping("details/deleteWorkbenchAlternative/{id}")
    public String deleteWorkBenchForDetailPost1(@PathVariable(value = "id") String id,
                                                @RequestParam(required = false) String detailId, Model model) {
        Detail detail = detailService.getDetailById(UUID.fromString(detailId));
        List<DetailInfo> detailInfos = detail.getDetailLists().get(1).getDetailInfos();
        detailInfos.removeIf(x -> x.getWorkBenches().equals(workBenchService.getOneWorkBenchById(UUID.fromString(id))));
        for (int i = 0; i < detailInfos.size(); i++) {
            DetailInfo detailInfo = detailInfos.get(i);
            detailInfo.setPriority(i);
        }
        detailService.saveDetail(detail);
        return "redirect:/details/deleteWorkbenchAlternative/" + detailId;
    }
}
