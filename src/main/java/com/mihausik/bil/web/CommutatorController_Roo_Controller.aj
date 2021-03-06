// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mihausik.bil.web;

import com.mihausik.bil.Commutator;
import com.mihausik.bil.web.CommutatorController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect CommutatorController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String CommutatorController.create(@Valid Commutator commutator, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, commutator);
            return "commutators/create";
        }
        uiModel.asMap().clear();
        commutator.persist();
        return "redirect:/commutators/" + encodeUrlPathSegment(commutator.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String CommutatorController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Commutator());
        return "commutators/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String CommutatorController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("commutator", Commutator.findCommutator(id));
        uiModel.addAttribute("itemId", id);
        return "commutators/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String CommutatorController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("commutators", Commutator.findCommutatorEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Commutator.countCommutators() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("commutators", Commutator.findAllCommutators(sortFieldName, sortOrder));
        }
        return "commutators/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String CommutatorController.update(@Valid Commutator commutator, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, commutator);
            return "commutators/update";
        }
        uiModel.asMap().clear();
        commutator.merge();
        return "redirect:/commutators/" + encodeUrlPathSegment(commutator.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String CommutatorController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Commutator.findCommutator(id));
        return "commutators/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String CommutatorController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Commutator commutator = Commutator.findCommutator(id);
        commutator.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/commutators";
    }
    
    void CommutatorController.populateEditForm(Model uiModel, Commutator commutator) {
        uiModel.addAttribute("commutator", commutator);
    }
    
    String CommutatorController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
