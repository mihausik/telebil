// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mihausik.bil;

import com.mihausik.bil.Clientservice;
import com.mihausik.bil.Clientservicerecount;
import java.util.Date;

privileged aspect Clientservicerecount_Roo_JavaBean {
    
    public Date Clientservicerecount.getDatastartrecount() {
        return this.datastartrecount;
    }
    
    public void Clientservicerecount.setDatastartrecount(Date datastartrecount) {
        this.datastartrecount = datastartrecount;
    }
    
    public Date Clientservicerecount.getDatastoprecount() {
        return this.datastoprecount;
    }
    
    public void Clientservicerecount.setDatastoprecount(Date datastoprecount) {
        this.datastoprecount = datastoprecount;
    }
    
    public Clientservice Clientservicerecount.getClientservice() {
        return this.clientservice;
    }
    
    public void Clientservicerecount.setClientservice(Clientservice clientservice) {
        this.clientservice = clientservice;
    }
    
    public String Clientservicerecount.getStatus() {
        return this.status;
    }
    
    public void Clientservicerecount.setStatus(String status) {
        this.status = status;
    }
    
    public Long Clientservicerecount.getNumdays() {
        return this.numdays;
    }
    
    public void Clientservicerecount.setNumdays(Long numdays) {
        this.numdays = numdays;
    }
    
}
