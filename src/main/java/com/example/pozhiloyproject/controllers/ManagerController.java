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
@RequestMapping("/admin")
public class ManagerController {

    @Autowired
    ManagerService managerService;

    @Autowired
    RoleService roleService;

    @Autowired
    PasswordEncoder passwordEncoder;

    @GetMapping("/managers")
    public String getAllManagers(Model model) {
        model.addAttribute("managers", managerService.getAllManagers());
        return "managers";
    }

    @GetMapping("/addManager")
    public String addManagerGet(Model model) {
        model.addAttribute("roles", roleService.getAllRoles());
        return "addManager";
    }

    @PostMapping("/addManager")
    public String addManagerPost(@RequestParam(required = false) String fio,
                                 @RequestParam(required = false) String name,
                                 @RequestParam(required = false) String lastName,
                                 @RequestParam(required = false) String username,
                                 @RequestParam(required = false) String password,
                                 @RequestParam(required = false) String passwordConfirm,
                                 @RequestParam(required = false) String role,
                                 Model model) {

        Manager findManager = managerService.getManagerByUsername(username);
        if (findManager != null) {
            if (!password.equals(passwordConfirm) && username.equals(managerService.getManagerByUsername(username).getUsername())) {
                model = getModel(fio, name, lastName, username, model);
                model.addAttribute("passwordError", "Пароли не совпадают!");
                model.addAttribute("usernameError", "Логин уже существует");
                return "addManager";
            }
            if (username.equals(managerService.getManagerByUsername(username).getUsername())) {
                model = getModel(fio, name, lastName, username, model);
                model.addAttribute("usernameError", "Логин уже существует");
                return "addManager";
            }
        } else {
            if (!password.equals(passwordConfirm)) {
                model = getModel(fio, name, lastName, username, model);
                model.addAttribute("passwordError", "Пароли не совпадают!");
                return "addManager";
            }
        }
        Manager manager = new Manager();
        manager.setId(UUID.randomUUID());
        manager.setFio(fio);
        manager.setName(name);
        manager.setLastName(lastName);
        manager.setFio_i_o(fio + " " + name.charAt(0) + "." + lastName.charAt(0) + ".");
        manager.setUsername(username);
//        manager.setPassword(passwordEncoder.encode(password));
        manager.setPassword(password);
        manager.setRoles(Collections.singletonList(role.equals("Админ") ? roleService.getRoleAdmin() : roleService.getRoleUser()));
        managerService.saveManager(manager);
        return "redirect:/admin/managers";
    }

    @GetMapping("managers/{uuid}")
    public String getOneManager(@PathVariable(name = "uuid") String uuid, Model model) {
        model.addAttribute("manager", managerService.getManagerByUUID(uuid));
        return "oneManager";
    }

    @GetMapping("managers/change/{uuid}")
    public String changeManagerGet(@PathVariable(name = "uuid") String uuid,

                                   Model model) {
        model.addAttribute("roles", roleService.getAllRoles());
        model.addAttribute("manager", managerService.getManagerByUUID(uuid));
        return "changeManager";
    }

    @PostMapping("managers/change/{uuid}")
    public String changeManagerPost(@PathVariable(name = "uuid") String uuid,
                                    @RequestParam(required = false) String role) {
        Manager manager = managerService.getManagerByUUID(uuid);
        manager.setRoles(Collections.singletonList(role.equals("Админ") ? roleService.getRoleAdmin() : roleService.getRoleUser()));
        managerService.saveManager(manager);
        return "redirect:/managers";
    }

    @GetMapping("managers/deletion/{uuid}")
    public String deleteManagerGet(@PathVariable(name = "uuid") String uuid, Model model) {
        model.addAttribute("manager", managerService.getManagerByUUID(uuid));
        return "deletionManager";
    }

    @PostMapping("managers/deletion/{uuid}")
    public String deleteManagerPost(@PathVariable(name = "uuid") String uuid, Model model) {
        try {
            managerService.deleteManager(managerService.getManagerByUUID(uuid));
        } catch (Exception e) {
            model.addAttribute("manager", managerService.getManagerByUUID(uuid));
            model.addAttribute("managerError", "Менеджера нельзя удалить, потому что она используется в заказах!");
            return "deletionManager";
        }
        return "redirect:/managers";
    }

    public Model getModel(String fio, String name, String lastName, String username, Model model) {
        model.addAttribute("username", username);
        model.addAttribute("fio", fio);
        model.addAttribute("name", name);
        model.addAttribute("lastName", lastName);
        model.addAttribute("roles", roleService.getAllRoles());
        return model;
    }
}
