package com.example.pozhiloyproject.controllers;

import com.example.pozhiloyproject.helper.TypeOperation;
import com.example.pozhiloyproject.models.WorkBench;
import com.example.pozhiloyproject.repository.TypeOperationRepository;
import com.example.pozhiloyproject.services.ManagerService;
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
import java.util.List;
import java.util.UUID;

@Controller
public class WorkBenchController {

    @Autowired
    WorkBenchService workBenchService;

    @Autowired
    ManagerService managerService;

    @Autowired
    UserService userService;

    @Autowired
    TypeOperationService typeOperationService;

    @GetMapping("/workbenches")
    public String getAllWorkBenches(Model model) {
        model.addAttribute("workbenches", workBenchService.getAllWorkBench());
        model.addAttribute("user",userService.getUserWeb());
        return "workbenches";
    }

    @GetMapping("/addWorkBench")
    public String addWorkBenchGet(Model model) {
        model.addAttribute("user",userService.getUserWeb());
        model.addAttribute("operations", typeOperationService.getAllTypeOperations());
        return "addWorkBench";
    }

    @PostMapping("/addWorkBench")
    public String addWorkBenchPost(@RequestParam(required = false) String nameWorkBench,
                                   @RequestParam(required = false) String dateEndDetail,
                                   @RequestParam(required = false) String id,Model model) {

        WorkBench findWorkBench = null;
        try {
            findWorkBench = workBenchService.getOneWorkBench(nameWorkBench);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (findWorkBench != null) {
            model.addAttribute("dateEndDetail", dateEndDetail);
            model.addAttribute("workBenchRepeatError", "Станок с таким названием уже существует!");
            return "addWorkBench";
        }

        WorkBench workBench = new WorkBench();
        workBench.setId(UUID.randomUUID());
        workBench.setName(nameWorkBench);
        workBench.setTypeOperation(typeOperationService.getOneTypeOperation(UUID.fromString(id)));

        workBench.setDateEndDetail(LocalDateTime.parse(dateEndDetail));
        workBenchService.save(workBench);
        return "redirect:/workbenches";
    }

    @GetMapping("workbenches/{nameWorkBench}")
    public String getOneWorkBench(@PathVariable(name = "nameWorkBench") String nameWorkBench, Model model) {
        model.addAttribute("workbench", workBenchService.getOneWorkBench(nameWorkBench));
        model.addAttribute("user",userService.getUserWeb());
        return "oneWorkBench";
    }

    @GetMapping("workbenches/change/{nameWorkBench}")
    public String changeWorkBenchGet(@PathVariable(name = "nameWorkBench") String nameWorkBench, Model model) {
        model.addAttribute("workbench", workBenchService.getOneWorkBench(nameWorkBench));
        model.addAttribute("operations", typeOperationService.getAllTypeOperations());
        model.addAttribute("user",userService.getUserWeb());
        return "changeWorkBench";
    }

    @PostMapping("workbenches/change/{nameWorkBench}")
    public String changeWorkBenchPost(@PathVariable(name = "nameWorkBench") String nameWorkBench,
                                      @RequestParam(required = false) String workBenchName,
                                      @RequestParam(required = false) String id,
                                      @RequestParam(required = false) String dateEndDetail, Model model) {
        WorkBench findWorkBench = null;
        try {
            findWorkBench = workBenchService.getOneWorkBench(workBenchName);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (findWorkBench != null && !findWorkBench.getName().equals(nameWorkBench)) {
            model.addAttribute("workbench", workBenchService.getOneWorkBench(nameWorkBench));
            model.addAttribute("workBenchRepeatError", "Станок с таким названием уже существует!");
            return "changeWorkBench";
        }

        WorkBench workBench = workBenchService.getOneWorkBench(nameWorkBench);
        workBench.setName(workBenchName);
        workBench.setTypeOperation(typeOperationService.getOneTypeOperation(UUID.fromString(id)));

        workBench.setDateEndDetail(LocalDateTime.parse(dateEndDetail));

        workBenchService.save(workBench);
        return "redirect:/workbenches";
    }

    @GetMapping("workbenches/deletion/{nameWorkBench}")
    public String deletionWorkBenchGet(@PathVariable(name = "nameWorkBench") String nameWorkBench, Model model) {
        model.addAttribute("workbench", workBenchService.getOneWorkBench(nameWorkBench));
        model.addAttribute("user",userService.getUserWeb());
        return "deletionWorkBench";
    }

    @PostMapping("workbenches/deletion/{nameWorkBench}")
    public String deletionWorkBenchPost(@PathVariable(name = "nameWorkBench") String nameWorkBench, Model model) {
        try {
            workBenchService.deleteWorkBench(workBenchService.getOneWorkBench(nameWorkBench));
        } catch (Exception e) {
            model.addAttribute("workbench", workBenchService.getOneWorkBench(nameWorkBench));
            model.addAttribute("workBenchError", "Станок нельзя удалить, потому что он используется в заказах!");
            return "deletionWorkBench";
        }
        return "redirect:/workbenches";
    }
}
