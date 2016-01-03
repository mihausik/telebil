package com.mihausik.bil.web;
import com.mihausik.bil.Statuslica;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/statuslicas")
@Controller
@RooWebScaffold(path = "statuslicas", formBackingObject = Statuslica.class)
public class StatuslicaController {
}
