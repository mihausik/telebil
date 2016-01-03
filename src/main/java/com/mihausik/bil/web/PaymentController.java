package com.mihausik.bil.web;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mihausik.bil.Client;
import com.mihausik.bil.Clientservice;
import com.mihausik.bil.Payment;
import com.mihausik.bil.Service;

@RequestMapping("/payments")
@Controller
@RooWebScaffold(path = "payments", formBackingObject = Payment.class)
@RooWebFinder
public class PaymentController {

	
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Payment payment, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        Long cserviceid = payment.getClientservice().getId();
        Float balance = payment.getSumma();
        Float currentbalance = Clientservice.findClientservice(cserviceid).getBalance();
        Clientservice.findClientservice(cserviceid).setBalance(currentbalance + balance);
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, payment);
            return "payments/create";
        }
        uiModel.asMap().clear();
        payment.persist();
        return "redirect:/clients/" + encodeUrlPathSegment(payment.getClient().getId().toString(), httpServletRequest);
    }

   
    
    @PreAuthorize("hasAnyRole('ROLE_BUH','ROLE_ROOT')")
    @RequestMapping(params = "fromc", produces = "text/html")
    public String createForm(@RequestParam(value = "id", required = true) Long id, Model uiModel) {
        populateEditForm(uiModel, new Payment());
        Client client  = Clientservice.findClientservice(id).getClient();
        uiModel.addAttribute("clients", client);
        uiModel.addAttribute("clientservices", Clientservice.findClientservice(id));
        return "payments/create";
    }

   
    private void populateEditForm(Model uiModel, Payment payment) {
        uiModel.addAttribute("payment", payment);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("clients", Client.findAllClients());
        uiModel.addAttribute("clientservices", Service.findAllServices());
    }

    @Autowired
    private MailSender mailTemplate;

    public void sendMessage(String mailFrom, String subject, String mailTo, String message) {
        org.springframework.mail.SimpleMailMessage mailMessage = new org.springframework.mail.SimpleMailMessage();
        mailMessage.setFrom(mailFrom);
        mailMessage.setSubject(subject);
        mailMessage.setTo(mailTo);
        mailMessage.setText(message);
        mailTemplate.send(mailMessage);
    }
    
    @RequestMapping(params = { "find=ByClientservice", "form" }, method = RequestMethod.GET)
    public String findPaymentsByClientserviceForm(Model uiModel) {
        uiModel.addAttribute("clientservices", Clientservice.findAllClientservices());
        return "payments/findPaymentsByClientservice";
    }
    
    @RequestMapping(params = "find=ByClientservice", method = RequestMethod.GET)
    public String findPaymentsByClientservice(@RequestParam("clientservice") Clientservice clientservice, Model uiModel) {
        uiModel.addAttribute("payments", Payment.findPaymentsByClientservice(clientservice).getResultList());
        uiModel.addAttribute("paymentsclient", Payment.getClientbyclientservice(clientservice));
        addDateTimeFormatPatterns(uiModel);
        return "payments/list";
    }
    
    void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("payment_dataplateja_date_format", "dd-MM-yyyy");
    }
}
