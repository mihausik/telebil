// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mihausik.bil;

import com.mihausik.bil.Citystreets;
import com.mihausik.bil.Clientservice;
import com.mihausik.bil.Clientservicestreet;

privileged aspect Clientservicestreet_Roo_JavaBean {
    
    public Citystreets Clientservicestreet.getCitystreets() {
        return this.citystreets;
    }
    
    public void Clientservicestreet.setCitystreets(Citystreets citystreets) {
        this.citystreets = citystreets;
    }
    
    public Clientservice Clientservicestreet.getClientservice() {
        return this.clientservice;
    }
    
    public void Clientservicestreet.setClientservice(Clientservice clientservice) {
        this.clientservice = clientservice;
    }
    
    public String Clientservicestreet.getHousenum() {
        return this.housenum;
    }
    
    public void Clientservicestreet.setHousenum(String housenum) {
        this.housenum = housenum;
    }
    
    public String Clientservicestreet.getCity() {
        return this.city;
    }
    
    public void Clientservicestreet.setCity(String city) {
        this.city = city;
    }
    
    public String Clientservicestreet.getAppartment() {
        return this.appartment;
    }
    
    public void Clientservicestreet.setAppartment(String appartment) {
        this.appartment = appartment;
    }
    
}
