// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mihausik.bil;

import com.mihausik.bil.Callplan;
import com.mihausik.bil.Rate;

privileged aspect Rate_Roo_JavaBean {
    
    public Double Rate.getBuy() {
        return this.buy;
    }
    
    public void Rate.setBuy(Double buy) {
        this.buy = buy;
    }
    
    public String Rate.getName() {
        return this.name;
    }
    
    public void Rate.setName(String name) {
        this.name = name;
    }
    
    public String Rate.getPrefix() {
        return this.prefix;
    }
    
    public void Rate.setPrefix(String prefix) {
        this.prefix = prefix;
    }
    
    public Double Rate.getSell() {
        return this.sell;
    }
    
    public void Rate.setSell(Double sell) {
        this.sell = sell;
    }
    
    public String Rate.getTrunk() {
        return this.trunk;
    }
    
    public void Rate.setTrunk(String trunk) {
        this.trunk = trunk;
    }
    
    public Callplan Rate.getCallplan() {
        return this.callplan;
    }
    
    public void Rate.setCallplan(Callplan callplan) {
        this.callplan = callplan;
    }
    
    public Integer Rate.getCutdigits() {
        return this.cutdigits;
    }
    
    public void Rate.setCutdigits(Integer cutdigits) {
        this.cutdigits = cutdigits;
    }
    
    public Integer Rate.getMinduration() {
        return this.minduration;
    }
    
    public void Rate.setMinduration(Integer minduration) {
        this.minduration = minduration;
    }
    
}
