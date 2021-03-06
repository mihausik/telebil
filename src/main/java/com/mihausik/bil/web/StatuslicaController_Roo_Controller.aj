// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mihausik.bil.web;

import com.mihausik.bil.Statuslica;
import com.mihausik.bil.web.StatuslicaController;
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

privileged aspect StatuslicaController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String StatuslicaController.create(@Valid Statuslica statuslica, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, statuslica);
            return "statuslicas/create";
        }
        uiModel.asMap().clear();
        statuslica.persist();
        return "redirect:/statuslicas/" + encodeUrlPathSegment(statuslica.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String StatuslicaController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Statuslica());
        return "statuslicas/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String StatuslicaController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("statuslica", Statuslica.findStatuslica(id));
        uiModel.addAttribute("itemId", id);
        return "statuslicas/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String StatuslicaController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("statuslicas", Statuslica.findStatuslicaEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Statuslica.countStatuslicas() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("statuslicas", Statuslica.findAllStatuslicas(sortFieldName, sortOrder));
        }
        return "statuslicas/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String StatuslicaController.update(@Valid Statuslica statuslica, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, statuslica);
            return "statuslicas/update";
        }
        uiModel.asMap().clear();
        statuslica.merge();
        return "redirect:/statuslicas/" + encodeUrlPathSegment(statuslica.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String StatuslicaController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Statuslica.findStatuslica(id));
        return "statuslicas/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String StatuslicaController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Statuslica statuslica = Statuslica.findStatuslica(id);
        statuslica.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/statuslicas";
    }
    
    void StatuslicaController.populateEditForm(Model uiModel, Statuslica statuslica) {
        uiModel.addAttribute("statuslica", statuslica);
    }
    
    String StatuslicaController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
