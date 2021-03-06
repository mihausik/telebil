// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mihausik.bil.web;

import com.mihausik.bil.Wish;
import com.mihausik.bil.web.WishController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect WishController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String WishController.create(@Valid Wish wish, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, wish);
            return "wishes/create";
        }
        uiModel.asMap().clear();
        wish.persist();
        return "redirect:/wishes/" + encodeUrlPathSegment(wish.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String WishController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Wish());
        return "wishes/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String WishController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("wish", Wish.findWish(id));
        uiModel.addAttribute("itemId", id);
        return "wishes/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String WishController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("wishes", Wish.findWishEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Wish.countWishes() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("wishes", Wish.findAllWishes(sortFieldName, sortOrder));
        }
        return "wishes/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String WishController.update(@Valid Wish wish, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, wish);
            return "wishes/update";
        }
        uiModel.asMap().clear();
        wish.merge();
        return "redirect:/wishes/" + encodeUrlPathSegment(wish.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String WishController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Wish.findWish(id));
        return "wishes/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String WishController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Wish wish = Wish.findWish(id);
        wish.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/wishes";
    }
    
    String WishController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
