// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mihausik.bil;

import com.mihausik.bil.Devicetype;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Devicetype_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Devicetype.entityManager;
    
    public static final List<String> Devicetype.fieldNames4OrderClauseFilter = java.util.Arrays.asList("devtype");
    
    public static final EntityManager Devicetype.entityManager() {
        EntityManager em = new Devicetype().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Devicetype.countDevicetypes() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Devicetype o", Long.class).getSingleResult();
    }
    
    public static List<Devicetype> Devicetype.findAllDevicetypes() {
        return entityManager().createQuery("SELECT o FROM Devicetype o", Devicetype.class).getResultList();
    }
    
    public static List<Devicetype> Devicetype.findAllDevicetypes(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Devicetype o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Devicetype.class).getResultList();
    }
    
    public static Devicetype Devicetype.findDevicetype(Long id) {
        if (id == null) return null;
        return entityManager().find(Devicetype.class, id);
    }
    
    public static List<Devicetype> Devicetype.findDevicetypeEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Devicetype o", Devicetype.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Devicetype> Devicetype.findDevicetypeEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Devicetype o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Devicetype.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Devicetype.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Devicetype.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Devicetype attached = Devicetype.findDevicetype(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Devicetype.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Devicetype.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Devicetype Devicetype.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Devicetype merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
