package com.example.pozhiloyproject.controllers;

import com.example.pozhiloyproject.models.Manager;
import com.example.pozhiloyproject.services.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.UUID;

@Controller
public class ManagerController {

    @Autowired
    ManagerService managerService;

    @GetMapping("/managers")
    public String getAllManagers(Model model) {
        model.addAttribute("managers", managerService.getAllManagers());
        return "managers";
    }

    @GetMapping("/addManager")
    public String addManagerGet() {
        return "addManager";
    }

    @PostMapping("/addManager")
    public String addManagerPost(@RequestParam(required = false) String fio,
                                 @RequestParam(required = false) String name,
                                 @RequestParam(required = false) String lastName) {
        Manager manager = new Manager();
        manager.setId(UUID.randomUUID());
        manager.setFio(fio);
        manager.setName(name);
        manager.setLastName(lastName);
        manager.setFio_i_o(fio + " " + name.substring(0,1) +"." + lastName.substring(0,1)+".");
        managerService.saveManager(manager);
        return "redirect:/managers";
    }
}
