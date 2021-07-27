package com.example.pozhiloyproject.controllers;

import com.example.pozhiloyproject.models.Detail;
import com.example.pozhiloyproject.models.TimeWorkDetail;
import com.example.pozhiloyproject.models.WorkBench;
import com.example.pozhiloyproject.services.DetailService;
import com.example.pozhiloyproject.services.MaterialService;
import com.example.pozhiloyproject.services.TimeWorkDetailService;
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
import java.util.stream.Collectors;
import java.util.stream.Stream;

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

    @GetMapping("/details")
    public String getAllDetails(Model model) {
        model.addAttribute("details", detailService.getAllDetails());
        return "details";
    }

    @GetMapping("/addDetail")
    public String addDetailGet(Model model) {
        model.addAttribute("details", detailService.getAllDetails());
        model.addAttribute("workbenches", workBenchService.getAllWorkBench());
        model.addAttribute("materials", materialService.getAllMaterials());
        return "addDetail";
    }

    @PostMapping("/addDetail")
    public String addDetailPost(@RequestParam(required = false) String detailName,
                                @RequestParam(required = false) String length,
                                @RequestParam(required = false) String width,
                                @RequestParam(required = false) String thickness,
                                @RequestParam(required = false) String materialName,
                                @RequestParam(required = false) List<String> workBenchName,
                                @RequestParam(required = false) List<String> timeWork,
                                 Model model
    ) {
        Detail detail = new Detail();
        Detail findDetail = null;
        try {
            findDetail = detailService.findByName(detailName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (findDetail != null) {
            model.addAttribute("details", detailService.getAllDetails());
            model.addAttribute("workbenches", workBenchService.getAllWorkBench());
            model.addAttribute("materials", materialService.getAllMaterials());
            model.addAttribute("detailError", "Деталь с таким названием уже существует! \nПридумайте другое название!");
            return "addDetail";
        }


        detail.setId(UUID.randomUUID());
        detail.setName(detailName);
        detail.setLength(length);
        detail.setWidth(width);
        detail.setThickness(thickness);

        detail.setMaterial(materialService.getOneMaterial(materialName));

        List<WorkBench> workBenches = new ArrayList<>();
        for (String name : workBenchName) {
            if (!name.equals("Выбирите станок")) {
                WorkBench workBench = workBenchService.getOneWorkBench(name);
                workBenches.add(workBench);
            }
        }

        List<TimeWorkDetail> timeWorkDetailsList = new ArrayList<>();
        for (String time : timeWork) {
            if (!time.equals("")) {
                TimeWorkDetail timeWorkDetail = new TimeWorkDetail();
                timeWorkDetail.setId(UUID.randomUUID());
                timeWorkDetail.setTimeWork(time);
                timeWorkDetailService.saveTimeWorkDetail(timeWorkDetail);
                timeWorkDetailsList.add(timeWorkDetail);

            }
        }
        detail.setTimeWorkDetails(timeWorkDetailsList);
        detail.setWorkBenches(workBenches);


        detailService.saveDetail(detail);
        return "redirect:/details";
    }

    @GetMapping("/details/{nameDetail}")
    public String getOneDetail(@PathVariable(value = "nameDetail") String nameDetail, Model model) {
        Detail detail = detailService.findByName(nameDetail);
        model.addAttribute("detail", detail);
        return "oneDetail";
    }

    @GetMapping("details/deletion/{nameDetail}")
    public String deletionDetailGet(@PathVariable(value = "nameDetail") String nameDetail, Model model) {
        model.addAttribute("detail", detailService.findByName(nameDetail));
        return "deletionDetail";
    }

    @PostMapping("details/deletion/{nameDetail}")
    public String deletionDetailPost(@PathVariable(value = "nameDetail") String nameDetail, Model model) {
        try {
            detailService.deleteDetail(detailService.findByName(nameDetail));
        } catch (Exception e) {
            model.addAttribute("detail", detailService.findByName(nameDetail));
            model.addAttribute("check", true);
            model.addAttribute("detailError", "Деталь нельзя удалить, потому что она используется в заказах!");
            return "deletionDetail";
        }


        return "redirect:/details";
    }

    @GetMapping("details/change/{nameDetail}")
    public String changeDetailGet(@PathVariable(value = "nameDetail") String nameDetail, Model model) {
        model.addAttribute("detail", detailService.findByName(nameDetail));
        model.addAttribute("materials", materialService.getAllMaterials());
        model.addAttribute("workbenches", workBenchService.getAllWorkBench());
        return "changeDetail";
    }

    @PostMapping("details/change/{nameDetail}")
    public String changeDetailPost(@PathVariable(value = "nameDetail") String nameDetail,
                                   @RequestParam(required = false) String detailName,
                                   @RequestParam(required = false) String materialName,
                                   @RequestParam(required = false) String length,
                                   @RequestParam(required = false) String width,
                                   @RequestParam(required = false) String thickness,
                                   @RequestParam(required = false) List<String> workBench,
                                   @RequestParam(required = false) List<String> timeWork,
                                   Model model) {

        Detail detail = detailService.findByName(nameDetail);
        detail.setName(detailName);
        detail.setLength(length);
        detail.setWidth(width);
        detail.setThickness(thickness);
        detail.setMaterial(materialService.getOneMaterial(materialName.replace("Выбранная: ", "")));
        List<WorkBench> workBenchList = new ArrayList<>();
        List<TimeWorkDetail> timeWorkDetailsList = new ArrayList<>();
        for (int i = 0; i < workBench.size(); i++) {
            detail.getTimeWorkDetails().get(i).setTimeWork(timeWork.get(i));
            workBenchList.add(workBenchService.getOneWorkBench(workBench.get(i).replace("Выбранная: ", "")));
        }
        detail.setWorkBenches(workBenchList);

        detailService.saveDetail(detail);
        return "redirect:/details";
    }
}
