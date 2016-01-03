package com.mihausik.bil.web;
import com.mihausik.bil.Callplan;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/callplans")
@Controller
@RooWebScaffold(path = "callplans", formBackingObject = Callplan.class)
public class CallplanController {
}
