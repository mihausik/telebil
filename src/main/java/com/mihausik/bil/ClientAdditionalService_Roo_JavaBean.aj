// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mihausik.bil;

import com.mihausik.bil.ClientAdditionalService;
import com.mihausik.bil.Clientservice;
import com.mihausik.bil.Service;
import java.math.BigDecimal;

privileged aspect ClientAdditionalService_Roo_JavaBean {
    
    public void ClientAdditionalService.setBalance(BigDecimal balance) {
        this.balance = balance;
    }
    
    public void ClientAdditionalService.setService(Service service) {
        this.service = service;
    }
    
    public Clientservice ClientAdditionalService.getClientservice() {
        return this.clientservice;
    }
    
    public void ClientAdditionalService.setClientservice(Clientservice clientservice) {
        this.clientservice = clientservice;
    }
    
}
