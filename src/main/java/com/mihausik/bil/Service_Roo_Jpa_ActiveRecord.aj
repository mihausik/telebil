// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mihausik.bil;

import com.mihausik.bil.Service;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Service_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Service.entityManager;
    
    public static final List<String> Service.fieldNames4OrderClauseFilter = java.util.Arrays.asList("name", "price");
    
    public static final EntityManager Service.entityManager() {
        EntityManager em = new Service().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Service.countServices() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Service o", Long.class).getSingleResult();
    }
    
    public static List<Service> Service.findAllServices(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Service o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Service.class).getResultList();
    }
    
    public static Service Service.findService(Long id) {
        if (id == null) return null;
        return entityManager().find(Service.class, id);
    }
    
    public static List<Service> Service.findServiceEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Service o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Service.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Service.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Service.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Service attached = Service.findService(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Service.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Service.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Service Service.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Service merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
