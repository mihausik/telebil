package com.mihausik.bil.web;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import com.mihausik.bil.Clientservice;
import com.mihausik.bil.Csbalancedate;
import com.mihausik.bil.Payment;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;

import java.util.Date;

@RequestMapping("/csbalancedates")
@Controller
@RooWebScaffold(path = "csbalancedates", formBackingObject = Csbalancedate.class)
@RooWebFinder
public class CsbalancedateController {

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Csbalancedate csbalancedate, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, csbalancedate);
            return "csbalancedates/create";
        }
        uiModel.asMap().clear();
        csbalancedate.persist();
        return "redirect:/csbalancedates/" + encodeUrlPathSegment(csbalancedate.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = { "find=ByDateBetweenAndClientservice", "form" }, method = RequestMethod.GET)
    public String findCsbalancedatesByDateBetweenAndClientserviceForm(@RequestParam(value = "id", required = true) Long id,Model uiModel) {
        uiModel.addAttribute("clientservices", Clientservice.findClientservice(id));
        addDateTimeFormatPatterns(uiModel);
        return "csbalancedates/findCsbalancedatesByDateBetweenAndClientservice";
    }
    
    @RequestMapping(params = "find=ByDateBetweenAndClientservice", method = RequestMethod.GET)
    public String findCsbalancedatesByDateBetweenAndClientservice(@RequestParam("minDate") @DateTimeFormat(style = "S-") Date minDate, @RequestParam("maxDate") @DateTimeFormat(style = "S-") Date maxDate, @RequestParam("clientservice") Clientservice clientservice, Model uiModel) {
        uiModel.addAttribute("csbalancedates", Csbalancedate.findCsbalancedatesByDateBetweenAndClientservice(minDate, maxDate, clientservice).getResultList());
        uiModel.addAttribute("csbalancedatesclient", Payment.getClientbyclientservice(clientservice));
        addDateTimeFormatPatterns(uiModel);
        return "csbalancedates/list";
    }
    
    
       
}
