package com.mihausik.bil.web;
import com.mihausik.bil.Commutator;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/commutators")
@Controller
@RooWebScaffold(path = "commutators", formBackingObject = Commutator.class)
public class CommutatorController {
}
