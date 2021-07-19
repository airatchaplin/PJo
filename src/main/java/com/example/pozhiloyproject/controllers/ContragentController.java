package com.example.pozhiloyproject.controllers;

import com.example.pozhiloyproject.models.Contragent;
import com.example.pozhiloyproject.services.ContragentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.UUID;

@Controller
public class ContragentController {

    @Autowired
    ContragentService contragentService;

    @GetMapping("/contragents")
    public String getAllContragents(Model model) {
        model.addAttribute("contragents", contragentService.getAllContragents());
        return "contragents";
    }

    @GetMapping("/addContragent")
    public String addContragentsGet() {
        return "addContragent";
    }

    @PostMapping("/addContragent")
    public String addContragentsPost(@RequestParam(required = false) String contragentName) {
        Contragent contragent = new Contragent();
        contragent.setId(UUID.randomUUID());
        contragent.setName(contragentName);
        contragentService.saveContragent(contragent);
        return "redirect:/contragents";
    }


}
