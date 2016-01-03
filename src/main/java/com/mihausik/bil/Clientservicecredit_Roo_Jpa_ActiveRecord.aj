// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mihausik.bil;

import com.mihausik.bil.Clientservicecredit;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Clientservicecredit_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Clientservicecredit.entityManager;
    
    public static final List<String> Clientservicecredit.fieldNames4OrderClauseFilter = java.util.Arrays.asList("clientservice", "credit", "Datastartcredit", "Datastopcredit");
    
    public static final EntityManager Clientservicecredit.entityManager() {
        EntityManager em = new Clientservicecredit().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Clientservicecredit.countClientservicecredits() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Clientservicecredit o", Long.class).getSingleResult();
    }
    
    public static List<Clientservicecredit> Clientservicecredit.findAllClientservicecredits() {
        return entityManager().createQuery("SELECT o FROM Clientservicecredit o", Clientservicecredit.class).getResultList();
    }
    
    public static List<Clientservicecredit> Clientservicecredit.findAllClientservicecredits(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Clientservicecredit o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Clientservicecredit.class).getResultList();
    }
    
    public static Clientservicecredit Clientservicecredit.findClientservicecredit(Long id) {
        if (id == null) return null;
        return entityManager().find(Clientservicecredit.class, id);
    }
    
    public static List<Clientservicecredit> Clientservicecredit.findClientservicecreditEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Clientservicecredit o", Clientservicecredit.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Clientservicecredit> Clientservicecredit.findClientservicecreditEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Clientservicecredit o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Clientservicecredit.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Clientservicecredit.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Clientservicecredit.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Clientservicecredit attached = Clientservicecredit.findClientservicecredit(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Clientservicecredit.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Clientservicecredit.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Clientservicecredit Clientservicecredit.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Clientservicecredit merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
