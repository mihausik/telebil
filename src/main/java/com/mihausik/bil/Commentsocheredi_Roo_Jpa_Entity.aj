// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mihausik.bil;

import com.mihausik.bil.Commentsocheredi;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Commentsocheredi_Roo_Jpa_Entity {
    
    declare @type: Commentsocheredi: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Commentsocheredi.id;
    
    @Version
    @Column(name = "version")
    private Integer Commentsocheredi.version;
    
    public Long Commentsocheredi.getId() {
        return this.id;
    }
    
    public void Commentsocheredi.setId(Long id) {
        this.id = id;
    }
    
    public Integer Commentsocheredi.getVersion() {
        return this.version;
    }
    
    public void Commentsocheredi.setVersion(Integer version) {
        this.version = version;
    }
    
}
