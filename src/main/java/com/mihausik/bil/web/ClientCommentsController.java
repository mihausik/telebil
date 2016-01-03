package com.mihausik.bil.web;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

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

import com.mihausik.bil.Client;
import com.mihausik.bil.ClientComments;




@RequestMapping("/clientcomments")
@Controller
@RooWebScaffold(path = "clientcomments", formBackingObject = ClientComments.class)
public class ClientCommentsController {

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid ClientComments clientcomments, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, clientcomments);
            return "clientcomments/create";
        }
        uiModel.asMap().clear();
        clientcomments.persist();
        return "redirect:/clients/" + encodeUrlPathSegment(clientcomments.getClient().getId().toString(), httpServletRequest);
    }
    
     @RequestMapping(params = "form", produces = "text/html")
    public String createForm(@RequestParam(value = "id", required = true) Long id, Model uiModel) {
    	 populateEditForm(uiModel, new ClientComments());
    	uiModel.addAttribute("clients", Client.findClient(id));
        return "clientcomments/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("clientcomments", ClientComments.findClientComments(id));
        uiModel.addAttribute("itemId", id);
        return "clientcomments/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String list(Model uiModel) {
            uiModel.addAttribute("clientcomments", ClientComments.findAllClientCommentses());
        return "clientcomments/list";
    }
    
    
    void populateEditForm(Model uiModel, ClientComments clientComments) {
        uiModel.addAttribute("clientcomments", clientComments);
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
    public String update(@Valid ClientComments clientComments, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, clientComments);
            return "clientcomments/update";
        }
        uiModel.asMap().clear();
        clientComments.merge();
        return "redirect:/clients/" + encodeUrlPathSegment(clientComments.getClient().getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, ClientComments.findClientComments(id));
        uiModel.addAttribute("clients", ClientComments.findClientComments(id).getClient());
        return "clientcomments/update";
    }

}
