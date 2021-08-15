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

    @GetMapping("/workbenches/typeOperations")
    public String getAllTypeOperations(Model model){
        model.addAttribute("operations",typeOperationService.getAllTypeOperations());
        model.addAttribute("user",userService.getUserWeb());
        return "typeOperations";
    }

    @GetMapping("/workbenches/typeOperations/addTypeOperation")
    public String addTypeOperationGet(Model model){
        model.addAttribute("operations",typeOperationService.getAllTypeOperations());
        model.addAttribute("user",userService.getUserWeb());
        return "addTypeOperation";
    }

    @PostMapping("/workbenches/typeOperations/addTypeOperation")
    public String addTypeOperationPost(@RequestParam(required = false) String nameTypeOperation,Model model){
        TypeOperation typeOperation = new TypeOperation();
        typeOperation.setId(UUID.randomUUID());
        typeOperation.setName(nameTypeOperation);
        typeOperationService.save(typeOperation);
        model.addAttribute("operations",typeOperationService.getAllTypeOperations());
        return "redirect:/workbenches/typeOperations";
    }

    @GetMapping("/workbenches/typeOperations/{id}")
    public String oneTypeOperation(@PathVariable(name = "id") String  id,  Model model){
        model.addAttribute("operation",typeOperationService.getOneTypeOperation(UUID.fromString(id)));
        model.addAttribute("workbenches",workBenchService.getWorkBenchesFilterOperationName(UUID.fromString(id)));
        model.addAttribute("user",userService.getUserWeb());
        return "oneTypeOperation";
    }

    @GetMapping("/workbenches/typeOperations/change/{id}")
    public String changeTypeOperationGet(@PathVariable(name = "id") String  id, @RequestParam(required = false) String nameTypeOperation, Model model){
        model.addAttribute("operation",typeOperationService.getOneTypeOperation(UUID.fromString(id)));
        model.addAttribute("user",userService.getUserWeb());
        return "changeTypeOperation";
    }

    @PostMapping("/workbenches/typeOperations/change/{id}")
    public String changeTypeOperationPost(@PathVariable(name = "id") String  id, @RequestParam(required = false) String nameTypeOperation, Model model){
        TypeOperation typeOperation = typeOperationService.getOneTypeOperation(UUID.fromString(id));
        typeOperation.setName(nameTypeOperation);
        typeOperationService.save(typeOperation);

        model.addAttribute("operation",typeOperationService.getOneTypeOperation(UUID.fromString(id)));
        return "redirect:/workbenches/typeOperations";
    }

    @GetMapping("/workbenches/typeOperations/deletion/{id}")
    public String deletionTypeOperationGet(@PathVariable(name = "id") String  id, @RequestParam(required = false) String nameTypeOperation, Model model){
        model.addAttribute("operation",typeOperationService.getOneTypeOperation(UUID.fromString(id)));
        model.addAttribute("user",userService.getUserWeb());
        return "deletionTypeOperation";
    }

    @PostMapping("/workbenches/typeOperations/deletion/{id}")
    public String deletionTypeOperationPost(@PathVariable(name = "id") String  id, @RequestParam(required = false) String nameTypeOperation, Model model){
        try {
            typeOperationService.deleteTypeOperation(typeOperationService.getOneTypeOperation(UUID.fromString(id)));
        } catch (Exception e) {
            model.addAttribute("operation",typeOperationService.getOneTypeOperation(UUID.fromString(id)));
            model.addAttribute("operationError", "Операцию нельзя удалить, потому что он используется в станках!");
            return "deletionTypeOperation";
        }

        return "redirect:/workbenches/typeOperations";
    }

    @GetMapping("/workbenches/typeOperations/addSubsequenceTypeOperation")
    public String addSubsequenceTypeOperationGet(Model model){
        model.addAttribute("operations", typeOperationService.getAllTypeOperations());
        model.addAttribute("user",userService.getUserWeb());
        return "addSubsequenceTypeOperation";
    }

    @PostMapping("/workbenches/typeOperations/addSubsequenceTypeOperation")
    public String addSubsequenceTypeOperationPost(@RequestParam(required = false) List<String> typeOperationsList, Model model){
        model.addAttribute("operations", typeOperationService.getAllTypeOperations());
        List<TypeOperation> typeOperations = new ArrayList<>();
        String description ="";
        for (String s : typeOperationsList) {
            TypeOperation oneTypeOperation = typeOperationService.getOneTypeOperation(UUID.fromString(s));
            description += oneTypeOperation.getName() + " -> ";
            typeOperations.add(oneTypeOperation);
        }
        description = description.substring(0,description.length()-4);
        SubsequenceTypeOperation subsequenceTypeOperation = new SubsequenceTypeOperation();
        subsequenceTypeOperation.setId(UUID.randomUUID());
        subsequenceTypeOperation.setTypeOperations(typeOperations);
        subsequenceTypeOperation.setDescription(description);
        subsequenceTypeOperationService.saveSubsequenceTypeOperation(subsequenceTypeOperation);
        return "redirect:/workbenches/typeOperations/subsequenceTypeOperation";
    }

    @GetMapping("/workbenches/typeOperations/subsequenceTypeOperation")
    public String allSubsequenceTypeOperationGet(Model model){
        model.addAttribute("operations", subsequenceTypeOperationService.getAllSubsequenceTypeOperation());
        model.addAttribute("user",userService.getUserWeb());
        return "subsequenceTypeOperation";
    }

    @GetMapping("/workbenches/typeOperations/subsequenceTypeOperation/{id}")
    public String oneSubsequenceTypeOperationGet(@PathVariable(name = "id") String id, Model model){
        model.addAttribute("operation", subsequenceTypeOperationService.getOneSubsequenceTypeOperation(UUID.fromString(id)));
        model.addAttribute("user",userService.getUserWeb());
        model.addAttribute("user",userService.getUserWeb());
        return "oneSubsequenceTypeOperation";
    }

    @GetMapping("/workbenches/typeOperations/deletion/subsequenceTypeOperation/{id}")
    public String deletionSubsequenceTypeOperationGet(@PathVariable(name = "id") String id, Model model){
        model.addAttribute("operation", subsequenceTypeOperationService.getOneSubsequenceTypeOperation(UUID.fromString(id)));
        model.addAttribute("user",userService.getUserWeb());
        return "deletionSubsequenceTypeOperation";
    }

    @PostMapping("/workbenches/typeOperations/deletion/subsequenceTypeOperation/{id}")
    public String deletionSubsequenceTypeOperationPost(@PathVariable(name = "id") String id, Model model){
        subsequenceTypeOperationService.deleteSubsequenceTypeOperation(subsequenceTypeOperationService.getOneSubsequenceTypeOperation(UUID.fromString(id)));
        return "redirect:/workbenches/typeOperations/subsequenceTypeOperation";
    }
}
