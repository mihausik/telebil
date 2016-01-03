package com.mihausik.bil.web;
import com.mihausik.bil.Dogovora;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/dogovoras")
@Controller
@RooWebScaffold(path = "dogovoras", formBackingObject = Dogovora.class)
public class DogovorController {
}
