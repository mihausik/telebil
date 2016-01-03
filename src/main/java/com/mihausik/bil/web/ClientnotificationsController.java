package com.mihausik.bil.web;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import com.mihausik.bil.Client;
import com.mihausik.bil.Clientdata;
import com.mihausik.bil.Clientnotification;
import com.mihausik.bil.Clientnumdog;
import com.mihausik.bil.Clientservice;
import com.mihausik.bil.Notiftype;

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

@RequestMapping("/clientnotifications")
@Controller
@RooWebScaffold(path = "clientnotifications", formBackingObject = Clientnotification.class)
public class ClientnotificationsController {
	
    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(@RequestParam(value = "id", required = true) Long id, Model uiModel) {
        populateEditForm(uiModel, new Clientnotification());
        uiModel.addAttribute("clients", Client.findClient(id));
        uiModel.addAttribute("clientservices", Clientservice.findClientservicesByClient(Client.findClient(id)).getResultList());
        return "clientnotifications/create";
    }
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Clientnotification clientnotification, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, clientnotification);
            return "clientnotifications/create";
        }
        uiModel.asMap().clear();
        clientnotification.persist();
        return "redirect:/clients/" + encodeUrlPathSegment(clientnotification.getClient().getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Clientnotification.findClientnotification(id));
        return "clientnotifications/update";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid Clientnotification clientnotification, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, clientnotification);
            return "clientnotifications/update";
        }
        uiModel.asMap().clear();
        clientnotification.merge();
        return "redirect:/clients/" + encodeUrlPathSegment(clientnotification.getClient().getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel,HttpServletRequest httpServletRequest) {
        Clientnotification clientnotification = Clientnotification.findClientnotification(id);
        clientnotification.remove();
        uiModel.asMap().clear();
        return "redirect:/clients/" + encodeUrlPathSegment(clientnotification.getClient().getId().toString(), httpServletRequest);
    }
    
    void populateEditForm(Model uiModel, Clientnotification clientnotification) {
        uiModel.addAttribute("clientnotification", clientnotification);
        uiModel.addAttribute("clients", Client.findAllClients());
        uiModel.addAttribute("clientservices", Clientservice.findAllClientservices());
        uiModel.addAttribute("notiftypes", Arrays.asList(Notiftype.values()));
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
    
  }
