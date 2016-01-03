package com.mihausik.bil.web;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import com.mihausik.bil.Clientservice;
import com.mihausik.bil.Clientservicephone;
import com.mihausik.bil.Phone;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

@RequestMapping("/clientservicephones")
@Controller
@RooWebScaffold(path = "clientservicephones", formBackingObject = Clientservicephone.class)
public class ClientservicephoneController {
	
	   @RequestMapping(params = "form", produces = "text/html")
	    public String createForm(@RequestParam(value = "id", required = true) Long id, Model uiModel) {
	        populateEditForm(uiModel, new Clientservicephone());
	        System.out.println("phone form");
	        uiModel.addAttribute("clientservices", Clientservice.findClientservice(id));
	        return "clientservicephones/create";
	    }

	
	 @RequestMapping(method = RequestMethod.POST, produces = "text/html")
	    public String create(@Valid Clientservicephone clientservicephone, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
	        if (bindingResult.hasErrors()) {
	            populateEditForm(uiModel, clientservicephone);
	            return "clientservicephones/create";
	        }
	        //Phone phone = Phone.findPhone(clientservicephone.getPhone().getId());
	        //phone.setInuse(true);
	        uiModel.asMap().clear();
	        clientservicephone.persist();
	        return "redirect:/clientservices/" + encodeUrlPathSegment(clientservicephone.getClientservice().getId().toString(), httpServletRequest);
	    }
	 
	 void populateEditForm(Model uiModel, Clientservicephone clientservicephone) {
	        uiModel.addAttribute("clientservicephone", clientservicephone);
	        uiModel.addAttribute("clientservices", Clientservice.findAllClientservices());
	        uiModel.addAttribute("phones", Phone.findAllPhonesinuse());
	    }
	 
	 String encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
	        String enc = httpServletRequest.getCharacterEncoding();
	        if (enc == null) {
	            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
	        }
	        try {
	            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
	        } catch (UnsupportedEncodingException uee) {}
	        return pathSegment;
	    }
	    
	 @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
	    public String update(@Valid Clientservicephone clientservicephone, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
	        if (bindingResult.hasErrors()) {
	            populateEditForm(uiModel, clientservicephone);
	            return "clientservicephones/update";
	        }
	        uiModel.asMap().clear();
	        clientservicephone.merge();
	        return "redirect:/clientservices/" + encodeUrlPathSegment(clientservicephone.getClientservice().getId().toString(), httpServletRequest);
	    }
	 
	 @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
	    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel,HttpServletRequest httpServletRequest) {
	        Clientservicephone clientservicephone = Clientservicephone.findClientservicephone(id);
	        clientservicephone.remove();
	        uiModel.asMap().clear();
	        return "redirect:/clientservices/" + encodeUrlPathSegment(clientservicephone.getClientservice().getId().toString(), httpServletRequest);
	    }
}
