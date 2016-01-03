package com.mihausik.bil;
import java.util.List;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import javax.persistence.EntityManager;
import javax.persistence.OneToOne;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findClientdatasByClient" })
public class Clientdata {

    /**
     */
    @OneToOne
    private Clientcontacttype contacttype;

    /**
     */
    @OneToOne
    private Clientcontact contactname;

    /**
     */
    @OneToOne
    private Client client;

    /**
     */
    private String contact;

    private String fio;
    
    private String doljnost;

    public static List<Clientdata> findAllClientdatas() {
        return entityManager().createQuery("SELECT o FROM Clientdata o order by o.contacttype", Clientdata.class).getResultList();
    }

    public static List<Clientdata> findClientdataEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Clientdata o order by o.contacttype", Clientdata.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static TypedQuery<Clientdata> findtehcontactsByClient(Client client) {
        if (client == null) throw new IllegalArgumentException("The client argument is required");
        EntityManager em = Clientdata.entityManager();
        TypedQuery<Clientdata> q = em.createQuery("SELECT o FROM Clientdata AS o WHERE o.client = :client and o.contacttype='3'", Clientdata.class);
        q.setParameter("client", client);
        return q;
    }
    
    public static TypedQuery<Clientdata> findfincontactsByClient(Client client) {
        if (client == null) throw new IllegalArgumentException("The client argument is required");
        EntityManager em = Clientdata.entityManager();
        TypedQuery<Clientdata> q = em.createQuery("SELECT o FROM Clientdata AS o WHERE o.client = :client and o.contacttype='2'", Clientdata.class);
        q.setParameter("client", client);
        return q;
    }
    
    public static TypedQuery<Clientdata> findgencontactsByClient(Client client) {
        if (client == null) throw new IllegalArgumentException("The client argument is required");
        EntityManager em = Clientdata.entityManager();
        TypedQuery<Clientdata> q = em.createQuery("SELECT o FROM Clientdata AS o WHERE o.client = :client and o.contacttype='1'", Clientdata.class);
        q.setParameter("client", client);
        return q;
    }
    
     
    public static String getfinemailByClient(Client client) {
        EntityManager em = Clientdata.entityManager();
        Query q = em.createQuery("SELECT o.contact FROM Clientdata AS o WHERE o.client = :client and o.contacttype='2' and o.contactname='6'");
        q.setParameter("client", client);
        System.out.println(client);
        return (String) q.getSingleResult();
    }
    
    
    
}
