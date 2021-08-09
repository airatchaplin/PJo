package com.example.pozhiloyproject.controllers;

import com.example.pozhiloyproject.models.Work;
import com.example.pozhiloyproject.services.WorkServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller

public class WorkController {
    @Autowired
    WorkServices workServices;
    @GetMapping("/work")
    public String work(Model model){
        model.addAttribute("work", workServices.find(1L));
        return "work";
    }
    @PostMapping("/work")
    public String workSave(@RequestParam Long id, @RequestParam String name){
        Work work = new Work();
        work.setWork(name);
        work.setId(id);
        workServices.saveWork(work);

        return "work";
    }

    @GetMapping("/workfind")
    public String work1(Model model){

        model.addAttribute("work", workServices.findAll());
        return "workfind";
    }
    @PostMapping("/workfind")
    public String workSave(@RequestParam Long id, Model model){

        return "redirect:/workfind/"+id;
    }

}
