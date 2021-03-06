// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mihausik.bil;

import com.mihausik.bil.Clientcontact;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Clientcontact_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Clientcontact.entityManager;
    
    public static final List<String> Clientcontact.fieldNames4OrderClauseFilter = java.util.Arrays.asList("contact");
    
    public static final EntityManager Clientcontact.entityManager() {
        EntityManager em = new Clientcontact().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Clientcontact.countClientcontacts() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Clientcontact o", Long.class).getSingleResult();
    }
    
    public static List<Clientcontact> Clientcontact.findAllClientcontacts() {
        return entityManager().createQuery("SELECT o FROM Clientcontact o", Clientcontact.class).getResultList();
    }
    
    public static List<Clientcontact> Clientcontact.findAllClientcontacts(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Clientcontact o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Clientcontact.class).getResultList();
    }
    
    public static Clientcontact Clientcontact.findClientcontact(Long id) {
        if (id == null) return null;
        return entityManager().find(Clientcontact.class, id);
    }
    
    public static List<Clientcontact> Clientcontact.findClientcontactEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Clientcontact o", Clientcontact.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Clientcontact> Clientcontact.findClientcontactEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Clientcontact o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Clientcontact.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Clientcontact.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Clientcontact.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Clientcontact attached = Clientcontact.findClientcontact(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Clientcontact.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Clientcontact.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Clientcontact Clientcontact.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Clientcontact merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
