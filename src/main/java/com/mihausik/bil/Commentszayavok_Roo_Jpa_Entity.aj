// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mihausik.bil;

import com.mihausik.bil.Commentszayavok;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Commentszayavok_Roo_Jpa_Entity {
    
    declare @type: Commentszayavok: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Commentszayavok.id;
    
    @Version
    @Column(name = "version")
    private Integer Commentszayavok.version;
    
    public Long Commentszayavok.getId() {
        return this.id;
    }
    
    public void Commentszayavok.setId(Long id) {
        this.id = id;
    }
    
    public Integer Commentszayavok.getVersion() {
        return this.version;
    }
    
    public void Commentszayavok.setVersion(Integer version) {
        this.version = version;
    }
    
}
