package com.example.pozhiloyproject.controllers;

import com.example.pozhiloyproject.models.Manager;
import com.example.pozhiloyproject.models.TypeOperation;
import com.example.pozhiloyproject.models.User;
import com.example.pozhiloyproject.models.WorkBench;
import com.example.pozhiloyproject.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Controller
public class MainController {

    @Autowired
    UserService userService;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    RoleService roleService;

    @Autowired
    SubsequenceTypeOperationService subsequenceTypeOperationService;

    @Autowired
    WorkBenchService workBenchService;

    @Autowired
    TypeOperationService typeOperationService;

    @GetMapping("/")
    public String main(Model model) {
        model.addAttribute("user", userService.getUserWeb());
        model.addAttribute("operations", subsequenceTypeOperationService.getAllSubsequenceTypeOperation());


        for (TypeOperation typeOperation : typeOperationService.getAllTypeOperations()) {
            List<WorkBench> collect = workBenchService.getWorkBenchesFilterOperationName(typeOperation.getId());
            model.addAttribute(typeOperation.getName() ,collect);
        }

        return "index";
    }

    @GetMapping("/login")
    public String login() {
        return "/login";
    }

    @GetMapping("/registration")
    public String registrationGet() {
        return "registration";
    }

    @PostMapping("/registration")
    public String registrationPost(@RequestParam(required = false) String username,
                                   @RequestParam(required = false) String fio,
                                   @RequestParam(required = false) String name,
                                   @RequestParam(required = false) String lastName,
                                   @RequestParam(required = false) String password,
                                   @RequestParam(required = false) String passwordConfirm,
                                   Model model) {

        if (!password.equals(passwordConfirm)) {
            model.addAttribute("username", username);
            model.addAttribute("fio", fio);
            model.addAttribute("name", name);
            model.addAttribute("lastName", lastName);
            model.addAttribute("passwordError", "Пароли не совпадают!");
            return "/";
        }

        User user = new User();
        user.setId(UUID.randomUUID());
        user.setUsername(username);
        user.setFio(fio);
        user.setName(name);
        user.setLastName(lastName);
        user.setPassword(passwordEncoder.encode(password));
        user.setRoles(Collections.singletonList(roleService.getRoleUser()));
        user.setFio_i_o(fio + " " + name.charAt(0) + "." + lastName.charAt(0) + ".");
        userService.saveUser(user);
        return "redirect:/";
    }

//    @GetMapping("/admin")
//    public String admin(Model model){
//        model.addAttribute("managers",managerService.getAllManagers());
//        return "admin";
//    }

    @RequestMapping("/403")
    public String error403(Model model) {
        model.addAttribute("user", userService.getUserWeb());
        return "error";
    }

    @GetMapping("/personalArea")
    public String personalArea(Model model) {
        model.addAttribute("user", userService.getUserWeb());
        return "personalArea";
    }

    @GetMapping("change/personalArea")
    public String changePersonalAreaGet(Model model) {
        model.addAttribute("user", userService.getUserWeb());
        return "changePersonalArea";
    }

    @PostMapping("change/personalArea")
    public String changePersonalAreaPost(@RequestParam(required = false) String fio,
                                         @RequestParam(required = false) String name,
                                         @RequestParam(required = false) String lastName, Model model) {
        User user = userService.getUserWeb();
        user.setFio(fio);
        user.setName(name);
        user.setLastName(lastName);
        user.setFio_i_o(fio + " " + name.charAt(0) + "." + lastName.charAt(0) + ".");
        userService.saveUser(user);
        return "redirect:/personalArea";
    }

    @GetMapping("change/personalAreaPassword")
    public String changePersonalAreaPasswordGet(Model model) {
        model.addAttribute("user", userService.getUserWeb());
        return "changePersonalAreaPassword";
    }

    @PostMapping("change/personalAreaPassword")
    public String changePersonalAreaPasswordPost(@RequestParam(required = false) String password,
                                                 @RequestParam(required = false) String passwordConfirm, Model model) {
        if (!password.equals(passwordConfirm)) {
            model.addAttribute("passwordError", "Пароли не совпадают!");
            return "changePersonalAreaPassword";
        }
        User user = userService.getUserWeb();
        user.setPassword(passwordEncoder.encode(password));
        model.addAttribute("user", userService.getUserWeb());
        return "redirect:/personalArea";
    }


}
