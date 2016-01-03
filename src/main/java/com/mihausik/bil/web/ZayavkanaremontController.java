package com.mihausik.bil.web;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import com.mihausik.bil.Clientservice;
import com.mihausik.bil.Commentsocheredi;
import com.mihausik.bil.Commentszayavokremont;
import com.mihausik.bil.Ocherednapodkluchenie;
import com.mihausik.bil.Zayavkanaremont;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/zayavkanaremonts")
@Controller
@RooWebScaffold(path = "zayavkanaremonts", formBackingObject = Zayavkanaremont.class)
public class ZayavkanaremontController {
	
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
    public String create(@Valid Zayavkanaremont zayavkanaremont, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, zayavkanaremont);
            return "zayavkanaremonts/create";
        }
        uiModel.asMap().clear();
        Date dataoformleniya = new Date();
        zayavkanaremont.setDataoformleniya(dataoformleniya);
        zayavkanaremont.persist();
        sendMessage("labs@it-tele.net", "заявка на ремонт абонента "+zayavkanaremont.getClientservice().getClient().getClientname()+" по адресу " + zayavkanaremont.getClientservice().getAddresspreduslugi() , "noc@it-tele.net", "mnt@it-tele.net","sales@it-tele.net" , "Просмотр : http://billing.it-tele.net:8080/telebil/zayavkanaremonts/" + zayavkanaremont.getId().toString());
        return "redirect:/zayavkanaremonts/" + encodeUrlPathSegment(zayavkanaremont.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(@RequestParam(value = "id", required = true) Long id, Model uiModel) {
        populateEditForm(uiModel, new Zayavkanaremont());
        uiModel.addAttribute("clientservices", Clientservice.findClientservice(id));
        return "zayavkanaremonts/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("zayavkanaremont", Zayavkanaremont.findZayavkanaremont(id));
        uiModel.addAttribute("itemId", id);
        uiModel.addAttribute("comments", Commentszayavokremont.findCommentszayavokremontsByZayavkanaremont(Zayavkanaremont.findZayavkanaremont(id)).getResultList());
        return "zayavkanaremonts/show";
    }
    
}
