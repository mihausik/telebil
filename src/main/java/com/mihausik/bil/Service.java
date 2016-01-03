package com.mihausik.bil;
import java.util.List;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Service {

    /**
     */
    private String name;

    /**
     */
    private Float price;
    
    public static List<Service> findAllServices() {
        return entityManager().createQuery("SELECT o FROM Service o order by o.name", Service.class).getResultList();
    } 
    
    public static List<Service> findServiceEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Service o order by o.name", Service.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
}
