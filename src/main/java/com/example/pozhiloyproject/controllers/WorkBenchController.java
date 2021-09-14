package com.example.pozhiloyproject.controllers;

import com.example.pozhiloyproject.dto.DetailDto;
import com.example.pozhiloyproject.dto.WorkBenchDto;
import com.example.pozhiloyproject.models.User;
import com.example.pozhiloyproject.models.WorkBench;
import com.example.pozhiloyproject.services.TypeOperationService;
import com.example.pozhiloyproject.services.UserService;
import com.example.pozhiloyproject.services.WorkBenchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDateTime;
import java.util.UUID;

/**
 * Контроллер странков
 */
@Controller
public class WorkBenchController {

    @Autowired
    WorkBenchService workBenchService;

    @Autowired
    UserService userService;

    @Autowired
    TypeOperationService typeOperationService;

    /**
     * Страница всех станков метод GET
     *
     * @param model Модель
     * @return Страница всех станков
     */
    @GetMapping("/workbenches")
    public String getAllWorkBenches(Model model) {
        User user = userService.getUserWeb();
        if (user.getFilter_workbenches() != null) {
            switch (user.getFilter_workbenches()) {
                case "workBenches" -> model.addAttribute("workbenches", WorkBenchDto.compareWorkBenchesName(workBenchService.getAllWorkBench()));
                case "typeOperation" -> model.addAttribute("workbenches", WorkBenchDto.compareWorkBenchesTypeOperation(workBenchService.getAllWorkBench()));
                case "dateEnd" -> model.addAttribute("workbenches", WorkBenchDto.compareWorkBenchesDateEnd(workBenchService.getAllWorkBench()));
            }
        } else {
            model.addAttribute("workbenches", workBenchService.getAllWorkBench());
        }
        model.addAttribute("user", userService.getUserWeb());
        return "workbenches";
    }

    /**
     * Страница всех станков метод POST
     *
     * @param filter Фильтр
     * @return Страница всех деталей
     */
    @PostMapping("/workbenches")
    public String getAllWorkBenches(@RequestParam(required = false) String filter) {
        User user = userService.getUserWeb();
        switch (filter) {
            case "workBenches" -> user.setFilter_workbenches("workBenches");
            case "typeOperation" -> user.setFilter_workbenches("typeOperation");
            case "dateEnd" -> user.setFilter_workbenches("dateEnd");
        }
        userService.saveUser(user);
        return "redirect:/workbenches";
    }

    /**
     * Страница добавления станка метод GET
     *
     * @param model Модель
     * @return Страница добавления станка
     */
    @GetMapping("/addWorkBench")
    public String addWorkBenchGet(Model model) {
        model.addAttribute("user", userService.getUserWeb());
        model.addAttribute("operations", typeOperationService.getAllTypeOperations());
        return "addWorkBench";
    }

    /**
     * Страница добавления станка метод POST
     *
     * @param nameWorkBench   Наименование станка
     * @param dateEndDetail   Время окончания на этом станке
     * @param typeOperationId Идентификатор типа операции
     * @param model           Модель
     * @return Страница всех станков
     */
    @PostMapping("/addWorkBench")
    public String addWorkBenchPost(@RequestParam(required = false) String nameWorkBench,
                                   @RequestParam(required = false) String dateEndDetail,
                                   @RequestParam(required = false) String currentThickness,
                                   @RequestParam(required = false) String typeOperationId, Model model) {
        if (workBenchService.checkAddWorkBench(nameWorkBench)) {
            model.addAttribute("dateEndDetail", dateEndDetail);
            model.addAttribute("workBenchRepeatError", "Станок с таким названием уже существует!");
            return "addWorkBench";
        }

        WorkBench workBench = new WorkBench();
        workBench.setId(UUID.randomUUID());
        workBench.setName(nameWorkBench);
        workBench.setTypeOperation(typeOperationService.getOneTypeOperation(UUID.fromString(typeOperationId)));
        workBench.setCurrentThickness(Double.valueOf(currentThickness.replace(",",".")));
        workBench.setDateEndDetail(LocalDateTime.parse(dateEndDetail));
        workBenchService.save(workBench);
        return "redirect:/workbenches";
    }

