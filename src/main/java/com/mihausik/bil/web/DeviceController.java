package com.mihausik.bil.web;
import com.mihausik.bil.Device;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/devices")
@Controller
@RooWebScaffold(path = "devices", formBackingObject = Device.class)
public class DeviceController {
}
