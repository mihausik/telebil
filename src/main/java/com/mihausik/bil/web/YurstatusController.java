package com.mihausik.bil.web;
import com.mihausik.bil.Yurstatus;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/yurstatuses")
@Controller
@RooWebScaffold(path = "yurstatuses", formBackingObject = Yurstatus.class)
public class YurstatusController {
}
