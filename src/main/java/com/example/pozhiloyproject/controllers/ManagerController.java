package com.example.pozhiloyproject.controllers;

import com.example.pozhiloyproject.models.Manager;
import com.example.pozhiloyproject.services.ManagerService;
import com.example.pozhiloyproject.services.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@Controller
@RequestMapping("/admin")
public class ManagerController {

    @Autowired
    ManagerService managerService;

    @Autowired
    RoleService roleService;

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
        manager.setFio_i_o(fio + " " + name.charAt(0) + "." + lastName.charAt(0) + ".");
        managerService.saveManager(manager);
        return "redirect:/managers";
    }

    @GetMapping("managers/{fio}/{name}/{lastName}")
    public String getOneManager(@PathVariable(name = "fio") String fio,
                                @PathVariable(name = "name") String name,
                                @PathVariable(name = "lastName") String lastName, Model model) {
        model.addAttribute("manager", managerService.getOneManager(fio, name, lastName));
        return "oneManager";
    }

    @GetMapping("managers/change/{fio}/{name}/{lastName}")
    public String changeManagerGet(@PathVariable(name = "fio") String fio,
                                   @PathVariable(name = "name") String name,
                                   @PathVariable(name = "lastName") String lastName,
                                   Model model) {
        model.addAttribute("roles",roleService.getAllRoles());
        model.addAttribute("manager", managerService.getOneManager(fio, name, lastName));
        return "changeManager";
    }

    @PostMapping("managers/change/{fio}/{name}/{lastName}")
    public String changeManagerPost(@PathVariable(name = "fio") String fio,
                                    @PathVariable(name = "name") String name,
                                    @PathVariable(name = "lastName") String lastName,
                                    @RequestParam(required = false) String fioManager,
                                    @RequestParam(required = false) String nameManager,
                                    @RequestParam(required = false) String lastNameManager,
                                    Model model) {
        Manager manager = managerService.getOneManager(fio, name, lastName);
        manager.setFio(fioManager);
        manager.setName(nameManager);
        manager.setLastName(lastNameManager);
        managerService.saveManager(manager);
        return "redirect:/managers";
    }

    @GetMapping("managers/deletion/{fio}/{name}/{lastName}")
    public String deleteManagerGet(@PathVariable(name = "fio") String fio,
                                   @PathVariable(name = "name") String name,
                                   @PathVariable(name = "lastName") String lastName,
                                   Model model) {


        model.addAttribute("manager", managerService.getOneManager(fio, name, lastName));
        return "deletionManager";
    }

    @PostMapping("managers/deletion/{fio}/{name}/{lastName}")
    public String deleteManagerPost(@PathVariable(name = "fio") String fio,
                                    @PathVariable(name = "name") String name,
                                    @PathVariable(name = "lastName") String lastName,
                                    Model model) {
        try {
            managerService.deleteManager(managerService.getOneManager(fio, name, lastName));
        } catch (Exception e) {
            model.addAttribute("manager", managerService.getOneManager(fio, name, lastName));
            model.addAttribute("managerError", "Менеджера нельзя удалить, потому что она используется в заказах!");
            return "deletionManager";
        }
        return "redirect:/managers";
    }
}
