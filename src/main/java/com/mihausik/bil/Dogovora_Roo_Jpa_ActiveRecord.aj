// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mihausik.bil;

import com.mihausik.bil.Dogovora;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Dogovora_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Dogovora.entityManager;
    
    public static final List<String> Dogovora.fieldNames4OrderClauseFilter = java.util.Arrays.asList("nomerdogovora", "datadogovora", "contragent", "nazvaniedog", "soderjaniedogovora", "predmetdogovora", "promechaniya", "otvetstvennuychel", "viddogovora", "supplier");
    
    public static final EntityManager Dogovora.entityManager() {
        EntityManager em = new Dogovora().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Dogovora.countDogovoras() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Dogovora o", Long.class).getSingleResult();
    }
    
    public static List<Dogovora> Dogovora.findAllDogovoras() {
        return entityManager().createQuery("SELECT o FROM Dogovora o", Dogovora.class).getResultList();
    }
    
    public static List<Dogovora> Dogovora.findAllDogovoras(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Dogovora o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Dogovora.class).getResultList();
    }
    
    public static Dogovora Dogovora.findDogovora(Long id) {
        if (id == null) return null;
        return entityManager().find(Dogovora.class, id);
    }
    
    public static List<Dogovora> Dogovora.findDogovoraEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Dogovora o", Dogovora.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Dogovora> Dogovora.findDogovoraEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Dogovora o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Dogovora.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Dogovora.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Dogovora.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Dogovora attached = Dogovora.findDogovora(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Dogovora.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Dogovora.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Dogovora Dogovora.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Dogovora merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
