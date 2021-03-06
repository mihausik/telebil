// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mihausik.bil;

import com.mihausik.bil.Ocherednapodkluchenie;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Ocherednapodkluchenie_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Ocherednapodkluchenie.entityManager;
    
    public static final List<String> Ocherednapodkluchenie.fieldNames4OrderClauseFilter = java.util.Arrays.asList("client", "manager", "clientservice", "supplier", "arhiv", "datapodkluchenia", "deadlinedate");
    
    public static final EntityManager Ocherednapodkluchenie.entityManager() {
        EntityManager em = new Ocherednapodkluchenie().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Ocherednapodkluchenie.countOcherednapodkluchenies() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Ocherednapodkluchenie o", Long.class).getSingleResult();
    }
    
    public static List<Ocherednapodkluchenie> Ocherednapodkluchenie.findAllOcherednapodkluchenies(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Ocherednapodkluchenie o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Ocherednapodkluchenie.class).getResultList();
    }
    
    public static Ocherednapodkluchenie Ocherednapodkluchenie.findOcherednapodkluchenie(Long id) {
        if (id == null) return null;
        return entityManager().find(Ocherednapodkluchenie.class, id);
    }
    
    public static List<Ocherednapodkluchenie> Ocherednapodkluchenie.findOcherednapodkluchenieEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Ocherednapodkluchenie o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Ocherednapodkluchenie.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Ocherednapodkluchenie.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Ocherednapodkluchenie.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Ocherednapodkluchenie attached = Ocherednapodkluchenie.findOcherednapodkluchenie(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Ocherednapodkluchenie.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Ocherednapodkluchenie.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Ocherednapodkluchenie Ocherednapodkluchenie.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Ocherednapodkluchenie merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
