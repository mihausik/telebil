package com.mihausik.bil.web;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import com.mihausik.bil.Clientservicecredit;
import com.mihausik.bil.Clientservice;
import com.mihausik.bil.Manager;
import com.mihausik.bil.Service;

import org.apache.commons.lang3.time.DateUtils;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/clientservicecredits")
@Controller
@RooWebScaffold(path = "clientservicecredits", formBackingObject = Clientservicecredit.class)
public class ClientservicecreditController {
	
	 @RequestMapping(method = RequestMethod.POST, produces = "text/html")
	    public String create(@Valid Clientservicecredit clientservicecredit, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
	        if (bindingResult.hasErrors()) {
	            populateEditForm(uiModel, clientservicecredit);
	            return "clientservicecredits/create";
	        }
	        uiModel.asMap().clear();
	        SimpleDateFormat formatter2 = new SimpleDateFormat( "yyyy-MM-dd" );
	        String datastartcredit = formatter2.format( new Date() );
	        Date inoneweek = DateUtils.addDays(new Date(), 6);
	        String datastopcredit = formatter2.format(inoneweek);
	        Clientservice clientservice=clientservicecredit.getClientservice();
	        clientservicecredit.setDatastartcredit(datastartcredit);
	        clientservicecredit.setDatastopcredit(datastopcredit);
	        Integer credit=clientservicecredit.getCredit();
	        clientservice.setPhonecreditblock(String.valueOf(credit));
	        clientservice.setCreditdate(datastartcredit);
	        String username = SecurityContextHolder.getContext().getAuthentication().getName();
	        String manager = Manager.findManagersByLoginEquals(username).getSingleResult().getManname().toString();
	        clientservice.setWhogavecredit(manager);
	        clientservice.persist();
	        clientservicecredit.persist();
	        return "redirect:/clientservices/" + encodeUrlPathSegment(clientservicecredit.getClientservice().getId().toString(), httpServletRequest);
	    }
	    
	    @RequestMapping(params = "form", produces = "text/html")
	    public String createForm(@RequestParam(value = "id", required = true) Long id, Model uiModel) {
	        populateEditForm(uiModel, new Clientservicecredit());
	        uiModel.addAttribute("clientservices", Clientservice.findClientservice(id));
	        Service curservice=Clientservice.findClientservice(id).getService();
	        Float curabonka=curservice.getPrice();
	        Integer oldcredit = Integer.valueOf(Clientservice.findClientservice(id).getPhonecreditblock());
	        Integer numdays = Calendar.getInstance().getActualMaximum(Calendar.DAY_OF_MONTH);
	        System.out.println(numdays);
	        Integer curcredit=Math.round(curabonka/numdays*7);
	        System.out.println(curcredit);
	        SimpleDateFormat formatter = new SimpleDateFormat( "yyyy-MM" );
	        String dataforsql = formatter.format( new Date() );
	        Long datepresence=Clientservicecredit.findClientservicecreditsByClientserviceAndDatastartcreditBetween(Clientservice.findClientservice(id), dataforsql);
	        if (datepresence > 0) {
	        	return "clientservicecredits/nocredit";
	        }
	        if (oldcredit > curcredit) {
	        	return "clientservicecredits/biggercredit";
	        }
	        uiModel.addAttribute("curcredit", curcredit);
	        return "clientservicecredits/create";
	    }
	    
	    @RequestMapping(value = "/{id}", produces = "text/html")
	    public String show(@PathVariable("id") Long id, Model uiModel) {
	    	Clientservicecredit curclscredit=Clientservicecredit.findClientservicecredit(id);
	        uiModel.addAttribute("clientservicecredit", curclscredit);
	        uiModel.addAttribute("clientservice", Clientservicecredit.findClientserviceByClientservicecredits(curclscredit));
	        uiModel.addAttribute("itemId", id);
	        return "clientservicecredits/show";
	    }
}
