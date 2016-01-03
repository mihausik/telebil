package com.mihausik.bil;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/clientsservice/**")
@Controller
public class Clientsservice {


	@RequestMapping(value="/ServiceByClient",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	 public String ServiceByClient(@RequestParam Client client) {
	    	System.out.println("new controller");
	    	List<Clientservice> items = Clientservice.findClientservicesByClient(client).getResultList();
	    	String out ="";
	    	out += "<div id=\"_c_com_mihausik_bil_Payment_service_id\">";
	    	out += "<label for=\"_service_id\">Услуга:</label>";
	    	out += "<select id=\"_service_id\" name=\"service\">";
	    	for (Clientservice service: items){
	    		out +="<option value=\""+service.getId()+"\">"+service.getService().getName()+",  "+
	    				service.getAddresspreduslugi()+"</option>";
	    	}
	    	out += "</select>";
	    	//out += "<br/><script type=\"text/javascript\">Spring.addDecoration(new Spring."
	    	//		+ "ElementDecoration({elementId : \'_service_id\', widgetType:"
	    	//		+ " 'dijit.form.FilteringSelect', widgetAttrs : {hasDownArrow : true}})); </script></div>";
	    	out += "</div><br/>";
	    	out += "";
            System.out.println(out);
	        return out;
	    }
}
