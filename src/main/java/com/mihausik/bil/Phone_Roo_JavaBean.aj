// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mihausik.bil;

import com.mihausik.bil.Phone;

privileged aspect Phone_Roo_JavaBean {
    
    public Integer Phone.getPhonenumber() {
        return this.phonenumber;
    }
    
    public void Phone.setPhonenumber(Integer phonenumber) {
        this.phonenumber = phonenumber;
    }
    
    public Boolean Phone.getInuse() {
        return this.inuse;
    }
    
    public void Phone.setInuse(Boolean inuse) {
        this.inuse = inuse;
    }
    
}
