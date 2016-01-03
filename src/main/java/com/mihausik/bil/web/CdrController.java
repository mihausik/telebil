package com.mihausik.bil.web;
import java.util.Date;

import com.mihausik.bil.Cdr;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;

@RequestMapping("/cdrs")
@Controller
@RooWebScaffold(path = "cdrs", formBackingObject = Cdr.class, create = false)
@RooWebFinder
public class CdrController {

    void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("cdr_calltime_date_format", "HH:mm:ss dd-MM-yy");
    }
    
    @RequestMapping(params = { "find=BySourceLikeOrCalltimeBetween", "form" }, method = RequestMethod.GET)
    public String findCdrsBySourceLikeOrCalltimeBetweenForm(Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        return "cdrs/findCdrsBySourceLikeOrCalltimeBetween";
    }
    
    @RequestMapping(params = "find=BySourceLikeOrCalltimeBetween", method = RequestMethod.GET)
    public String findCdrsBySourceLikeOrCalltimeBetween(@RequestParam("source") String source, @RequestParam("minCalltime") @DateTimeFormat(pattern = "HH:mm:ss dd-MM-yy") Date minCalltime, @RequestParam("maxCalltime") @DateTimeFormat(pattern = "HH:mm:ss dd-MM-yy") Date maxCalltime,  Model uiModel) {
       uiModel.addAttribute("cdrs", Cdr.findCdrsBySourceLikeOrCalltimeBetween(source, minCalltime, maxCalltime).getResultList());
        addDateTimeFormatPatterns(uiModel);
        return "cdrs/list";
    }
}
