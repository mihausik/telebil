package com.mihausik.bil.web;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import com.mihausik.bil.Client;
import com.mihausik.bil.Clientcontact;
import com.mihausik.bil.Clientcontacttype;
import com.mihausik.bil.Clientdata;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/clientdatas")
@Controller
@RooWebScaffold(path = "clientdatas", formBackingObject = Clientdata.class)
public class ClientdataController {

    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(@RequestParam(value = "id", required = true) Long id, Model uiModel) {
        populateEditForm(uiModel, new Clientdata());
        uiModel.addAttribute("clients", Client.findClient(id));
        return "clientdatas/create";
    }

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Clientdata clientdata, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, clientdata);
            return "clientdatas/create";
        }
        uiModel.asMap().clear();
        clientdata.persist();
        return "redirect:/clients/" + encodeUrlPathSegment(clientdata.getClient().getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid Clientdata clientdata, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, clientdata);
            return "clientdatas/update";
        }
        uiModel.asMap().clear();
        clientdata.merge();
        return "redirect:/clients/" + encodeUrlPathSegment(clientdata.getClient().getId().toString(), httpServletRequest);
    }
    
   
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel, HttpServletRequest httpServletRequest) {
        Clientdata clientdata = Clientdata.findClientdata(id);
        clientdata.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/clients/" + encodeUrlPathSegment(clientdata.getClient().getId().toString(), httpServletRequest);
    }
    void populateEditForm(Model uiModel, Clientdata clientdata) {
        uiModel.addAttribute("clientdata", clientdata);
        uiModel.addAttribute("clients", Client.findAllClients());
        uiModel.addAttribute("clientcontacts", Clientcontact.findAllClientcontacts());
        uiModel.addAttribute("clientcontacttypes", Clientcontacttype.findAllClientcontacttypes());
    }
}
