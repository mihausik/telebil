package com.mihausik.bil.web;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import com.mihausik.bil.Clientservice;
import com.mihausik.bil.Clientservicerecount;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;

@RequestMapping("/clientservicerecounts")
@Controller
@RooWebScaffold(path = "clientservicerecounts", formBackingObject = Clientservicerecount.class)
@RooWebFinder
public class ClientservicerecountController {

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Clientservicerecount clientservicerecount, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, clientservicerecount);
            return "clientservicerecounts/create";
        }
        uiModel.asMap().clear();
        Date date1 = clientservicerecount.getDatastartrecount();
        Date date2 = clientservicerecount.getDatastoprecount();
        long diff = date2.getTime() - date1.getTime();
        Float floatdiffdays=Float.valueOf(diff) / Float.valueOf(86400000);
        long diffDays= Long.valueOf((long) Math.ceil(floatdiffdays));
        clientservicerecount.setNumdays(diffDays+1);
        clientservicerecount.persist();
        return "redirect:/clientservices/" + encodeUrlPathSegment(clientservicerecount.getClientservice().getId().toString(), httpServletRequest);
    }

    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(@RequestParam(value = "id", required = true) Long id, Model uiModel) {
        populateEditForm(uiModel, new Clientservicerecount());
        uiModel.addAttribute("clientservices", Clientservice.findClientservice(id));
        return "clientservicerecounts/create";
    }
    
    @RequestMapping(params = "find=ByClientservice", method = RequestMethod.GET)
    public String findClientservicerecountsByClientservice(@RequestParam("clientservice") Clientservice clientservice, Model uiModel) {
        uiModel.addAttribute("clientservicerecounts", Clientservicerecount.findClientservicerecountsByClientservice(clientservice).getResultList());
       uiModel.addAttribute("clientservices", clientservice.getId());
        return "clientservicerecounts/list";
    }
    
    
    @RequestMapping(params = { "find=ByClientservice", "form" }, method = RequestMethod.GET)
    public String findClientservicerecountsByClientserviceForm(Model uiModel) {
        uiModel.addAttribute("clientservices", Clientservice.findAllClientservices());
        return "clientservicerecounts/findClientservicerecountsByClientservice";
    }
    

}
