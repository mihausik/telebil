package com.mihausik.bil.web;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import com.mihausik.bil.Clientservice;
import com.mihausik.bil.Sip;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/sips")
@Controller
@RooWebScaffold(path = "sips", formBackingObject = Sip.class)
public class SipController {
	
	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Sip sip, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, sip);
            return "sips/create";
        }
        uiModel.asMap().clear();
        sip.persist();
        return "redirect:/sips/" + encodeUrlPathSegment(sip.getId().toString(), httpServletRequest);
    }
	
	 @RequestMapping(params = "form", produces = "text/html")
	    public String createForm(@RequestParam(value = "id", required = true) Long id,Model uiModel) {
	        populateEditForm(uiModel, new Sip());
	        uiModel.addAttribute("clientservices", Clientservice.findClientservice(id));
	        return "sips/create";
	    }
	
}
