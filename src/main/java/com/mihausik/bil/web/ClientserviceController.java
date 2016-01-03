package com.mihausik.bil.web;
import java.io.ByteArrayInputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.io.IOUtils;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.mail.MailSender;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;

import com.mihausik.bil.Citystreets;
import com.mihausik.bil.Client;
import com.mihausik.bil.Clientservice;
import com.mihausik.bil.Clientserviceip;
import com.mihausik.bil.Clientservicephone;
import com.mihausik.bil.Clientservicerecount;
import com.mihausik.bil.Clientservicestatus;
import com.mihausik.bil.Clientservicestreet;
import com.mihausik.bil.Csbalancedate;
import com.mihausik.bil.Manager;
import com.mihausik.bil.Payment;
import com.mihausik.bil.Sip;
import com.mihausik.bil.Tempblock;

@RequestMapping("/clientservices")
@Controller
@RooWebScaffold(path = "clientservices", formBackingObject = Clientservice.class)
@RooWebFinder
public class ClientserviceController {

	
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("clientservice", Clientservice.findClientservice(id));
        uiModel.addAttribute("clientservicephone", Clientservicephone.findClientservicephonesByClientservice(Clientservice.findClientservice(id)).getResultList());
        uiModel.addAttribute("clientserviceip", Clientserviceip.findClientserviceipsByClientservice(Clientservice.findClientservice(id)).getResultList());
        uiModel.addAttribute("clientservicestatus", Clientservicestatus.findClientservicestatusesByClientservice(Clientservice.findClientservice(id)).getSingleResult());
        uiModel.addAttribute("sips",Sip.findSipsByClientservice(Clientservice.findClientservice(id)).getResultList());
        uiModel.addAttribute("streets",Clientservicestreet.findStreetByClientservice(Clientservice.findClientservice(id)));
   		uiModel.addAttribute("itemId", id);
        return "clientservices/show";
    }
    
    @PreAuthorize("hasAnyRole('ROLE_TECH','ROLE_SMANAGER','ROLE_ROOT')")
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Clientservice.findClientservice(id));
        return "clientservices/update";
    }

    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(@RequestParam(value = "id", required = true) Long id, Model uiModel) {
        populateEditForm(uiModel, new Clientservice());
        uiModel.addAttribute("clients", Client.findClient(id));
        return "clientservices/create";
    }

   
    @RequestMapping(value = "/update", method = RequestMethod.POST, produces = "text/html")
    public String update(@Valid Clientservice clientservice, BindingResult bindingResult, Model uiModel, @RequestParam("schemapodk") MultipartFile multipartFile, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, clientservice);
            return "clientsservice/update";
        }
        clientservice.setContentType(multipartFile.getContentType());
        String curcredit = clientservice.getCurrentcredit(clientservice);
        String newcredit = clientservice.getPhonecreditblock();
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        String manager = Manager.findManagersByLoginEquals(username).getSingleResult().getManname().toString();
        if (httpServletRequest.isUserInRole("ROLE_SMANAGER") || httpServletRequest.isUserInRole("ROLE_ROOT") ){
        	if (!curcredit.equals(newcredit)) {
            	clientservice.setCreditdate(new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new Date()).toString());
            	clientservice.setWhogavecredit(manager);
            }
        }
        else {
        	if (!curcredit.equals(newcredit)) {
        		clientservice.setPhonecreditblock(curcredit);
        	}
        }
        if (clientservice.getIsmailsent() == true ) {
        	if (clientservice.getDataotkluchenia() != null){
        		String[] mailto = {"lesya@it-tele.net","Valentina@it-tele.net","vovchenko@it-tele.net","etrunk@it-tele.net","a_konsul@it-tele.net"};
//        		String[] mailto = {"miha@it-tele.net"};
        		sendMessage("labs@it-tele.net", clientservice.getClient().getSupplier().getName() + "|||| Послуга офіційно відключена абоненту "+clientservice.getClient().getClientname(),  mailto, clientservice.getClient().getSupplier().getName() + "|||| Послуга офіційно відключена абоненту "+clientservice.getClient().getClientname() + " . Перегляд : http://billing.it-tele.net:8080/telebil/clientservices/" + clientservice.getId().toString());
        		clientservice.setIsmailsent(false);
        	} else {
       		    String[] mailto = {"lesya@it-tele.net","Valentina@it-tele.net","vovchenko@it-tele.net","etrunk@it-tele.net","a_konsul@it-tele.net"};
//        		String[] mailto = {"miha@it-tele.net"};
        		sendMessage("labs@it-tele.net", clientservice.getClient().getSupplier().getName() + "|||| Послуга офіційно підключена абоненту "+clientservice.getClient().getClientname(),  mailto, clientservice.getClient().getSupplier().getName() + "|||| Послуга офіційно підключена абоненту "+clientservice.getClient().getClientname() + " . Перегляд : http://billing.it-tele.net:8080/telebil/clientservices/" + clientservice.getId().toString());
        		clientservice.setIsmailsent(false);
        	}
            }
        uiModel.asMap().clear();
        clientservice.merge(); 
        return "redirect:/clientservices/" + encodeUrlPathSegment(clientservice.getId().toString(), httpServletRequest);
    }

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Clientservice clientservice, BindingResult bindingResult, Model uiModel, @RequestParam("schemapodk") MultipartFile multipartFile, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, clientservice);
            return "clientservices/create";
        }
        uiModel.asMap().clear();
        clientservice.setContentType(multipartFile.getContentType());
        Boolean status=clientservice.getStatususlugi();
        Clientservicestatus clientservicestatus = new Clientservicestatus();
        if (status != true) {
        	clientservicestatus.setStatus("услуга неактивна");
        	clientservicestatus.setClientservice(clientservice);
        	clientservicestatus.persist();
        	clientservice.persist();
        	return "redirect:/clients/" + encodeUrlPathSegment(clientservice.getClient().getId().toString(), httpServletRequest);
        }
        clientservicestatus.setStatus("услуга активна");
    	clientservicestatus.setClientservice(clientservice);
        clientservicestatus.persist();
        clientservice.persist();
        String[] mailto = {"lesya@it-tele.net","Valentina@it-tele.net","vovchenko@it-tele.net","etrunk@it-tele.net"};
        sendMessage("labs@it-tele.net", "подключена услуга " + clientservice.getService().getName()+" абоненту "+clientservice.getClient().getClientname(),  mailto, "Была подключена услуга: " + clientservice.getService().getName()+" абоненту "+clientservice.getClient().getClientname() + " . Просмотр : http://billing.it-tele.net:8080/telebil/clientservices/" + clientservice.getId().toString());
         return "redirect:/clients/" + encodeUrlPathSegment(clientservice.getClient().getId().toString(), httpServletRequest);
    }

    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws ServletException {
        binder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());
    }

    @RequestMapping(value = "/{id}/image", method = RequestMethod.GET)
    public String showImage(@PathVariable("id") Long id, HttpServletResponse response, Model model) {
        Clientservice clientservice = Clientservice.findClientservice(id);
        if (clientservice != null) {
            byte[] image = clientservice.getSchemapodk();
            if (image != null) {
                try {
                    response.setContentType(clientservice.getContentType());
                    OutputStream out = response.getOutputStream();
                    IOUtils.copy(new ByteArrayInputStream(image), out);
                    out.flush();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return null;
    }

    @PreAuthorize("hasAnyRole('ROLE_SMANAGER','ROLE_ROOT')")
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel, HttpServletRequest httpServletRequest) {
        Clientservice clientservice = Clientservice.findClientservice(id);
        Clientserviceip.deleteclsip(clientservice);
        Payment.deletepmnt(clientservice);
        Csbalancedate.deletecsb(clientservice);
        Tempblock.deleteblocks(clientservice);
        Clientservicestatus.deleteclss(clientservice);
        Clientservicephone.deleteclsp(clientservice);
        Clientservicerecount.deleteclsr(clientservice);
        clientservice.remove();
        uiModel.asMap().clear();
        return "redirect:/clients/" + encodeUrlPathSegment(clientservice.getClient().getId().toString(), httpServletRequest);
    }
   
    @Autowired
    private MailSender mailTemplate;

    public void sendMessage(String mailFrom, String subject,  String[]mailto,  String message) {
        org.springframework.mail.SimpleMailMessage mailMessage = new org.springframework.mail.SimpleMailMessage();
        mailMessage.setFrom(mailFrom);
        mailMessage.setSubject(subject);
        mailMessage.setTo(mailto);
        mailMessage.setText(message);
        mailTemplate.send(mailMessage);
    }
    
    void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("clientservice_datapodkluchenia_date_format", DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("clientservice_dataotkluchenia_date_format", DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
    }
    
}
