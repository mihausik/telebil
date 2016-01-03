package com.mihausik.bil.web;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import com.mihausik.bil.Clientservice;
import com.mihausik.bil.Clientserviceip;
import com.mihausik.bil.IPtype;
import com.mihausik.bil.TVexist;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/clientserviceips")
@Controller
@RooWebScaffold(path = "clientserviceips", formBackingObject = Clientserviceip.class)
public class ClientserviceipController {
	
	 @RequestMapping(method = RequestMethod.POST, produces = "text/html")
	    public String create(@Valid Clientserviceip clientserviceip, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
	        if (bindingResult.hasErrors()) {
	            populateEditForm(uiModel, clientserviceip);
	            return "clientserviceips/create";
	        }
	        uiModel.asMap().clear();
	        String ip=clientserviceip.getIp();
	        Long isipindb=Clientserviceip.findClientserviceipsByIp(ip);
	        System.out.println(ip);
	        System.out.println(isipindb);
	        if (isipindb > 0) {
	        	Long id=clientserviceip.getClientservice().getId();
	        	populateEditForm(uiModel, new Clientserviceip());
		        uiModel.addAttribute("clientservices", Clientservice.findClientservice(id));
	            return "clientserviceips/create";
	        }
	        clientserviceip.persist();
	        return "redirect:/clientservices/" + encodeUrlPathSegment(clientserviceip.getClientservice().getId().toString(), httpServletRequest);
	    }
	    
	    @RequestMapping(params = "form", produces = "text/html")
	    public String createForm(@RequestParam(value = "id", required = true) Long id,Model uiModel) {
	        populateEditForm(uiModel, new Clientserviceip());
	        uiModel.addAttribute("clientservices", Clientservice.findClientservice(id));
	        uiModel.addAttribute("dhcp", Arrays.asList(IPtype.values()));
	        return "clientserviceips/create";
	    }
	    
	    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
	    public String update(@Valid Clientserviceip clientserviceip, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
	        if (bindingResult.hasErrors()) {
	            populateEditForm(uiModel, clientserviceip);
	            return "clientserviceips/update";
	        }
	        uiModel.asMap().clear();
	        clientserviceip.merge();
	        try
	        {            
	            Runtime rt = Runtime.getRuntime();
	            Process proc = rt.exec("/root/getspeeds-ng-log.py");
	            //Process proc = rt.exec("calc.exe");
	            InputStream stderr = proc.getErrorStream();
	            InputStreamReader isr = new InputStreamReader(stderr);
	            BufferedReader br = new BufferedReader(isr);
	            String line = null;
	            while ( (line = br.readLine()) != null)
	                System.out.println(line);
	            int exitVal = proc.waitFor();
	            System.out.println("Process exitValue: " + exitVal);
	        } catch (Throwable t)
	          {
	            t.printStackTrace();
	          }
	        return "redirect:/clientservices/" + encodeUrlPathSegment(clientserviceip.getClientservice().getId().toString(), httpServletRequest);
	    }
	    
	    	    
	    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
	    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel, HttpServletRequest httpServletRequest) {
	        Clientserviceip clientserviceip = Clientserviceip.findClientserviceip(id);
	        clientserviceip.remove();
	        uiModel.asMap().clear();
	        return "redirect:/clientservices/" + encodeUrlPathSegment(clientserviceip.getClientservice().getId().toString(), httpServletRequest);
	    }
	    
}
