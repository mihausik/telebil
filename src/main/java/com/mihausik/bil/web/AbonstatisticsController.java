package com.mihausik.bil.web;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.mihausik.bil.Abonstatistics;
import com.mihausik.bil.Clientservice;
import com.mihausik.bil.Supplier;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;

@RequestMapping("/abonstatisticses")
@Controller
@RooWebScaffold(path = "abonstatisticses", formBackingObject = Abonstatistics.class)
@RooWebFinder
public class AbonstatisticsController {
	
	 @RequestMapping(params = { "find=ByDateBetween", "form" }, method = RequestMethod.GET)
	    public String findAbonstatisticsesByDateBetweenForm(Model uiModel) {
	        addDateTimeFormatPatterns(uiModel);
	        return "abonstatisticses/findAbonstatisticsesByDateBetween";
	    }
	    
	    @RequestMapping(params = "find=ByDateBetween", method = RequestMethod.GET)
	    public String findAbonstatisticsesByDateBetween(@RequestParam("minDate") @DateTimeFormat(pattern = "dd-MM-yyyy") Date minDate, @RequestParam("maxDate") @DateTimeFormat(pattern = "dd-MM-yyyy") Date maxDate, Model uiModel) {
	        uiModel.addAttribute("countpodkl", Clientservice.findClientservicesByDatapodkl(minDate, maxDate));
	        uiModel.addAttribute("countotkl", Clientservice.findClientservicesByDataotkl(minDate, maxDate));
	        uiModel.addAttribute("servicepodkl", Clientservice.findServicesByDatapodkl(minDate, maxDate));
	        uiModel.addAttribute("serviceotkl", Clientservice.findServicesByDataotkl(minDate, maxDate));
	        String mindata = new SimpleDateFormat("dd-MMM-yyyy").format(minDate).toString();
	        String maxdata = new SimpleDateFormat("dd-MMM-yyyy").format(maxDate).toString();
	        uiModel.addAttribute("period", mindata+" - "+maxdata);
	        addDateTimeFormatPatterns(uiModel);
	        return "abonstatisticses/list";
	    }
	    
	    @RequestMapping(params = { "find=BySupplier", "form" }, method = RequestMethod.GET)
	    public String findAbonstatisticsesBySupplierForm(Model uiModel) {
	        uiModel.addAttribute("suppliers", Supplier.findAllSuppliers());
	        return "abonstatisticses/findAbonstatisticsesBySupplier";
	    }
	    
	  
	    
	    void addDateTimeFormatPatterns(Model uiModel) {
	        uiModel.addAttribute("abonstatistics_date_date_format", "dd-MM-yyyy");
	    }
	    
}
