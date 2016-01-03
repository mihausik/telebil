package com.mihausik.bil.web;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.mihausik.bil.Commentsocheredi;
import com.mihausik.bil.Manager;
import com.mihausik.bil.Ocherednapodkluchenie;

@RequestMapping("/commentsocheredis")
@Controller
@RooWebScaffold(path = "commentsocheredis", formBackingObject = Commentsocheredi.class)
public class CommentsocherediController {

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Commentsocheredi commentsocheredi, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, commentsocheredi);
            return "commentsocheredis/create";
        }
        uiModel.asMap().clear();
        commentsocheredi.persist();
        //   return "redirect:/commentsocheredis/" + encodeUrlPathSegment(commentsocheredi.getId().toString(), httpServletRequest);
        return "redirect:/ocherednapodkluchenies/" + encodeUrlPathSegment(commentsocheredi.getOcherednapodkluchenie().getId().toString(), httpServletRequest);
    }

    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(@RequestParam(value = "id", required = true) Long id, Model uiModel) {
        populateEditForm(uiModel, new Commentsocheredi());
        uiModel.addAttribute("ocherednapodkluchenies", Ocherednapodkluchenie.findOcherednapodkluchenie(id));
        return "commentsocheredis/create";
    }

    void populateEditForm(Model uiModel, Commentsocheredi commentsocheredi) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        uiModel.addAttribute("commentsocheredi", commentsocheredi);
        uiModel.addAttribute("managers", Manager.findManagersByLoginEquals(username).getResultList());
        uiModel.addAttribute("ocherednapodkluchenies", Ocherednapodkluchenie.findAllOcherednapodkluchenies());
    }
}
