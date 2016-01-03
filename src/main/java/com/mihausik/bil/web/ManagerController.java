package com.mihausik.bil.web;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import com.mihausik.bil.Manager;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;

@RequestMapping("/managers")
@Controller
@RooWebScaffold(path = "managers", formBackingObject = Manager.class)
@RooWebFinder
public class ManagerController {

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Manager manager, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, manager);
        }
        try {
            String hashedPassword = sha256(manager.getPassword());
            manager.setPassword(hashedPassword);
            uiModel.asMap().clear();
            manager.persist();
            return "redirect:/managers/" + encodeUrlPathSegment(manager.getId().toString(), httpServletRequest);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return "managers/create";
    }

    
    
    @PreAuthorize("hasAnyRole('ROLE_ROOT')")
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Manager.findManager(id));
        return "managers/update";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid Manager manager, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, manager);
            return "managers/update";
        }
        uiModel.asMap().clear();
        manager.merge();
        return "redirect:/managers/" + encodeUrlPathSegment(manager.getId().toString(), httpServletRequest);
    }

    private String sha256(String password) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        digest.update(password.getBytes("UTF-8"));
        byte[] hash = digest.digest();
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < hash.length; i++) {
            sb.append(Integer.toString((hash[i] & 0xff) + 0x100, 16).substring(1));
        }
        return sb.toString();
    }
    
    @RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size,  Model uiModel) {
        
            uiModel.addAttribute("managers", Manager.findAllManagers());
        
        return "managers/list";
    }
}
