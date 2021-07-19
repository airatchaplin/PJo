package com.example.pozhiloyproject.controllers;

import com.example.pozhiloyproject.models.Detail;
import com.example.pozhiloyproject.models.WorkBench;
import com.example.pozhiloyproject.services.DetailService;
import com.example.pozhiloyproject.services.WorkBenchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Controller
public class DetailController {

    @Autowired
    DetailService detailService;

    @Autowired
    WorkBenchService workBenchService;

    @GetMapping("/details")
    public String getAllDetails(Model model) {
        model.addAttribute("details", detailService.getAllDetails());
        return "details";
    }

    @GetMapping("/addDetail")
    public String addDetailGet(Model model) {
        model.addAttribute("details", detailService.getAllDetails());
        model.addAttribute("workbenches", workBenchService.getAllWorkBench());
        return "addDetail";
    }

    @PostMapping("/addDetail")
    public String addDetailPost(@RequestParam(required = false) String detailName,
                                @RequestParam(required = false) String workBenchName,
                                @RequestParam(required = false) String workBenchName1,
                                @RequestParam(required = false) String workBenchName2
    ) {
        Detail detail = new Detail();
        detail.setId(UUID.randomUUID());
        detail.setName(detailName);
        List<String> workBenchesNames = Stream.of(workBenchName, workBenchName1, workBenchName2).collect(Collectors.toList());
        List<WorkBench> workBenches = new ArrayList<>();
        for (String name : workBenchesNames) {
            if (!name.equals("Выбирите станок")) {
                WorkBench workBench = workBenchService.getOneWorkBench(name);
                workBenches.add(workBench);
            }
        }
        detail.setWorkBenches(workBenches);

        detailService.saveDetail(detail);
        return "redirect:/details";
    }
}
