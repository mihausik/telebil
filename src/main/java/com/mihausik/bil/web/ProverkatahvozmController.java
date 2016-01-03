package com.mihausik.bil.web;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

import com.mihausik.bil.Citystreets;
import com.mihausik.bil.Commentszayavok;
import com.mihausik.bil.Manager;
import com.mihausik.bil.ProvTVstatus;
import com.mihausik.bil.Proverkatahvozm;
import com.mihausik.bil.TVexist;

@RequestMapping("/proverkatahvozms")
@Controller
@RooWebScaffold(path = "proverkatahvozms", formBackingObject = Proverkatahvozm.class)
@RooWebFinder
public class ProverkatahvozmController {

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

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Proverkatahvozm proverkatahvozm, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, proverkatahvozm);
            return "proverkatahvozms/create";
        }
        String housenum =   proverkatahvozm.getAddrpodcluchenia().replaceAll("A-Za-z0-9/", "");
        proverkatahvozm.setAddrpodcluchenia(housenum);
        Date datarazm = proverkatahvozm.getDatarazmescheniya();
        if (datarazm==null){
        	populateEditForm(uiModel, proverkatahvozm);
        	uiModel.addAttribute("exists","Необходимо ввести дату размещения заявки!");
        	return "proverkatahvozms/create";
        }
        Date weekbefore = new Date(datarazm.getTime() - 6 * 24 * 3600 * 1000);
        Long provtvindb = Proverkatahvozm.findPTVByFullAddress(proverkatahvozm.getCitystreets(), housenum ,datarazm,weekbefore);
        if (provtvindb ==1) {
        	populateEditForm(uiModel, proverkatahvozm);
        	uiModel.addAttribute("exists","Уже выполнялась проверка по данному адресу");
        	return "proverkatahvozms/create";
        }
        uiModel.asMap().clear();
        proverkatahvozm.persist();
        sendMessage("labs@it-tele.net", "проверка тех возможности " + proverkatahvozm.getCitystreets().getStreet() +" "+proverkatahvozm.getAddrpodcluchenia(), "sales@it-tele.net", "miha@it-tele.net", "Была создана заявка на проверку технической возможности подключения компании:" + proverkatahvozm.getPotencialclient() + " по адресу: " + proverkatahvozm.getCitystreets().getStreet() +" "+proverkatahvozm.getAddrpodcluchenia() + ". Менеджер проекта:" + proverkatahvozm.getManager().getManname() + " Cрок включения: " + proverkatahvozm.getSrokvkluchenia() + " . Просмотр : http://billing.it-tele.net:8080/telebil/proverkatahvozms/" + proverkatahvozm.getId().toString());
        //sendMessage("labs@it-tele.net", "проверка тех возможности " +proverkatahvozm.getCitystreets().getStreet() +" "+proverkatahvozm.getAddrpodcluchenia(), "miha@it-tele.net", "miha@it-tele.net", "Была создана заявка на проверку технической возможности подключения компании:" + proverkatahvozm.getPotencialclient() + " по адресу: " + proverkatahvozm.getCitystreets().getStreet() +" "+proverkatahvozm.getAddrpodcluchenia() + ". Менеджер проекта:" + proverkatahvozm.getManager().getManname() + " Cрок включения: " + proverkatahvozm.getSrokvkluchenia() + " . Просмотр : http://billing.it-tele.net:8080/telebil/proverkatahvozms/" + proverkatahvozm.getId().toString());
        return "redirect:/proverkatahvozms/" + encodeUrlPathSegment(proverkatahvozm.getId().toString(), httpServletRequest);
    }

    void populateEditForm(Model uiModel, Proverkatahvozm proverkatahvozm) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        uiModel.addAttribute("managers", Manager.findManagersByLoginEquals(username).getResultList());
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("proverkatahvozm", proverkatahvozm);
        uiModel.addAttribute("tvexists", Arrays.asList(TVexist.values()));
        uiModel.addAttribute("provtvstatuses", Arrays.asList(ProvTVstatus.values()));
        uiModel.addAttribute("citystreetses", Citystreets.findAllCitystreetses());
        // uiModel.addAttribute("statuszayavkis", Arrays.asList(Statuszayavki.values()));
        addDateTimeFormatPatterns(uiModel);
    }

    void populateEditFormu(Model uiModel, Proverkatahvozm proverkatahvozm) {
        uiModel.addAttribute("managers", Manager.findAllManagers());
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("proverkatahvozm", proverkatahvozm);
        uiModel.addAttribute("tvexists", Arrays.asList(TVexist.values()));
        uiModel.addAttribute("provtvstatuses", Arrays.asList(ProvTVstatus.values()));
        uiModel.addAttribute("citystreetses", Citystreets.findAllCitystreetses());
        //   uiModel.addAttribute("statuszayavkis", Arrays.asList(Statuszayavki.values()));
        addDateTimeFormatPatterns(uiModel);
    }

    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid Proverkatahvozm proverkatahvozm, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, proverkatahvozm);
            return "proverkatahvozms/update";
        }
        uiModel.asMap().clear();
        proverkatahvozm.merge();
        //   sendMessage("labs@it-tele.net", "проверка тех возможности "+proverkatahvozm.getAddrpodcluchenia(), "noc@it-tele.net", "mnt@it-tele.net", "sales@it-tele.net", "Заявка на проверку технической возможности подключения компании:" + proverkatahvozm.getPotencialclient() + " по адресу: " + proverkatahvozm.getAddrpodcluchenia() + " была обновлена. Просмотреть комментарии по ссылке http://billing.it-tele.net:8080/telebil/proverkatahvozms/" + proverkatahvozm.getId() + "?form");
        return "redirect:/proverkatahvozms/" + encodeUrlPathSegment(proverkatahvozm.getId().toString(), httpServletRequest);
    }

    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditFormu(uiModel, Proverkatahvozm.findProverkatahvozm(id));
        return "proverkatahvozms/update";
    }

    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new Proverkatahvozm());
        return "proverkatahvozms/create";
    }

    @RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("proverkatahvozm", Proverkatahvozm.findProverkatahvozm(id));
        uiModel.addAttribute("itemId", id);
        uiModel.addAttribute("comments", Commentszayavok.findCommentszayavoksByProverkatahvozm(Proverkatahvozm.findProverkatahvozm(id)).getResultList());
        return "proverkatahvozms/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("proverkatahvozms", Proverkatahvozm.findProverkatahvozmEntries(firstResult, sizeNo));
            float nrOfPages = (float) Proverkatahvozm.countProverkatahvozms() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("proverkatahvozms", Proverkatahvozm.findAllProverkatahvozms());
        }
        addDateTimeFormatPatterns(uiModel);
        return "proverkatahvozms/list";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Proverkatahvozm proverkatahvozm = Proverkatahvozm.findProverkatahvozm(id);
        proverkatahvozm.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/proverkatahvozms";
    }

    void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("proverkatahvozm_datarazmescheniya_date_format", "dd-MM-yyyy");
    }

    String encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
    @RequestMapping(params = { "find=ByAddrpodclucheniaLike", "form" }, method = RequestMethod.GET)
    public String findProverkatahvozmsByAddrpodclucheniaLikeForm(Model uiModel) {
    	uiModel.addAttribute("citystreetses", Citystreets.findAllCitystreetses());
        return "proverkatahvozms/findProverkatahvozmsByAddrpodclucheniaLike";
    }

    @RequestMapping(params = "find=ByAddrpodclucheniaLike", method = RequestMethod.GET)
    public String findProverkatahvozmsByAddrpodclucheniaLike(Citystreets citystreets, Model uiModel) {
        uiModel.addAttribute("proverkatahvozms", Proverkatahvozm.findProverkatahvozmsByStreetandAddrpod(citystreets).getResultList());
        return "proverkatahvozms/list";
    }

    @RequestMapping(params = { "find=ByManager", "form" }, method = RequestMethod.GET)
    public String findProverkatahvozmsByManagerForm(Model uiModel) {
        uiModel.addAttribute("managers", Manager.findAllManagers());
        return "proverkatahvozms/findProverkatahvozmsByManager";
    }

    @RequestMapping(params = "find=ByManager", method = RequestMethod.GET)
    public String findProverkatahvozmsByManager(@RequestParam("manager") Manager manager, Model uiModel) {
        uiModel.addAttribute("proverkatahvozms", Proverkatahvozm.findProverkatahvozmsByManager(manager).getResultList());
        return "proverkatahvozms/list";
    }

    @RequestMapping(params = { "find=ByTvexistence", "form" }, method = RequestMethod.GET)
    public String findProverkatahvozmsByTvexistenceForm(Model uiModel) {
        uiModel.addAttribute("tvexists", java.util.Arrays.asList(TVexist.class.getEnumConstants()));
        return "proverkatahvozms/findProverkatahvozmsByTvexistence";
    }

    @RequestMapping(params = "find=ByTvexistence", method = RequestMethod.GET)
    public String findProverkatahvozmsByTvexistence(@RequestParam("tvexistence") TVexist tvexistence, Model uiModel) {
        uiModel.addAttribute("proverkatahvozms", Proverkatahvozm.findProverkatahvozmsByTvexistence(tvexistence).getResultList());
        return "proverkatahvozms/list";
    }

}
