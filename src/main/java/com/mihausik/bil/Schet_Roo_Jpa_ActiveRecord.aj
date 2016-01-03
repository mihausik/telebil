// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mihausik.bil;

import com.mihausik.bil.Schet;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Schet_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Schet.entityManager;
    
    public static final List<String> Schet.fieldNames4OrderClauseFilter = java.util.Arrays.asList("client", "schet", "contentType", "filesize", "filepath", "filename");
    
    public static final EntityManager Schet.entityManager() {
        EntityManager em = new Schet().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Schet.countSchets() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Schet o", Long.class).getSingleResult();
    }
    
    public static List<Schet> Schet.findAllSchets() {
        return entityManager().createQuery("SELECT o FROM Schet o", Schet.class).getResultList();
    }
    
    public static List<Schet> Schet.findAllSchets(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Schet o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Schet.class).getResultList();
    }
    
    public static Schet Schet.findSchet(Long id) {
        if (id == null) return null;
        return entityManager().find(Schet.class, id);
    }
    
    public static List<Schet> Schet.findSchetEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Schet o", Schet.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Schet> Schet.findSchetEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Schet o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Schet.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Schet.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Schet.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Schet attached = Schet.findSchet(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Schet.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Schet.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Schet Schet.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Schet merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
