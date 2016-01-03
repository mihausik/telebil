// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mihausik.bil;

import com.mihausik.bil.Commentsocheredi;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Commentsocheredi_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Commentsocheredi.entityManager;
    
    public static final List<String> Commentsocheredi.fieldNames4OrderClauseFilter = java.util.Arrays.asList("comment", "manager", "ocherednapodkluchenie");
    
    public static final EntityManager Commentsocheredi.entityManager() {
        EntityManager em = new Commentsocheredi().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Commentsocheredi.countCommentsocheredis() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Commentsocheredi o", Long.class).getSingleResult();
    }
    
    public static List<Commentsocheredi> Commentsocheredi.findAllCommentsocheredis() {
        return entityManager().createQuery("SELECT o FROM Commentsocheredi o", Commentsocheredi.class).getResultList();
    }
    
    public static List<Commentsocheredi> Commentsocheredi.findAllCommentsocheredis(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Commentsocheredi o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Commentsocheredi.class).getResultList();
    }
    
    public static Commentsocheredi Commentsocheredi.findCommentsocheredi(Long id) {
        if (id == null) return null;
        return entityManager().find(Commentsocheredi.class, id);
    }
    
    public static List<Commentsocheredi> Commentsocheredi.findCommentsocherediEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Commentsocheredi o", Commentsocheredi.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Commentsocheredi> Commentsocheredi.findCommentsocherediEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Commentsocheredi o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Commentsocheredi.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Commentsocheredi.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Commentsocheredi.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Commentsocheredi attached = Commentsocheredi.findCommentsocheredi(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Commentsocheredi.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Commentsocheredi.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Commentsocheredi Commentsocheredi.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Commentsocheredi merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
