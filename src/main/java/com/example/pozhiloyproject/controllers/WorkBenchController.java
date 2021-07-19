package com.example.pozhiloyproject.controllers;

import com.example.pozhiloyproject.models.WorkBench;
import com.example.pozhiloyproject.services.WorkBenchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.UUID;

@Controller
public class WorkBenchController {

    @Autowired
    WorkBenchService workBenchService;

    @GetMapping("/workbenches")
    public String getAllWorkBenches(Model model){
        model.addAttribute("workbenches",workBenchService.getAllWorkBench());
        return "workbenches";
    }

    @GetMapping("/addWorkBench")
    public String addWorkBenchGet(Model model){
        return "addWorkBench";
    }

    @PostMapping("/addWorkBench")
    public String addWorkBenchPost(@RequestParam(required = false) String name){
        WorkBench workBench = new WorkBench();
        workBench.setId(UUID.randomUUID());
        workBench.setName(name);
        workBenchService.save(workBench);
        return "redirect:/workbenches";
    }
}
