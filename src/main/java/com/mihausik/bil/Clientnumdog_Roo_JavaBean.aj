// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mihausik.bil;

import com.mihausik.bil.Client;
import com.mihausik.bil.Clientnumdog;
import com.mihausik.bil.Clientservice;
import java.util.Date;

privileged aspect Clientnumdog_Roo_JavaBean {
    
    public String Clientnumdog.getNomerdogovora() {
        return this.nomerdogovora;
    }
    
    public void Clientnumdog.setNomerdogovora(String nomerdogovora) {
        this.nomerdogovora = nomerdogovora;
    }
    
    public Date Clientnumdog.getDatazaklucheniya() {
        return this.datazaklucheniya;
    }
    
    public void Clientnumdog.setDatazaklucheniya(Date datazaklucheniya) {
        this.datazaklucheniya = datazaklucheniya;
    }
    
    public Client Clientnumdog.getClient() {
        return this.client;
    }
    
    public void Clientnumdog.setClient(Client client) {
        this.client = client;
    }
    
    public Clientservice Clientnumdog.getClientservice() {
        return this.clientservice;
    }
    
    public void Clientnumdog.setClientservice(Clientservice clientservice) {
        this.clientservice = clientservice;
    }
    
}
