package com.example.pozhiloyproject.controllers;

import com.example.pozhiloyproject.models.Test;
import com.example.pozhiloyproject.services.TestServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller

public class TestController {
    @Autowired
    TestServices testServices;
    @GetMapping("/test")
    public String test(Model model){
        model.addAttribute("test", testServices.find(1L));
        return "test";
    }
    @PostMapping("/test")
    public String testSave(@RequestParam Long id, @RequestParam String name){
        Test test = new Test();
        test.setTest(name);
        test.setId(id);
        testServices.saveTest(test);

        return "test";
    }

    @GetMapping("/testfind")
    public String work1(Model model){

        model.addAttribute("test", testServices.findAll());
        return "testfind";
    }
    @PostMapping("/testfind")
    public String testSave(@RequestParam Long id, Model model){

        return "redirect:/testfind/"+id;
    }

}
