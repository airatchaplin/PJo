package com.example.pozhiloyproject.controllers;

import com.example.pozhiloyproject.models.Manager;
import com.example.pozhiloyproject.services.ManagerService;
import com.example.pozhiloyproject.services.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.UUID;

@Controller
public class MainController {

    @Autowired
    ManagerService managerService;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    RoleService roleService;

    @GetMapping("/")
    public String main(Model model){
        model.addAttribute("manager",managerService.getUserWeb());
        return "index";
    }

    @GetMapping("/login")
    public String login(){
        return "/login";
    }

    @GetMapping("/registration")
    public String registrationGet(){
        return "registration";
    }

    @PostMapping("/registration")
    public String registrationPost(@RequestParam(required = false) String username,
                                   @RequestParam(required = false) String fio,
                                   @RequestParam(required = false) String name,
                                   @RequestParam(required = false) String lastName,
                                   @RequestParam(required = false) String password,
                                   @RequestParam(required = false) String passwordConfirm,
                                   Model model){

        if (!password.equals(passwordConfirm)){
            model.addAttribute("username",username);
            model.addAttribute("fio",fio);
            model.addAttribute("name",name);
            model.addAttribute("lastName",lastName);
            model.addAttribute("passwordError","Пароли не совпадают!");
            return "/";
        }

        Manager manager = new Manager();
        manager.setId(UUID.randomUUID());
        manager.setUsername(username);
        manager.setFio(fio);
        manager.setName(name);
        manager.setLastName(lastName);
        manager.setPassword(passwordEncoder.encode(password));
        manager.setRoles(Collections.singletonList(roleService.getRoleUser()));
        manager.setFio_i_o(fio + " " + name.charAt(0) + "." + lastName.charAt(0) + ".");
        managerService.saveManager(manager);
        return "redirect:/";
    }

    @GetMapping("/admin")
    public String admin(Model model){
        model.addAttribute("managers",managerService.getAllManagers());
        return "admin";
    }

    @RequestMapping("/403")
    public String error403(Model model) {
        model.addAttribute("manager",managerService.getUserWeb());
        return "error";
    }


    @GetMapping("/personalArea")
    public String personalArea(Model model){
        model.addAttribute("manager", managerService.getUserWeb());
        return "personalArea";
    }

    @GetMapping("change/personalArea")
    public String changePersonalAreaGet( Model model){
        model.addAttribute("manager", managerService.getUserWeb());
        return "changePersonalArea";
    }


}
