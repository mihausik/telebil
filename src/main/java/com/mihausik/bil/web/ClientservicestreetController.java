package com.mihausik.bil.web;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import com.mihausik.bil.Clientservice;
import com.mihausik.bil.Clientservicestreet;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/clientservicestreets")
@Controller
@RooWebScaffold(path = "clientservicestreets", formBackingObject = Clientservicestreet.class)
public class ClientservicestreetController {
	
	   @RequestMapping(params = "form", produces = "text/html")
	    public String createForm(@RequestParam(value = "id", required = true) Long id,Model uiModel) {
	        populateEditForm(uiModel, new Clientservicestreet());
	        uiModel.addAttribute("clientservices", Clientservice.findClientservice(id));
	        return "clientservicestreets/create";
	    }
	
	   @RequestMapping(method = RequestMethod.POST, produces = "text/html")
	    public String create(@Valid Clientservicestreet clientservicestreet, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
	        if (bindingResult.hasErrors()) {
	            populateEditForm(uiModel, clientservicestreet);
	            return "clientservicestreets/create";
	        }
	        uiModel.asMap().clear();
	        clientservicestreet.persist();
	        return "redirect:/clientservices/" + encodeUrlPathSegment(clientservicestreet.getClientservice().getId().toString(), httpServletRequest);
	    }
}
