// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mihausik.bil;

import com.mihausik.bil.Phone;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Phone_Roo_Jpa_Entity {
    
    declare @type: Phone: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Phone.id;
    
    @Version
    @Column(name = "version")
    private Integer Phone.version;
    
    public Long Phone.getId() {
        return this.id;
    }
    
    public void Phone.setId(Long id) {
        this.id = id;
    }
    
    public Integer Phone.getVersion() {
        return this.version;
    }
    
    public void Phone.setVersion(Integer version) {
        this.version = version;
    }
    
}
