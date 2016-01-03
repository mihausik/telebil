package com.mihausik.bil.web;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import com.mihausik.bil.Client;
import com.mihausik.bil.Clientnumdog;
import com.mihausik.bil.Clientservice;
import com.mihausik.bil.Commentszayavok;
import com.mihausik.bil.Manager;
import com.mihausik.bil.Proverkatahvozm;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/commentszayavoks")
@Controller
@RooWebScaffold(path = "commentszayavoks", formBackingObject = Commentszayavok.class, update = false, delete = false)
public class CommentszayavokController {

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Commentszayavok commentszayavok, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, commentszayavok);
            return "commentszayavoks/create";
        }
        uiModel.asMap().clear();
        Calendar c = Calendar.getInstance();
        Date datacom = c.getTime();
        commentszayavok.setDatacommenta(datacom);
        commentszayavok.persist();
        //  return "redirect:/commentszayavoks/" + encodeUrlPathSegment(commentszayavok.getId().toString(), httpServletRequest);
        sendMessage("labs@it-tele.net", "проверка тех возможности " + commentszayavok.getProverkatahvozm().getCitystreets().getStreet() +" "+ commentszayavok.getProverkatahvozm().getAddrpodcluchenia(), "miha@it-tele.net", "sales@it-tele.net", commentszayavok.getManager().getManname() + " : " + commentszayavok.getComment() + "." + "\n Просмотреть комментарии по ссылке http://billing.it-tele.net:8080/telebil/proverkatahvozms/" + commentszayavok.getProverkatahvozm().getId().toString());
        return "redirect:/proverkatahvozms/" + encodeUrlPathSegment(commentszayavok.getProverkatahvozm().getId().toString(), httpServletRequest);
    }

    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid Commentszayavok commentszayavok, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, commentszayavok);
            return "commentszayavoks/update";
        }
        uiModel.asMap().clear();
        commentszayavok.merge();
        return "redirect:/commentszayavoks/" + encodeUrlPathSegment(commentszayavok.getId().toString(), httpServletRequest);
    }

    void populateEditForm(Model uiModel, Commentszayavok commentszayavok) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        uiModel.addAttribute("commentszayavok", commentszayavok);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("managers", Manager.findManagersByLoginEquals(username).getResultList());
        uiModel.addAttribute("proverkatahvozms", Proverkatahvozm.findAllProverkatahvozms());
    }

    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(@RequestParam(value = "id", required = true) Long id, Model uiModel) {
        populateEditForm(uiModel, new Commentszayavok());
        uiModel.addAttribute("proverkatahvozms", Proverkatahvozm.findProverkatahvozm(id));
        return "commentszayavoks/create";
    }

    @Autowired
    private MailSender mailTemplate;

    public void sendMessage(String mailFrom, String subject, String mailTo, String mailCC,     /* String mail2CC,*/
    String message) {
        org.springframework.mail.SimpleMailMessage mailMessage = new org.springframework.mail.SimpleMailMessage();
        mailMessage.setFrom(mailFrom);
        mailMessage.setSubject(subject);
        mailMessage.setTo(mailTo);
        mailMessage.setCc(mailCC);
        /* mailMessage.setCc(mail2CC);*/
        mailMessage.setText(message);
        mailTemplate.send(mailMessage);
    }
    
    void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("commentszayavok_datacommenta_date_format", "dd-MM-yyyy");
    }
    

}
