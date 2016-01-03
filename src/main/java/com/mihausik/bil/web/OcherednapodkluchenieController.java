package com.mihausik.bil.web;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import com.mihausik.bil.Client;
import com.mihausik.bil.Clientservice;
import com.mihausik.bil.Commentsocheredi;
import com.mihausik.bil.Manager;
import com.mihausik.bil.Ocherednapodkluchenie;





import com.mihausik.bil.Supplier;

import org.joda.time.format.DateTimeFormat;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.mail.MailSender;

@RequestMapping("/ocherednapodkluchenies")
@Controller
@RooWebScaffold(path = "ocherednapodkluchenies", formBackingObject = Ocherednapodkluchenie.class)
public class OcherednapodkluchenieController {

    @Autowired
    private MailSender mailTemplate;

    public void sendMessage(String mailFrom, String subject, String mailTo, String mailCC,     String mail2CC,
    String message) {
        org.springframework.mail.SimpleMailMessage mailMessage = new org.springframework.mail.SimpleMailMessage();
        mailMessage.setFrom(mailFrom);
        mailMessage.setSubject(subject);
        mailMessage.setTo(mailTo);
        mailMessage.setCc(mailCC);
        mailMessage.setCc(mail2CC);
        mailMessage.setText(message);
        mailTemplate.send(mailMessage);
    }
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Ocherednapodkluchenie ocherednapodkluchenie, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, ocherednapodkluchenie);
            return "ocherednapodkluchenies/create";
        }
        Calendar c = Calendar.getInstance();
        Date curtime = c.getTime();
        ocherednapodkluchenie.setDatapodkluchenia(curtime);
        uiModel.asMap().clear();
        ocherednapodkluchenie.persist();
      sendMessage("labs@it-tele.net", ocherednapodkluchenie.getClientservice().getClient().getSupplier().getName() +" ||| Заявка на подключение абонента "+ocherednapodkluchenie.getClientservice().getClient().getClientname()+" по адресу " + ocherednapodkluchenie.getClientservice().getAddresspreduslugi() , "noc@it-tele.net", "mnt@it-tele.net","sales@it-tele.net" , "Просмотр : http://billing.it-tele.net:8080/telebil/ocherednapodkluchenies/" + ocherednapodkluchenie.getId().toString());
        return "redirect:/ocherednapodkluchenies/" + encodeUrlPathSegment(ocherednapodkluchenie.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(@RequestParam(value = "id", required = true) Long id,Model uiModel) {
        populateEditForm(uiModel, new Ocherednapodkluchenie());
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        uiModel.addAttribute("managers", Manager.findManagersByLoginEquals(username).getResultList());
        uiModel.addAttribute("clients", Client.findClient(id));
        uiModel.addAttribute("suppliers", Supplier.findAllSuppliers());
        uiModel.addAttribute("clientservices", Clientservice.findClientservicesByClient(Client.findClient(id)).getResultList());
        return "ocherednapodkluchenies/create";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid Ocherednapodkluchenie ocherednapodkluchenie, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, ocherednapodkluchenie);
            return "ocherednapodkluchenies/update";
        }
        uiModel.asMap().clear();
        ocherednapodkluchenie.merge();
        return "redirect:/ocherednapodkluchenies/" + encodeUrlPathSegment(ocherednapodkluchenie.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Ocherednapodkluchenie.findOcherednapodkluchenie(id));
        //String username = SecurityContextHolder.getContext().getAuthentication().getName();
        uiModel.addAttribute("suppliers", Supplier.findAllSuppliers());
        uiModel.addAttribute("clients", Ocherednapodkluchenie.findOcherednapodkluchenie(id).getClient());
        uiModel.addAttribute("clientservices", Clientservice.findClientservicesByClient(Ocherednapodkluchenie.findOcherednapodkluchenie(id).getClient()).getResultList());
      //  uiModel.addAttribute("managers", Manager.findManagersByLoginEquals(username).getResultList());
        return "ocherednapodkluchenies/update";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("ocherednapodkluchenie", Ocherednapodkluchenie.findOcherednapodkluchenie(id));
        uiModel.addAttribute("comments", Commentsocheredi.findCommentsocheredisByOcherednapodkluchenie(Ocherednapodkluchenie.findOcherednapodkluchenie(id)).getResultList());
        uiModel.addAttribute("itemId", id);
        return "ocherednapodkluchenies/show";
    }
    
    @RequestMapping(value = "/arhiv", produces = "text/html")
    public String arhivlist(Model uiModel) {
        uiModel.addAttribute("ocherednapodkluchenies", Ocherednapodkluchenie.findAllArhivOcherednapodkluchenies());
        addDateTimeFormatPatterns(uiModel);
        return "ocherednapodkluchenies/list";
    }
    
    @RequestMapping(produces = "text/html")
    public String list(Model uiModel) {
    		uiModel.addAttribute("ocherednapodkluchenies", Ocherednapodkluchenie.findAllOcherednapodkluchenies());
    		addDateTimeFormatPatterns(uiModel);
    return "ocherednapodkluchenies/list";
    }
    

    void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("ocherednapodkluchenie_datapodkluchenia_date_format", "dd-MM-yyyy");
        uiModel.addAttribute("ocherednapodkluchenie_deadlinedate_date_format", "dd-MM-yyyy");
    }
}
