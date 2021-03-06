// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mihausik.bil;

import com.mihausik.bil.Csbalancedate;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Csbalancedate_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Csbalancedate.entityManager;
    
    public static final List<String> Csbalancedate.fieldNames4OrderClauseFilter = java.util.Arrays.asList("date", "clientservice", "balance");
    
    public static final EntityManager Csbalancedate.entityManager() {
        EntityManager em = new Csbalancedate().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Csbalancedate.countCsbalancedates() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Csbalancedate o", Long.class).getSingleResult();
    }
    
    public static List<Csbalancedate> Csbalancedate.findAllCsbalancedates() {
        return entityManager().createQuery("SELECT o FROM Csbalancedate o", Csbalancedate.class).getResultList();
    }
    
    public static List<Csbalancedate> Csbalancedate.findAllCsbalancedates(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Csbalancedate o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Csbalancedate.class).getResultList();
    }
    
    public static Csbalancedate Csbalancedate.findCsbalancedate(Long id) {
        if (id == null) return null;
        return entityManager().find(Csbalancedate.class, id);
    }
    
    public static List<Csbalancedate> Csbalancedate.findCsbalancedateEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Csbalancedate o", Csbalancedate.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Csbalancedate> Csbalancedate.findCsbalancedateEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Csbalancedate o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Csbalancedate.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Csbalancedate.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Csbalancedate.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Csbalancedate attached = Csbalancedate.findCsbalancedate(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Csbalancedate.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Csbalancedate.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Csbalancedate Csbalancedate.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Csbalancedate merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
