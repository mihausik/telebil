// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mihausik.bil;

import com.mihausik.bil.Statuslica;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Statuslica_Roo_Jpa_Entity {
    
    declare @type: Statuslica: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Statuslica.id;
    
    @Version
    @Column(name = "version")
    private Integer Statuslica.version;
    
    public Long Statuslica.getId() {
        return this.id;
    }
    
    public void Statuslica.setId(Long id) {
        this.id = id;
    }
    
    public Integer Statuslica.getVersion() {
        return this.version;
    }
    
    public void Statuslica.setVersion(Integer version) {
        this.version = version;
    }
    
}