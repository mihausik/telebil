// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mihausik.bil;

import com.mihausik.bil.Clientservice;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Clientservice_Roo_Jpa_Entity {
    
    declare @type: Clientservice: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Clientservice.id;
    
    @Version
    @Column(name = "version")
    private Integer Clientservice.version;
    
    public Long Clientservice.getId() {
        return this.id;
    }
    
    public void Clientservice.setId(Long id) {
        this.id = id;
    }
    
    public Integer Clientservice.getVersion() {
        return this.version;
    }
    
    public void Clientservice.setVersion(Integer version) {
        this.version = version;
    }
    
}