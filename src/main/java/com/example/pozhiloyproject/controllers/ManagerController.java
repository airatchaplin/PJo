package com.example.pozhiloyproject.controllers;

import com.example.pozhiloyproject.models.User;
import com.example.pozhiloyproject.services.RoleService;
import com.example.pozhiloyproject.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.UUID;

@Controller
public class ManagerController {



    @Autowired
    RoleService roleService;


    PasswordEncoder passwordEncoder;

    @Autowired
    UserService userService;

    @GetMapping("/managers")
    public String getAllManagers(Model model) {
        model.addAttribute("user", userService.getUserWeb());
        model.addAttribute("managers", userService.getManagers());
        return "managers";
    }

    @GetMapping("/addManager")
    public String addManagerGet(Model model) {
        model.addAttribute("user", userService.getUserWeb());
        model.addAttribute("roles", roleService.getAllRoles());
        return "addManager";
    }

    @PostMapping("/addManager")
    public String addManagerPost(@RequestParam(required = false) String username,
                                 @RequestParam(required = false) String password,
                                 @RequestParam(required = false) String fio,
                                 @RequestParam(required = false) String name,
                                 @RequestParam(required = false) String lastName,
                                 Model model) {

        if(userService.checkUsername(username)){
            model.addAttribute("errorUsername","Пользователь с таким логином уже существует!");
            model.addAttribute("password",password);
            model.addAttribute("fio",fio);
            model.addAttribute("name",name);
            model.addAttribute("lastName",lastName);
            model.addAttribute("user", userService.getUserWeb());
            return "addManager";
        }
        username = username.trim();
        fio = fio.trim();
        name = name.trim();
        lastName = lastName.trim();


        User user = new User();
        user.setId(UUID.randomUUID());
        user.setUsername(username);
        user.setPassword(passwordEncoder.encode(password));
        user.setFio(fio);
        user.setName(name);
        user.setLastName(lastName);
        user.setRoles(Collections.singletonList(roleService.getRoleUser()));
        user.setFio_i_o(fio + " " + name.charAt(0) + "." + lastName.charAt(0) + ".");
        userService.saveUser(user);

        return "redirect:/managers";
    }

    @GetMapping("managers/{id}")
    public String getOneManager(@PathVariable(name = "id") String id, Model model) {
        model.addAttribute("managerById",userService.getUserById(UUID.fromString(id)));
        model.addAttribute("user", userService.getUserWeb());
        return "oneManager";
    }

    @GetMapping("managers/change/{id}")
    public String changeManagerGet(@PathVariable(name = "id") String id,
                                   Model model) {
        model.addAttribute("roles", roleService.getAllRoles());
        model.addAttribute("managerById", userService.getUserById(UUID.fromString(id)));
        model.addAttribute("user", userService.getUserWeb());
        return "changeManager";
    }

    @PostMapping("managers/change/{id}")
    public String changeManagerPost(@PathVariable(name = "id") String id,
                                    @RequestParam(required = false) String fio,
                                    @RequestParam(required = false) String name,
                                    @RequestParam(required = false) String lastName) {

        User user = userService.getUserById(UUID.fromString(id));
        user.setFio(fio);
        user.setName(name);
        user.setLastName(lastName);
        user.setFio_i_o(fio + " " + name.charAt(0) + "." + lastName.charAt(0) + ".");

        userService.saveUser(user);
        return "redirect:/managers";
    }

    @GetMapping("managers/deletion/{id}")
    public String deleteManagerGet(@PathVariable(name = "id") String id, Model model) {
        model.addAttribute("managerById", userService.getUserById(UUID.fromString(id)));
        model.addAttribute("user", userService.getUserWeb());
        return "deletionManager";
    }

    @PostMapping("managers/deletion/{id}")
    public String deleteManagerPost(@PathVariable(name = "id") String id, Model model) {
        try {
            userService.deleteUser(userService.getUserById(UUID.fromString(id)));
        } catch (Exception e) {
            model.addAttribute("managerById", userService.getUserById(UUID.fromString(id)));
            model.addAttribute("user", userService.getUserWeb());
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
