package com.mihausik.bil.web;
import com.mihausik.bil.Devicetype;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/devicetypes")
@Controller
@RooWebScaffold(path = "devicetypes", formBackingObject = Devicetype.class)
public class DevicetypeController {
}
