package com.mihausik.bil.web;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
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
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;
import com.mihausik.bil.Clientdata;
import com.mihausik.bil.Schet;

@RequestMapping("/schets")
@Controller
@RooWebScaffold(path = "schets", formBackingObject = Schet.class)
public class SchetController {

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid final Schet schet, BindingResult bindingResult, @RequestParam("schet") final CommonsMultipartFile content, Model uiModel, HttpServletRequest httpServletRequest) throws IOException {
        final File dest = new File("/var/www/html/scheta/" + content.getOriginalFilename());
        System.out.println(Clientdata.getfinemailByClient(schet.getClient()));
        // final File dest = new File("G:" + content.getOriginalFilename());
        try {
            content.transferTo(dest);
            schet.setFilesize(content.getSize());
            schet.setFilepath(dest.getAbsolutePath());
            schet.setContentType(content.getContentType());
            schet.setFilename(content.getOriginalFilename());
        } catch (Exception e) {
            // e.printStackTrace();
            populateEditForm(uiModel, schet);
            return "schets/create";
        }
        uiModel.asMap().clear();
        mailTemplate.send(new MimeMessagePreparator() {

            public void prepare(MimeMessage mimeMessage) throws MessagingException, AddressException {
                try {
                    MimeMessageHelper message = new MimeMessageHelper(mimeMessage, true, "UTF-8");
                    message.setFrom("finance@it-tele.net");
                    message.setTo(Clientdata.getfinemailByClient(schet.getClient()));
                    message.setSubject("счет за услуги");
                    message.setText("", true);
                    message.setReplyTo("finance@it-tele.net");
                    message.addAttachment(content.getOriginalFilename(), dest);
                } catch (AddressException adr) {
                    //adr.printStackTrace();
                }
            }
        });
        schet.persist();
        return "redirect:/schets/" + encodeUrlPathSegment(schet.getId().toString(), httpServletRequest);
    }

    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new Schet());
        return "schets/create";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST, produces = "text/html")
    public String update(@Valid Schet schet, BindingResult bindingResult, @RequestParam("schet") MultipartFile multipartFile, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, schet);
            return "schets/update";
        }
        uiModel.asMap().clear();
        schet.setContentType(multipartFile.getContentType());
        System.out.println(multipartFile.getContentType());
        schet.merge();
        return "redirect:/schets/" + encodeUrlPathSegment(schet.getId().toString(), httpServletRequest);
    }

    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Schet.findSchet(id));
        return "schets/update";
    }

    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws ServletException {
        binder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());
    }

    @RequestMapping(value = "/{id}/schet", method = RequestMethod.GET)
    public String showImage(@PathVariable("id") Long id, HttpServletResponse response, Model model) {
        Schet schet = Schet.findSchet(id);
        if (schet != null) {
            byte[] document = schet.getSchet();
            if (document != null) {
                try {
                    response.setContentType(schet.getContentType());
                    OutputStream out = response.getOutputStream();
                    IOUtils.copy(new ByteArrayInputStream(document), out);
                    out.flush();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return null;
    }

    @Autowired
    private JavaMailSender mailTemplate;

    public void sendMessage(String mailFrom, String subject, String mailTo, String message) {
        org.springframework.mail.SimpleMailMessage mailMessage = new org.springframework.mail.SimpleMailMessage();
        mailMessage.setFrom(mailFrom);
        mailMessage.setSubject(subject);
        mailMessage.setTo(mailTo);
        mailMessage.setText(message);
        mailTemplate.send(mailMessage);
    }
}
