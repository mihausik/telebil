// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mihausik.bil;

import com.mihausik.bil.Clientservice;
import com.mihausik.bil.Clientserviceip;
import com.mihausik.bil.IPtype;

privileged aspect Clientserviceip_Roo_JavaBean {
    
    public Clientservice Clientserviceip.getClientservice() {
        return this.clientservice;
    }
    
    public void Clientserviceip.setClientservice(Clientservice clientservice) {
        this.clientservice = clientservice;
    }
    
    public String Clientserviceip.getIp() {
        return this.ip;
    }
    
    public void Clientserviceip.setIp(String ip) {
        this.ip = ip;
    }
    
    public String Clientserviceip.getMask() {
        return this.mask;
    }
    
    public void Clientserviceip.setMask(String mask) {
        this.mask = mask;
    }
    
    public String Clientserviceip.getGateway() {
        return this.gateway;
    }
    
    public void Clientserviceip.setGateway(String gateway) {
        this.gateway = gateway;
    }
    
    public String Clientserviceip.getMacaddr() {
        return this.macaddr;
    }
    
    public void Clientserviceip.setMacaddr(String macaddr) {
        this.macaddr = macaddr;
    }
    
    public IPtype Clientserviceip.getIptype() {
        return this.iptype;
    }
    
    public void Clientserviceip.setIptype(IPtype iptype) {
        this.iptype = iptype;
    }
    
}
