// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mihausik.bil.web;

import com.mihausik.bil.Device;
import com.mihausik.bil.Devicetype;
import com.mihausik.bil.web.DeviceController;
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

privileged aspect DeviceController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String DeviceController.create(@Valid Device device, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, device);
            return "devices/create";
        }
        uiModel.asMap().clear();
        device.persist();
        return "redirect:/devices/" + encodeUrlPathSegment(device.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String DeviceController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Device());
        return "devices/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String DeviceController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("device", Device.findDevice(id));
        uiModel.addAttribute("itemId", id);
        return "devices/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String DeviceController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("devices", Device.findDeviceEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Device.countDevices() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("devices", Device.findAllDevices(sortFieldName, sortOrder));
        }
        return "devices/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String DeviceController.update(@Valid Device device, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, device);
            return "devices/update";
        }
        uiModel.asMap().clear();
        device.merge();
        return "redirect:/devices/" + encodeUrlPathSegment(device.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String DeviceController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Device.findDevice(id));
        return "devices/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String DeviceController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Device device = Device.findDevice(id);
        device.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/devices";
    }
    
    void DeviceController.populateEditForm(Model uiModel, Device device) {
        uiModel.addAttribute("device", device);
        uiModel.addAttribute("devicetypes", Devicetype.findAllDevicetypes());
    }
    
    String DeviceController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
