package com.mihausik.bil;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.OneToOne;
import javax.persistence.Query;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.security.core.context.SecurityContextHolder;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findManagersByLoginEquals" })
public class Manager {

    /**
     */
    private String manname;

    private String password;

    private Boolean enable;

    private String login;

    @OneToOne
    private Doljnost doljnost;
    
    public static String getClientsService(String login) {
        EntityManager em = Clientservice.entityManager();
        Query q = em.createQuery("SELECT o.manname FROM Manager AS o WHERE o.login = :login");
        q.setParameter("login", login);
        return (String) q.getSingleResult();
    }
    
    public static List<Manager> findAllManagers() {
        return entityManager().createQuery("SELECT o FROM Manager o order by o.enable DESC,o.manname", Manager.class).getResultList();
    }
    
    public static List<Manager> findManagerEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Manager o order by o.manname,o.enable ", Manager.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
}
