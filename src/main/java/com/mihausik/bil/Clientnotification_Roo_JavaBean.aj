// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mihausik.bil;

import com.mihausik.bil.Client;
import com.mihausik.bil.Clientnotification;
import com.mihausik.bil.Clientservice;
import com.mihausik.bil.Notiftype;

privileged aspect Clientnotification_Roo_JavaBean {
    
    public Notiftype Clientnotification.getNotiftype() {
        return this.notiftype;
    }
    
    public void Clientnotification.setNotiftype(Notiftype notiftype) {
        this.notiftype = notiftype;
    }
    
    public String Clientnotification.getContact() {
        return this.contact;
    }
    
    public void Clientnotification.setContact(String contact) {
        this.contact = contact;
    }
    
    public String Clientnotification.getNotificationsum() {
        return this.notificationsum;
    }
    
    public void Clientnotification.setNotificationsum(String notificationsum) {
        this.notificationsum = notificationsum;
    }
    
    public Client Clientnotification.getClient() {
        return this.client;
    }
    
    public void Clientnotification.setClient(Client client) {
        this.client = client;
    }
    
    public Clientservice Clientnotification.getClientservice() {
        return this.clientservice;
    }
    
    public void Clientnotification.setClientservice(Clientservice clientservice) {
        this.clientservice = clientservice;
    }
    
}
