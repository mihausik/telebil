// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mihausik.bil;

import com.mihausik.bil.Commutator;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Commutator_Roo_Jpa_Entity {
    
    declare @type: Commutator: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Commutator.id;
    
    @Version
    @Column(name = "version")
    private Integer Commutator.version;
    
    public Long Commutator.getId() {
        return this.id;
    }
    
    public void Commutator.setId(Long id) {
        this.id = id;
    }
    
    public Integer Commutator.getVersion() {
        return this.version;
    }
    
    public void Commutator.setVersion(Integer version) {
        this.version = version;
    }
    
}
