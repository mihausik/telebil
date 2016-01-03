package com.mihausik.bil.web;
import com.mihausik.bil.Service;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;

@RequestMapping("/services")
@Controller
@RooWebScaffold(path = "services", formBackingObject = Service.class)
@RooWebFinder
public class ServiceController {
}
