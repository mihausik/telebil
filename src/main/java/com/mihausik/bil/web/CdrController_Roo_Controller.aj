// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mihausik.bil.web;

import com.mihausik.bil.Cdr;
import com.mihausik.bil.Clientservice;
import com.mihausik.bil.web.CdrController;

import java.io.UnsupportedEncodingException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect CdrController_Roo_Controller {
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String CdrController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("cdr", Cdr.findCdr(id));
        uiModel.addAttribute("itemId", id);
        return "cdrs/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String CdrController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("cdrs", Cdr.findCdrEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Cdr.countCdrs() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("cdrs", Cdr.findAllCdrs(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "cdrs/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String CdrController.update(@Valid Cdr cdr, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, cdr);
            return "cdrs/update";
        }
        uiModel.asMap().clear();
        cdr.merge();
        return "redirect:/cdrs/" + encodeUrlPathSegment(cdr.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String CdrController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Cdr.findCdr(id));
        return "cdrs/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String CdrController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Cdr cdr = Cdr.findCdr(id);
        cdr.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/cdrs";
    }
    
    void CdrController.populateEditForm(Model uiModel, Cdr cdr) {
        uiModel.addAttribute("cdr", cdr);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("clientservices", Clientservice.findAllClientservices());
    }
    
    String CdrController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
