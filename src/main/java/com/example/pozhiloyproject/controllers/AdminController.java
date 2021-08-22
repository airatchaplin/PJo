package com.example.pozhiloyproject.controllers;

import com.example.pozhiloyproject.services.RoleService;
import com.example.pozhiloyproject.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * Контроллер админа
 */
@Controller
public class AdminController {

    @Autowired
    UserService userService;

    @Autowired
    RoleService roleService;

    /**
     * Страница всех пользователей метод GET
     *
     * @param model Модель
     * @return Страница всех пользователей
     */
    @GetMapping("/admin/allUsers")
    public String adminAllUsersGet(Model model) {
        model.addAttribute("allAdmins", userService.getAdmins());
        model.addAttribute("allManagers", userService.getManagers());
        model.addAttribute("user", userService.getUserWeb());
        return "allUsers";
    }

    /**
     * Страница изменения всех пользователей метод GET
     *
     * @param model Модель
     * @return Страница изменения всех пользователей
     */
    @GetMapping("/admin/allUsers/change")
    public String adminChangeAllUsersGet(Model model) {
        model.addAttribute("allAdmins", userService.getAdmins());
        model.addAttribute("allManagers", userService.getManagers());
        model.addAttribute("roles", roleService.getAllRoles());
        model.addAttribute("user", userService.getUserWeb());
        return "changeRole";
    }

    /**
     * Страница изменения всех пользователей метод POST
     *
     * @param id    Список идентификатор пользователей
     * @param role  Список прав пользователей
     * @param model Модель
     * @return Страница всех пользователей
     */
    @PostMapping("/admin/allUsers/change")
    public String adminChangeAllUsersPost(@RequestParam(required = false) List<String> id,
                                          @RequestParam(required = false) List<String> role,
                                          Model model) {
        userService.updateRolesAllUsers(id, role);
        model.addAttribute("allAdmins", userService.getAdmins());
        model.addAttribute("allManagers", userService.getManagers());
        model.addAttribute("roles", roleService.getAllRoles());
        return "redirect:/admin/allUsers";
    }

}
