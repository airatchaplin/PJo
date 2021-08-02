package com.example.pozhiloyproject.controllers;

import com.example.pozhiloyproject.models.Contragent;
import com.example.pozhiloyproject.services.ContragentService;
import com.example.pozhiloyproject.services.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.UUID;

@Controller
public class ContragentController {

    @Autowired
    ContragentService contragentService;

    @Autowired
    ManagerService managerService;

    @GetMapping("/contragents")
    public String getAllContragents(Model model) {
        model.addAttribute("contragents", contragentService.getAllContragents());
        model.addAttribute("manager",managerService.getUserWeb());
        return "contragents";
    }

    @GetMapping("/addContragent")
    public String addContragentsGet(Model model) {
        model.addAttribute("manager",managerService.getUserWeb());
        return "addContragent";
    }

    @PostMapping("/addContragent")
    public String addContragentsPost(@RequestParam(required = false) String contragentName, Model model) {

        Contragent findContragent = null;
        try {
            findContragent = contragentService.getOneContragent(contragentName);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (findContragent != null) {

            model.addAttribute("contragentNameError", "Контрагент с таким названием уже существует! \nПридумайте другое название!");
            return "addContragent";
        }
        Contragent contragent = new Contragent();
        contragent.setId(UUID.randomUUID());
        contragent.setName(contragentName);
        contragentService.saveContragent(contragent);
        return "redirect:/contragents";
    }

    @GetMapping("contragents/{nameContragent}")
    public String getOneContragent(@PathVariable(name = "nameContragent") String nameContragent, Model model) {
        model.addAttribute("manager",managerService.getUserWeb());
        model.addAttribute("contragent", contragentService.getOneContragent(nameContragent));
        return "oneContragent";
    }

    @GetMapping("contragents/change/{nameContragent}")
    public String changeContragentGet(@PathVariable(name = "nameContragent") String nameContragent, Model model) {
        model.addAttribute("manager",managerService.getUserWeb());
        model.addAttribute("contragent", contragentService.getOneContragent(nameContragent));
        return "changeContragent";
    }

    @PostMapping("contragents/change/{nameContragent}")
    public String changeContragentPost(@PathVariable(name = "nameContragent") String nameContragent,
                                       @RequestParam(required = false) String contragentName, Model model) {
        if (contragentName.equals("")) {
            model.addAttribute("contragent", contragentService.getOneContragent(nameContragent));
            model.addAttribute("contragentNameError", "Не заполнено название контрагента!");
            return "changeContragent";
        }
        Contragent contragent = contragentService.getOneContragent(nameContragent);
        contragent.setName(contragentName);
        contragentService.saveContragent(contragent);
        return "redirect:/contragents";
    }

    @GetMapping("contragents/deletion/{nameContragent}")
    public String deleteContragentGet(@PathVariable(name = "nameContragent") String nameContragent, Model model) {
        model.addAttribute("manager",managerService.getUserWeb());
        model.addAttribute("contragent", contragentService.getOneContragent(nameContragent));
        return "deletionContragent";
    }

    @PostMapping("contragents/deletion/{nameContragent}")
    public String deleteContragentPost(@PathVariable(name = "nameContragent") String nameContragent, Model model) {
        try {
            contragentService.deleteContragent(contragentService.getOneContragent(nameContragent));
        } catch (Exception e) {
            model.addAttribute("contragent", contragentService.getOneContragent(nameContragent));
            model.addAttribute("contragentError", "Контрагента нельзя удалить, потому что он используется в заказах!");
            return "deletionContragent";
        }
        return "redirect:/contragents";
    }


}
