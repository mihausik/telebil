// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mihausik.bil;

import com.mihausik.bil.Abonstatistics;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Abonstatistics_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Abonstatistics.entityManager;
    
    public static final List<String> Abonstatistics.fieldNames4OrderClauseFilter = java.util.Arrays.asList("supplier", "date", "abonquantitypodkl", "abonquantityotkl");
    
    public static final EntityManager Abonstatistics.entityManager() {
        EntityManager em = new Abonstatistics().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Abonstatistics.countAbonstatisticses() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Abonstatistics o", Long.class).getSingleResult();
    }
    
    public static List<Abonstatistics> Abonstatistics.findAllAbonstatisticses() {
        return entityManager().createQuery("SELECT o FROM Abonstatistics o", Abonstatistics.class).getResultList();
    }
    
    public static List<Abonstatistics> Abonstatistics.findAllAbonstatisticses(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Abonstatistics o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Abonstatistics.class).getResultList();
    }
    
    public static Abonstatistics Abonstatistics.findAbonstatistics(Long id) {
        if (id == null) return null;
        return entityManager().find(Abonstatistics.class, id);
    }
    
    public static List<Abonstatistics> Abonstatistics.findAbonstatisticsEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Abonstatistics o", Abonstatistics.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Abonstatistics> Abonstatistics.findAbonstatisticsEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Abonstatistics o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Abonstatistics.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Abonstatistics.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Abonstatistics.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Abonstatistics attached = Abonstatistics.findAbonstatistics(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Abonstatistics.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Abonstatistics.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Abonstatistics Abonstatistics.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Abonstatistics merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}