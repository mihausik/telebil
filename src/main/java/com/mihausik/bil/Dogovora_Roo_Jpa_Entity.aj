// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mihausik.bil;

import com.mihausik.bil.Dogovora;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Dogovora_Roo_Jpa_Entity {
    
    declare @type: Dogovora: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Dogovora.id;
    
    @Version
    @Column(name = "version")
    private Integer Dogovora.version;
    
    public Long Dogovora.getId() {
        return this.id;
    }
    
    public void Dogovora.setId(Long id) {
        this.id = id;
    }
    
    public Integer Dogovora.getVersion() {
        return this.version;
    }
    
    public void Dogovora.setVersion(Integer version) {
        this.version = version;
    }
    
}
