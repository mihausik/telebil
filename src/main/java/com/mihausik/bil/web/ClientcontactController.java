package com.mihausik.bil.web;
import com.mihausik.bil.Clientcontact;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/clientcontacts")
@Controller
@RooWebScaffold(path = "clientcontacts", formBackingObject = Clientcontact.class)
public class ClientcontactController {
}
