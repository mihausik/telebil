package com.mihausik.bil.web;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import com.mihausik.bil.Commentszayavok;
import com.mihausik.bil.Commentszayavokremont;
import com.mihausik.bil.Manager;
import com.mihausik.bil.Proverkatahvozm;
import com.mihausik.bil.Zayavkanaremont;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/commentszayavokremonts")
@Controller
@RooWebScaffold(path = "commentszayavokremonts", formBackingObject = Commentszayavokremont.class)
public class CommentsZayavkanaremontController {
	
	 @RequestMapping(method = RequestMethod.POST, produces = "text/html")
	    public String create(@Valid Commentszayavokremont commentszayavokremont, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
	        if (bindingResult.hasErrors()) {
	            populateEditForm(uiModel, commentszayavokremont);
	            return "commentszayavokremonts/create";
	        }
	        uiModel.asMap().clear();
	        commentszayavokremont.persist();
	        return "redirect:/zayavkanaremonts/" + encodeUrlPathSegment(commentszayavokremont.getZayavkanaremont().getId().toString(), httpServletRequest);
	    }
	    
	    @RequestMapping(params = "form", produces = "text/html")
	    public String createForm(@RequestParam(value = "id", required = true) Long id, Model uiModel) {
	        populateEditForm(uiModel, new Commentszayavokremont());
	        String username = SecurityContextHolder.getContext().getAuthentication().getName();
	        uiModel.addAttribute("managers", Manager.findManagersByLoginEquals(username).getResultList());
	        uiModel.addAttribute("zayavkanaremonts", Zayavkanaremont.findZayavkanaremont(id));
	        return "commentszayavokremonts/create";
	    }
}
