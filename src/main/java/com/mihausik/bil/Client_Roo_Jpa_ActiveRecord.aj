// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mihausik.bil;

import com.mihausik.bil.Client;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Client_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Client.entityManager;
    
    public static final List<String> Client.fieldNames4OrderClauseFilter = java.util.Arrays.asList("clientname", "numberraschscheta", "bank", "mfo", "yuredrpou", "yurnumbersvidplatnds", "yurindividnagkod", "manager", "statuslica", "supplier", "yurstatus", "yurcity", "yurpostindex", "yurhousenum", "yurofficenum", "fizcity", "fizpostindex", "fizhousenum", "fizofficenum", "fizedrpou", "fiznumbersvidplatnds", "fizindividnagkod", "fizclientname", "fiodirector", "yurstreet", "fizstreet", "clientweblogin", "clientwebpass", "clientwebenable", "balancesumarniy", "authority", "arkhiv");
    
    public static final EntityManager Client.entityManager() {
        EntityManager em = new Client().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Client.countClients() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Client o", Long.class).getSingleResult();
    }
    
    public static List<Client> Client.findAllClients(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Client o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Client.class).getResultList();
    }
    
    public static Client Client.findClient(Long id) {
        if (id == null) return null;
        return entityManager().find(Client.class, id);
    }
    
    public static List<Client> Client.findClientEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Client o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Client.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Client.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Client.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Client attached = Client.findClient(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Client.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Client.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Client Client.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Client merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
