package com.mihausik.bil.web;
import com.mihausik.bil.Clientcontacttype;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/clientcontacttypes")
@Controller
@RooWebScaffold(path = "clientcontacttypes", formBackingObject = Clientcontacttype.class)
public class ClientcontacttypeController {
}
