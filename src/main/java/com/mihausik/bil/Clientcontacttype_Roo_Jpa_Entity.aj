// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mihausik.bil;

import com.mihausik.bil.Clientcontacttype;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Clientcontacttype_Roo_Jpa_Entity {
    
    declare @type: Clientcontacttype: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Clientcontacttype.id;
    
    @Version
    @Column(name = "version")
    private Integer Clientcontacttype.version;
    
    public Long Clientcontacttype.getId() {
        return this.id;
    }
    
    public void Clientcontacttype.setId(Long id) {
        this.id = id;
    }
    
    public Integer Clientcontacttype.getVersion() {
        return this.version;
    }
    
    public void Clientcontacttype.setVersion(Integer version) {
        this.version = version;
    }
    
}