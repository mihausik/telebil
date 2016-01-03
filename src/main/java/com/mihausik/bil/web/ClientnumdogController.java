package com.mihausik.bil.web;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import com.mihausik.bil.Client;
import com.mihausik.bil.Clientnumdog;
import com.mihausik.bil.Clientservice;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/clientnumdogs")
@Controller
@RooWebScaffold(path = "clientnumdogs", formBackingObject = Clientnumdog.class)
public class ClientnumdogController {

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Clientnumdog clientnumdog, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, clientnumdog);
            return "clientnumdogs/create";
        }
        uiModel.asMap().clear();
        clientnumdog.persist();
        return "redirect:/clients/" + encodeUrlPathSegment(clientnumdog.getClient().getId().toString(), httpServletRequest);
    }

    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(@RequestParam(value = "id", required = true) Long id, Model uiModel) {
        populateEditForm(uiModel, new Clientnumdog());
        uiModel.addAttribute("clients", Client.findClient(id));
        uiModel.addAttribute("clientservices", Clientservice.findClientservicesByClient(Client.findClient(id)).getResultList());
        return "clientnumdogs/create";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid Clientnumdog clientnumdog, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, clientnumdog);
            return "clientnumdogs/update";
        }
        uiModel.asMap().clear();
        clientnumdog.merge();
        return "redirect:/clients/" + encodeUrlPathSegment(clientnumdog.getClient().getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel,HttpServletRequest httpServletRequest) {
        Clientnumdog clientnumdog = Clientnumdog.findClientnumdog(id);
        clientnumdog.remove();
        uiModel.asMap().clear();
        return "redirect:/clients/" + encodeUrlPathSegment(clientnumdog.getClient().getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Clientnumdog.findClientnumdog(id));
        return "clientnumdogs/update";
    }
}
