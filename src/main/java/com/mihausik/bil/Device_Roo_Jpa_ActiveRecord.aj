// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mihausik.bil;

import com.mihausik.bil.Device;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Device_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Device.entityManager;
    
    public static final List<String> Device.fieldNames4OrderClauseFilter = java.util.Arrays.asList("devname", "serialnum", "devtype", "price");
    
    public static final EntityManager Device.entityManager() {
        EntityManager em = new Device().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Device.countDevices() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Device o", Long.class).getSingleResult();
    }
    
    public static List<Device> Device.findAllDevices() {
        return entityManager().createQuery("SELECT o FROM Device o", Device.class).getResultList();
    }
    
    public static List<Device> Device.findAllDevices(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Device o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Device.class).getResultList();
    }
    
    public static Device Device.findDevice(Long id) {
        if (id == null) return null;
        return entityManager().find(Device.class, id);
    }
    
    public static List<Device> Device.findDeviceEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Device o", Device.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Device> Device.findDeviceEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Device o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Device.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Device.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Device.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Device attached = Device.findDevice(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Device.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Device.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Device Device.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Device merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
