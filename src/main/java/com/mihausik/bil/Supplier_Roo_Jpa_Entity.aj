// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mihausik.bil;

import com.mihausik.bil.Supplier;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Supplier_Roo_Jpa_Entity {
    
    declare @type: Supplier: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Supplier.id;
    
    @Version
    @Column(name = "version")
    private Integer Supplier.version;
    
    public Long Supplier.getId() {
        return this.id;
    }
    
    public void Supplier.setId(Long id) {
        this.id = id;
    }
    
    public Integer Supplier.getVersion() {
        return this.version;
    }
    
    public void Supplier.setVersion(Integer version) {
        this.version = version;
    }
    
}
