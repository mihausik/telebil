// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mihausik.bil;

import com.mihausik.bil.Clientdata;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Clientdata_Roo_Jpa_Entity {
    
    declare @type: Clientdata: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Clientdata.id;
    
    @Version
    @Column(name = "version")
    private Integer Clientdata.version;
    
    public Long Clientdata.getId() {
        return this.id;
    }
    
    public void Clientdata.setId(Long id) {
        this.id = id;
    }
    
    public Integer Clientdata.getVersion() {
        return this.version;
    }
    
    public void Clientdata.setVersion(Integer version) {
        this.version = version;
    }
    
}
