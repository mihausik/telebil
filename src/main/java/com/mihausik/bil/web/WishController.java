package com.mihausik.bil.web;
import java.util.Arrays;
import com.mihausik.bil.Manager;
import com.mihausik.bil.Priority;
import com.mihausik.bil.Result;
import com.mihausik.bil.Wish;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/wishes")
@Controller
@RooWebScaffold(path = "wishes", formBackingObject = Wish.class)
public class WishController {

    void populateEditForm(Model uiModel, Wish wish) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        uiModel.addAttribute("managers", Manager.findManagersByLoginEquals(username).getResultList());
        uiModel.addAttribute("wish", wish);
        uiModel.addAttribute("prioritys", Arrays.asList(Priority.values()));
        uiModel.addAttribute("results", Arrays.asList(Result.values()));
    }
}
