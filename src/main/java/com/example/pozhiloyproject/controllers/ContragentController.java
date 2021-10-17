package com.example.pozhiloyproject.controllers;

import com.example.pozhiloyproject.models.Contragent;
import com.example.pozhiloyproject.models.setting.SettingView;
import com.example.pozhiloyproject.services.ContragentService;
import com.example.pozhiloyproject.services.SettingService;
import com.example.pozhiloyproject.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

/**
 * Контроллер контрагентов
 */
@Controller
public class ContragentController {

    @Autowired
    ContragentService contragentService;

    @Autowired
    UserService userService;

    @Autowired
    SettingService settingService;

    /**
     * Страница всех контрагентов метод GET
     *
     * @param model Модель
     * @return Страница всех контрагентов
     */
    @GetMapping("/contragents")
    public String getAllContragents(Model model) {
        model.addAttribute("contragents", contragentService.getAllContragents());
        model.addAttribute("user", userService.getUserWeb());
        List<SettingView> settingViews = settingService.getSetting().getSettingViews();
        model.addAttribute("setting",settingViews.stream().filter(x -> x.getName().equals("Контрагенты")).collect(Collectors.toList()));
        return "contragents";
    }

    /**
     * Страница контрагента метод GET
     *
     * @param id    Идентификатор контрагента
     * @param model Модель
     * @return Страница контрагента
     */
    @GetMapping("contragents/{id}")
    public String getOneContragent(@PathVariable(name = "id") String id, Model model) {
        model.addAttribute("user", userService.getUserWeb());
        model.addAttribute("contragent", contragentService.getOneContragentById(UUID.fromString(id)));
        List<SettingView> settingViews = settingService.getSetting().getSettingViews();
        model.addAttribute("setting",settingViews.stream().filter(x -> x.getName().equals("Контрагенты")).collect(Collectors.toList()));
        return "oneContragent";
    }

    /**
     * Страница добавления контрагента метод GET
     *
     * @param model Модель
     * @return Страница добавления контрагента
     */
    @GetMapping("/addContragent")
    public String addContragentsGet(Model model) {
        model.addAttribute("user", userService.getUserWeb());
        return "addContragent";
    }

    /**
     * Страница добавления контрагента метод POST
     *
     * @param contragentName Наименование контрагента
     * @param model          Модель
     * @return Страница всех контрагентов
     */
    @PostMapping("/addContragent")
    public String addContragentsPost(@RequestParam(required = false) String contragentName, Model model) {
        if (contragentService.checkContragent(contragentName)) {
            model.addAttribute("user", userService.getUserWeb());
            model.addAttribute("contragentNameError", "Контрагент с таким наименованием уже существует!");
            return "addContragent";
        }
        Contragent contragent = new Contragent();
        contragent.setId(UUID.randomUUID());
        contragent.setName(contragentName);
        contragentService.saveContragent(contragent);
        return "redirect:/contragents";
    }

    /**
     * Страница изменения контрагента метод GET
     *
     * @param id    Идентификатор контрагента
     * @param model Модель
     * @return Страница изменения контрагента
     */
    @GetMapping("contragents/change/{id}")
    public String changeContragentGet(@PathVariable(name = "id") String id, Model model) {
        model.addAttribute("user", userService.getUserWeb());
        model.addAttribute("contragent", contragentService.getOneContragentById(UUID.fromString(id)));
        return "changeContragent";
    }

    /**
     * Страница изменения контрагента метод POST
     *
     * @param id             Идентификатор контрагента
     * @param contragentName Измененное наименование контрагента
     * @param model          Модель
     * @return Страница всех контрагентов
     */
    @PostMapping("contragents/change/{id}")
    public String changeContragentPost(@PathVariable(name = "id") String id,
                                       @RequestParam(required = false) String contragentName, Model model) {

        if (contragentService.checkContragent(UUID.fromString(id), contragentName)) {
            model.addAttribute("contragent", contragentService.getOneContragentById(UUID.fromString(id)));
            model.addAttribute("user", userService.getUserWeb());
            model.addAttribute("contragentNameError", "Контрагент с таким наименованием уже существует!");
            return "changeContragent";
        }
        Contragent contragent = contragentService.getOneContragentById(UUID.fromString(id));
        contragent.setName(contragentName);
        contragentService.saveContragent(contragent);
        return "redirect:/contragents";
    }

    /**
     * Страница удаления контрагента метод GET
     *
     * @param id    Идентификатор контрагента
     * @param model Модель
     * @return Страница удаления контрагента
     */
    @GetMapping("contragents/deletion/{id}")
    public String deleteContragentGet(@PathVariable(name = "id") String id, Model model) {
        model.addAttribute("user", userService.getUserWeb());
        model.addAttribute("contragent", contragentService.getOneContragentById(UUID.fromString(id)));
        return "deletionContragent";
    }

    /**
     * Страница удаления контрагента метод POST
     *
     * @param id    Идентификатор контрагента
     * @param model Модель
     * @return Страница всех контрагентов
     */
    @PostMapping("contragents/deletion/{id}")
    public String deleteContragentPost(@PathVariable(name = "id") String id, Model model) {
        try {
            contragentService.deleteContragent(contragentService.getOneContragentById(UUID.fromString(id)));
        } catch (Exception e) {
            model.addAttribute("user", userService.getUserWeb());
            model.addAttribute("contragent", contragentService.getOneContragentById(UUID.fromString(id)));
            model.addAttribute("contragentError", "Контрагента нельзя удалить, потому что он используется в заказах!");
            return "deletionContragent";
        }
        return "redirect:/contragents";
    }


}
