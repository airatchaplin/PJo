package com.example.pozhiloyproject.controllers;

import com.example.pozhiloyproject.models.SubsequenceTypeOperation;
import com.example.pozhiloyproject.models.TypeOperation;
import com.example.pozhiloyproject.services.SubsequenceTypeOperationService;
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

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * Контроллер типов операций
 */
@Controller
public class TypeOperationController {

    @Autowired
    TypeOperationService typeOperationService;

    @Autowired
    WorkBenchService workBenchService;

    @Autowired
    SubsequenceTypeOperationService subsequenceTypeOperationService;

    @Autowired
    UserService userService;

    /**
     * Страница всех типов операций метод GET
     *
     * @param model Модель
     * @return Страница всех типов операций метод GET
     */
    @GetMapping("/workbenches/typeOperations")
    public String getAllTypeOperations(Model model) {
        model.addAttribute("operations", TypeOperation.compare(typeOperationService.getAllTypeOperations()));
        model.addAttribute("user", userService.getUserWeb());
        return "typeOperations";
    }

    /**
     * Страница добавления типа операции метод GET
     *
     * @param model Модель
     * @return Страница добавления типа операции
     */
    @GetMapping("/workbenches/typeOperations/addTypeOperation")
    public String addTypeOperationGet(Model model) {
        model.addAttribute("user", userService.getUserWeb());
        return "addTypeOperation";
    }

    /**
     * Страница добавления типа операции метод POST
     *
     * @param nameTypeOperation Наименование операции
     * @param model             Модель
     * @return Страница всех типов операций
     */
    @PostMapping("/workbenches/typeOperations/addTypeOperation")
    public String addTypeOperationPost(@RequestParam(required = false) String nameTypeOperation, Model model) {
        if (typeOperationService.checkAddTypeOperation(nameTypeOperation)) {
            model.addAttribute("errorTypeOperation", "Операция с таким наименованием уже существует!");
            model.addAttribute("user", userService.getUserWeb());
            return "addTypeOperation";
        }
        TypeOperation typeOperation = new TypeOperation();
        typeOperation.setId(UUID.randomUUID());
        typeOperation.setName(nameTypeOperation);
        typeOperationService.save(typeOperation);
        model.addAttribute("operations", typeOperationService.getAllTypeOperations());
        return "redirect:/workbenches/typeOperations";
    }

    /**
     * Страница типа операции метод GET
     *
     * @param id    Идентификатор типа операции
     * @param model Модель
     * @return Страница типа операции
     */
    @GetMapping("/workbenches/typeOperations/{id}")
    public String oneTypeOperation(@PathVariable(name = "id") String id, Model model) {
        model.addAttribute("operation", typeOperationService.getOneTypeOperation(UUID.fromString(id)));
        model.addAttribute("workbenches", workBenchService.getWorkBenchesFilterOperationName(UUID.fromString(id)));
        model.addAttribute("user", userService.getUserWeb());
        return "oneTypeOperation";
    }

    /**
     * Страница изменения типа операции метод GET
     *
     * @param id    Идентификатор типа операции
     * @param model Модель
     * @return Страница изменения типа операции
     */
    @GetMapping("/workbenches/typeOperations/change/{id}")
    public String changeTypeOperationGet(@PathVariable(name = "id") String id, Model model) {
        model.addAttribute("operation", typeOperationService.getOneTypeOperation(UUID.fromString(id)));
        model.addAttribute("user", userService.getUserWeb());
        return "changeTypeOperation";
    }

    /**
     * Страница изменения типа операции метод POST
     *
     * @param id                Идентификатор типа операции
     * @param nameTypeOperation Наименование операции
     * @param model             Модель
     * @return Страница всех типов операций
     */
    @PostMapping("/workbenches/typeOperations/change/{id}")
    public String changeTypeOperationPost(@PathVariable(name = "id") String id, @RequestParam(required = false) String nameTypeOperation, Model model) {
        if (typeOperationService.checkAddTypeOperation(UUID.fromString(id), nameTypeOperation)) {
            model.addAttribute("errorTypeOperation", "Операция с таким наименованием уже существует!");
            model.addAttribute("operation", typeOperationService.getOneTypeOperation(UUID.fromString(id)));
            model.addAttribute("user", userService.getUserWeb());
            return "changeTypeOperation";
        }
        TypeOperation typeOperation = typeOperationService.getOneTypeOperation(UUID.fromString(id));
        typeOperation.setName(nameTypeOperation);
        typeOperationService.save(typeOperation);

        model.addAttribute("operation", typeOperationService.getOneTypeOperation(UUID.fromString(id)));
        return "redirect:/workbenches/typeOperations";
    }

    /**
     * Страница удаления типа операции метод GET
     *
     * @param id    Идентификатор типа операции
     * @param model Модель
     * @return Страница удаления типа операции
     */
    @GetMapping("/workbenches/typeOperations/deletion/{id}")
    public String deletionTypeOperationGet(@PathVariable(name = "id") String id, Model model) {
        model.addAttribute("operation", typeOperationService.getOneTypeOperation(UUID.fromString(id)));
        model.addAttribute("user", userService.getUserWeb());
        return "deletionTypeOperation";
    }

