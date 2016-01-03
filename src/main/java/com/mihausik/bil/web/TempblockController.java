package com.mihausik.bil.web;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import com.mihausik.bil.Clientservice;
import com.mihausik.bil.Tempblock;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;

@RequestMapping("/tempblocks")
@Controller
@RooWebScaffold(path = "tempblocks", formBackingObject = Tempblock.class)
@RooWebFinder
public class TempblockController {

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Tempblock tempblock, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, tempblock);
            return "tempblocks/create";
        }
        uiModel.asMap().clear();
        tempblock.persist();
        return "redirect:/clientservices/" + encodeUrlPathSegment(tempblock.getClientservice().getId().toString(), httpServletRequest);
    }

    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(@RequestParam(value = "id", required = true) Long id, Model uiModel) {
        //  public String createForm( Model uiModel) {
        populateEditForm(uiModel, new Tempblock());
        uiModel.addAttribute("clientservices", Clientservice.findClientservice(id));
        //        uiModel.addAttribute("clientservices", Clientservice.findAllClientservices());
        return "tempblocks/create";
    }

    void populateEditForm(Model uiModel, Tempblock tempblock) {
        uiModel.addAttribute("tempblock", tempblock);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("clientservices", Clientservice.findAllClientservices());
    }
   
    @RequestMapping(params = "find=ByClientservice", method = RequestMethod.GET)
    public String findTempblocksByClientservice(@RequestParam("clientservice") Clientservice clientservice, Model uiModel) {
        uiModel.addAttribute("tempblocks", Tempblock.findTempblocksByClientservice(clientservice).getResultList());
        uiModel.addAttribute("clientservices", clientservice.getId());
        addDateTimeFormatPatterns(uiModel);
        return "tempblocks/list";
    }
    
    @RequestMapping(params = { "find=ByClientservice", "form" }, method = RequestMethod.GET)
    public String findTempblocksByClientserviceForm(Model uiModel) {
        uiModel.addAttribute("clientservices", Clientservice.findAllClientservices());
        return "tempblocks/findTempblocksByClientservice";
    }
    
   
}
