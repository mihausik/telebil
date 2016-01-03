package com.mihausik.bil.web;
import com.mihausik.bil.Doljnost;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/doljnosts")
@Controller
@RooWebScaffold(path = "doljnosts", formBackingObject = Doljnost.class)
public class DoljnostController {
}