    /**
     * Страница удаления типа операции метод POST
     *
     * @param id    Идентификатор типа операции
     * @param model Модель
     * @return Страница всех типов операций
     */
    @PostMapping("/workbenches/typeOperations/deletion/{id}")
    public String deletionTypeOperationPost(@PathVariable(name = "id") String id, Model model) {
        try {
            typeOperationService.deleteTypeOperation(typeOperationService.getOneTypeOperation(UUID.fromString(id)));
        } catch (Exception e) {
            model.addAttribute("operation", typeOperationService.getOneTypeOperation(UUID.fromString(id)));
            model.addAttribute("operationError", "Операцию нельзя удалить, потому что он используется в станках!");
            return "deletionTypeOperation";
        }

        return "redirect:/workbenches/typeOperations";
    }

    /**
     * Страница добавления последовательности операции GET
     *
     * @param model Модель
     * @return Страница добавления последовательности операции
     */
    @GetMapping("/workbenches/typeOperations/addSubsequenceTypeOperation")
    public String addSubsequenceTypeOperationGet(Model model) {
        model.addAttribute("operations", typeOperationService.getAllTypeOperations());
        model.addAttribute("user", userService.getUserWeb());
        return "addSubsequenceTypeOperation";
    }

    /**
     * Страница добавления последовательности операции метод POST
     *
     * @param typeOperationsList Список типов операций
     * @param model              Модель
     * @return Страница всех последовательностей операции
     */
    @PostMapping("/workbenches/typeOperations/addSubsequenceTypeOperation")
    public String addSubsequenceTypeOperationPost(@RequestParam(required = false) List<String> typeOperationsList, Model model) {
        model.addAttribute("operations", typeOperationService.getAllTypeOperations());

        List<TypeOperation> typeOperations = new ArrayList<>();
        String description = "";
        for (String s : typeOperationsList) {
            TypeOperation oneTypeOperation = typeOperationService.getOneTypeOperation(UUID.fromString(s));
            description += oneTypeOperation.getName() + " -> ";
            typeOperations.add(oneTypeOperation);
        }
        description = description.substring(0, description.length() - 4);

        if (subsequenceTypeOperationService.checkSubsequenceTypeOperation(description)){
            model.addAttribute("errorSubsequenceTypeOperation", "Последовательность операции с такими параметрами уже существует!");
            model.addAttribute("operations", typeOperationService.getAllTypeOperations());
            model.addAttribute("user", userService.getUserWeb());
            return "addSubsequenceTypeOperation";
        }
        SubsequenceTypeOperation subsequenceTypeOperation = new SubsequenceTypeOperation();
        subsequenceTypeOperation.setId(UUID.randomUUID());
        subsequenceTypeOperation.setTypeOperations(typeOperations);
        subsequenceTypeOperation.setDescription(description);
        subsequenceTypeOperationService.saveSubsequenceTypeOperation(subsequenceTypeOperation);
        return "redirect:/workbenches/typeOperations/subsequenceTypeOperation";
    }

    /**
     * Страница всех последовательностей операции метод GET
     *
     * @param model Модель
     * @return Страница всех последовательностей операции
     */
    @GetMapping("/workbenches/typeOperations/subsequenceTypeOperation")
    public String allSubsequenceTypeOperationGet(Model model) {
        model.addAttribute("operations", subsequenceTypeOperationService.getAllSubsequenceTypeOperation());
        model.addAttribute("user", userService.getUserWeb());
        return "subsequenceTypeOperation";
    }

    /**
     * Страница последовательности операции метод GET
     *
     * @param id    Идентификатор последовательности типов операций
     * @param model Модель
     * @return Страница последовательности операции
     */
    @GetMapping("/workbenches/typeOperations/subsequenceTypeOperation/{id}")
    public String oneSubsequenceTypeOperationGet(@PathVariable(name = "id") String id, Model model) {
        model.addAttribute("operation", subsequenceTypeOperationService.getOneSubsequenceTypeOperation(UUID.fromString(id)));
        model.addAttribute("user", userService.getUserWeb());
        model.addAttribute("user", userService.getUserWeb());
        return "oneSubsequenceTypeOperation";
    }

    /**
     * Страница удаления последовательности операции метод GET
     *
     * @param id    Идентификатор последовательности типов операций
     * @param model Модель
     * @return Страница удаления последовательности операции
     */
    @GetMapping("/workbenches/typeOperations/deletion/subsequenceTypeOperation/{id}")
    public String deletionSubsequenceTypeOperationGet(@PathVariable(name = "id") String id, Model model) {
        model.addAttribute("operation", subsequenceTypeOperationService.getOneSubsequenceTypeOperation(UUID.fromString(id)));
        model.addAttribute("user", userService.getUserWeb());
        return "deletionSubsequenceTypeOperation";
    }

    /**
     * Страница удаления последовательности операции метод POST
     *
     * @param id    Идентификатор последовательности типов операций
     * @param model Модель
     * @return Страница всех последовательностей операций
     */
    @PostMapping("/workbenches/typeOperations/deletion/subsequenceTypeOperation/{id}")
    public String deletionSubsequenceTypeOperationPost(@PathVariable(name = "id") String id, Model model) {
        subsequenceTypeOperationService.deleteSubsequenceTypeOperation(subsequenceTypeOperationService.getOneSubsequenceTypeOperation(UUID.fromString(id)));
        return "redirect:/workbenches/typeOperations/subsequenceTypeOperation";
    }
}
