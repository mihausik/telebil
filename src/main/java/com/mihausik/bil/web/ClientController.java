package com.mihausik.bil.web;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import com.mihausik.bil.Client;
import com.mihausik.bil.ClientComments;
import com.mihausik.bil.Clientdata;
import com.mihausik.bil.Clientnotification;
import com.mihausik.bil.Clientnumdog;
import com.mihausik.bil.Clientservice;
import com.mihausik.bil.Manager;
import com.mihausik.bil.Ocherednapodkluchenie;
import com.mihausik.bil.Service;
import com.mihausik.bil.Statuslica;
import com.mihausik.bil.Supplier;
import com.mihausik.bil.Yurstatus;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;

@RequestMapping("/clients")
@Controller
@RooWebScaffold(path = "clients", formBackingObject = Client.class)
@RooWebFinder
public class ClientController {

    @RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("client", Client.findClient(id));
        uiModel.addAttribute("itemId", id);
        uiModel.addAttribute("clientcomments",ClientComments.findcommentsByClient(Client.findClient(id)).getResultList());
        uiModel.addAttribute("cbalance", Clientservice.getSumBalance(Client.findClient(id)));
        uiModel.addAttribute("services", Clientservice.findClientservicesByClient(Client.findClient(id)).getResultList());
        uiModel.addAttribute("clientdatateh", Clientdata.findtehcontactsByClient(Client.findClient(id)).getResultList());
        uiModel.addAttribute("clientdatafin", Clientdata.findfincontactsByClient(Client.findClient(id)).getResultList());
        uiModel.addAttribute("clientdatagen", Clientdata.findgencontactsByClient(Client.findClient(id)).getResultList());
        uiModel.addAttribute("clientnotif", Clientnotification.findnotifByClient(Client.findClient(id)).getResultList());
        uiModel.addAttribute("clientnumdog", Clientnumdog.findClientnumdogsByClient(Client.findClient(id)).getResultList());
        addDateTimeFormatPatterns(uiModel);
        return "clients/show";
    }

    void populateEditForm(Model uiModel, Client client) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        uiModel.addAttribute("client", client);
        uiModel.addAttribute("managers", Manager.findManagersByLoginEquals(username).getResultList());
        uiModel.addAttribute("statuslicas", Statuslica.findAllStatuslicas());
        uiModel.addAttribute("suppliers", Supplier.findAllSuppliers());
        uiModel.addAttribute("yurstatuses", Yurstatus.findAllYurstatuses());
    }
    
    void populateEditForm_update(Model uiModel, Client client) {
        uiModel.addAttribute("client", client);
        uiModel.addAttribute("managers", Manager.findAllManagers());
        uiModel.addAttribute("statuslicas", Statuslica.findAllStatuslicas());
        uiModel.addAttribute("suppliers", Supplier.findAllSuppliers());
        uiModel.addAttribute("yurstatuses", Yurstatus.findAllYurstatuses());
    }

    @RequestMapping(params = { "find=ByAll", "form" }, method = RequestMethod.GET)
    public String findClientsByAll(Model uiModel) {
        return "clients/findClientsByAll";
    }

    @RequestMapping(params = "find=ByAll", method = RequestMethod.GET)
    public String findClientsByAll(@RequestParam("parameter") String parameter, Model uiModel) {
        uiModel.addAttribute("clients", Client.findClientsByAll(parameter).getResultList());
        return "clients/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid Client client, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm_update(uiModel, client);
            return "clients/update";
        }
        uiModel.asMap().clear();
        client.merge();
        return "redirect:/clients/" + encodeUrlPathSegment(client.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm_update(uiModel, Client.findClient(id));
        return "clients/update";
    }
    
    void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("client_datazakldog_date_format", "dd-MMM-YYYY");
    }
    
    @RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("clients", Client.findClientEntries(firstResult, sizeNo));
            float nrOfPages = (float) Client.countClients() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
        	size=50;
        	int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("clients", Client.findClientEntries(firstResult, sizeNo));
            float nrOfPages = (float) Client.countClients() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
            //uiModel.addAttribute("clients", Client.findAllClients());
        }
        return "clients/list";
    }
    
    @RequestMapping(params = { "find=BySupplier", "form" }, method = RequestMethod.GET)
    public String findClientsBySupplierForm(Model uiModel) {
        uiModel.addAttribute("suppliers", Supplier.findAllSuppliers());
        return "clients/findClientsBySupplier";
    }
    
    @RequestMapping(params = "find=BySupplier", method = RequestMethod.GET)
    public String findClientsBySupplier(@RequestParam("supplier") Supplier supplier, Model uiModel) {
    	/*Integer size=50;
    	Integer page=1;
    	int sizeNo = size == null ? 10 : size.intValue();
        final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
        //uiModel.addAttribute("clients", Client.findClientEntries(firstResult, sizeNo));
        float nrOfPages = (float) Client.countClients() / sizeNo;
        uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        */uiModel.addAttribute("clients", Client.findClientsBySupplier(supplier).getResultList());
        return "clients/list";
    }
    
    @RequestMapping(params = { "find=ByService", "form" }, method = RequestMethod.GET)
    public String findClientsByServiceForm(Model uiModel) {
        uiModel.addAttribute("services", Service.findAllServices());
        return "clients/findClientsByService";
    }
    
    @RequestMapping(params = "find=ByService", method = RequestMethod.GET)
    public String findClientsByService(@RequestParam("service") Service service, Model uiModel) {
    	uiModel.addAttribute("clients", Client.findClientsByService(service).getResultList());
        return "clients/list";
    }
    
    @RequestMapping(params = { "find=ByIP", "form" }, method = RequestMethod.GET)
    public String findClientsByIP(Model uiModel) {
        return "clients/findClientsByIP";
    }

    @RequestMapping(params = "find=ByIP", method = RequestMethod.GET)
    public String findClientsByIP(@RequestParam("parameter") String parameter, Model uiModel) {
        uiModel.addAttribute("clients", Client.findClientsByIP(parameter).getResultList());
        return "clients/list";
    }
    
    
    @RequestMapping(params = { "find=ByDog", "form" }, method = RequestMethod.GET)
    public String findClientsByDog(Model uiModel) {
        return "clients/findClientsByDog";
    }
        
    @RequestMapping(params = "find=ByDog", method = RequestMethod.GET)
    public String findClientsByDog(@RequestParam("parameter") String parameter, Model uiModel) {
        uiModel.addAttribute("clients", Client.findClientsByDog(parameter).getResultList());
        return "clients/list";
    }
    
    @RequestMapping(value = "/arhiv", produces = "text/html")
    public String arhivList(Model uiModel) {
        uiModel.addAttribute("clients", Client.findAllArhivClients());
        return "clients/list";
    }
}