    /**
     * Станица станка метод GET
     *
     * @param id    Идентификатор станка
     * @param model Модель
     * @return Станица станка
     */
    @GetMapping("workbenches/{id}")
    public String getOneWorkBench(@PathVariable(name = "id") String id, Model model) {
        model.addAttribute("workbench", workBenchService.getOneWorkBenchById(UUID.fromString(id)));
        model.addAttribute("user", userService.getUserWeb());
        return "oneWorkBench";
    }

    /**
     * Страница изменения станка метод GET
     *
     * @param id    Идентификатор станка
     * @param model Модель
     * @return Страница изменения станка
     */
    @GetMapping("workbenches/change/{id}")
    public String changeWorkBenchGet(@PathVariable(name = "id") String id, Model model) {
        model.addAttribute("workbench", workBenchService.getOneWorkBenchById(UUID.fromString(id)));
        model.addAttribute("operations", typeOperationService.getAllTypeOperations());
        model.addAttribute("user", userService.getUserWeb());
        return "changeWorkBench";
    }

    /**
     * Страница изменения станка метод POST
     *
     * @param id              Идентификатор станка
     * @param workBenchName   Наименование станка
     * @param typeOperationId Идентификатор типа операции
     * @param dateEndDetail   Время окончания на этом станке
     * @param model           Модель
     * @return Страница всех станков
     */
    @PostMapping("workbenches/change/{id}")
    public String changeWorkBenchPost(@PathVariable(name = "id") String id,
                                      @RequestParam(required = false) String workBenchName,
                                      @RequestParam(required = false) String typeOperationId,
                                      @RequestParam(required = false) String currentThickness,
                                      @RequestParam(required = false) String dateEndDetail, Model model) {

        if (workBenchService.checkAddWorkBench(UUID.fromString(id), workBenchName)) {
            model.addAttribute("workbench", workBenchService.getOneWorkBenchById(UUID.fromString(id)));
            model.addAttribute("operations", typeOperationService.getAllTypeOperations());
            model.addAttribute("workBenchRepeatError", "Станок с таким названием уже существует!");
            return "changeWorkBench";
        }

        WorkBench workBench = workBenchService.getOneWorkBenchById(UUID.fromString(id));
        workBench.setName(workBenchName);
        workBench.setCurrentThickness(Double.valueOf(currentThickness.replace(",",".")));
        workBench.setTypeOperation(typeOperationService.getOneTypeOperation(UUID.fromString(typeOperationId)));

        workBench.setDateEndDetail(LocalDateTime.parse(dateEndDetail));

        workBenchService.save(workBench);
        return "redirect:/workbenches";
    }

    /**
     * Страница удаления станка метод GET
     *
     * @param id    Идентификатор станка
     * @param model Модель
     * @return Страница удаления станка
     */
    @GetMapping("workbenches/deletion/{id}")
    public String deletionWorkBenchGet(@PathVariable(name = "id") String id, Model model) {
        model.addAttribute("workbench", workBenchService.getOneWorkBenchById(UUID.fromString(id)));
        model.addAttribute("user", userService.getUserWeb());
        return "deletionWorkBench";
    }

    /**
     * Страница удаления станка метод POST
     *
     * @param id    Идентификатор станка
     * @param model Модель
     * @return Страница всех станков
     */
    @PostMapping("workbenches/deletion/{id}")
    public String deletionWorkBenchPost(@PathVariable(name = "id") String id, Model model) {
        try {
            workBenchService.deleteWorkBench(workBenchService.getOneWorkBenchById(UUID.fromString(id)));
        } catch (Exception e) {
            model.addAttribute("workbench", workBenchService.getOneWorkBenchById(UUID.fromString(id)));
            model.addAttribute("workBenchError", "Станок нельзя удалить, потому что он используется в заказах!");
            return "deletionWorkBench";
        }
        return "redirect:/workbenches";
    }
}
