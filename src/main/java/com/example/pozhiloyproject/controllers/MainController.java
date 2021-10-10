package com.example.pozhiloyproject.controllers;

import com.example.pozhiloyproject.models.User;
import com.example.pozhiloyproject.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.UUID;

/**
 * Main контроллер
 */
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

    /**
     * Главная страница
     */
    @GetMapping("/")
    public String main(Model model) {
        model.addAttribute("user", userService.getUserWeb());
        return "main";
    }

    /**
     * Страница входа метод GET
     *
     * @return Страница входа
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    /**
     * Страница регистрации метод GET
     *
     * @return Страница регистрации
     */
    @GetMapping("/registration")
    public String registrationGet() {
        return "registration";
    }

    /**
     * Страница регистрации метод POST
     *
     * @param username        Логин
     * @param fio             Фамилия
     * @param name            Имя
     * @param lastName        Отчество
     * @param password        Пароль
     * @param passwordConfirm Подтверджения пароля
     * @param model           Модель
     * @return Страница входа
     */
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

    /**
     * Страница ошибки
     *
     * @param model Модель
     * @return Страница ошибка
     */
    @RequestMapping("/403")
    public String error403(Model model) {
        model.addAttribute("user", userService.getUserWeb());
        return "error";
    }


    /**
     * Страница личного кабинета метод GET
     *
     * @param model Модель
     * @return Страница личного кабинета
     */
    @GetMapping("/personalArea")
    public String personalArea(Model model) {
        model.addAttribute("user", userService.getUserWeb());
        return "personalArea";
    }

    /**
     * Страница изменения данных в личном кабинете метод GET
     *
     * @param model Модель
     * @return Страница изменения в личном кабинете
     */
    @GetMapping("change/personalArea")
    public String changePersonalAreaGet(Model model) {
        model.addAttribute("user", userService.getUserWeb());
        return "changePersonalArea";
    }

    /**
     * Страница изменения данных в личном кабинете метод POST
     *
     * @param username Логин
     * @param fio      Фамилия
     * @param name     Имя
     * @param lastName Отчество
     * @param model    Модель
     * @return Страница личного кабинета
     */
    @PostMapping("change/personalArea")
    public String changePersonalAreaPost(@RequestParam(required = false) String username,
                                         @RequestParam(required = false) String fio,
                                         @RequestParam(required = false) String name,
                                         @RequestParam(required = false) String lastName, Model model) {
        User userFind = userService.getByUsername(username);
        if (userFind == null) {
            model.addAttribute("user", userService.getUserWeb());
            return "redirect:/change/personalArea";
        }

        User user = userService.getUserWeb();
        user.setUsername(username);
        user.setFio(fio);
        user.setName(name);
        user.setLastName(lastName);
        user.setFio_i_o(fio + " " + name.charAt(0) + "." + lastName.charAt(0) + ".");
        userService.saveUser(user);
        return "redirect:/personalArea";
    }

    /**
     * Страница изменения пароля в личном кабинете метод GET
     *
     * @param model Модель
     * @return Страница изменения пароля в личном кабинете
     */
    @GetMapping("change/personalAreaPassword")
    public String changePersonalAreaPasswordGet(Model model) {
        model.addAttribute("user", userService.getUserWeb());
        return "changePersonalAreaPassword";
    }

    /**
     * Страница изменения пароля в личном кабинете метод POST
     *
     * @param password        Пароль
     * @param passwordConfirm Подвтерждение пароля
     * @param model           Модель
     * @return Страница личного кабинета
     */
    @PostMapping("change/personalAreaPassword")
    public String changePersonalAreaPasswordPost(@RequestParam(required = false) String password,
                                                 @RequestParam(required = false) String passwordConfirm, Model model) {
        if (!password.equals(passwordConfirm)) {
            model.addAttribute("passwordError", "Пароли не совпадают!");
            model.addAttribute("user", userService.getUserWeb());

            return "changePersonalAreaPassword";
        }
        User user = userService.getUserWeb();
        user.setPassword(passwordEncoder.encode(password));
        model.addAttribute("user", userService.getUserWeb());
        return "redirect:/personalArea";
    }


}
