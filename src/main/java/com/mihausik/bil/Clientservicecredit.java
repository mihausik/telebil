package com.mihausik.bil;
import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.OneToOne;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findClientservicecreditsByClientserviceAndDatastartcreditBetween" })
public class Clientservicecredit {

    @OneToOne
    private Clientservice clientservice;

    private Integer credit;

    private String Datastartcredit;

    private String Datastopcredit;

    public static String getdatepresence(Date datastartcredit, Clientservice clientservice) {
        EntityManager em = Clientservicecredit.entityManager();
        Query q = em.createQuery("SELECT count(o.Datastartcredit) FROM Clientservicecredit AS o where o.Datastartcredit = :datastartcredit and o.Clientservice = :clientservice");
        q.setParameter("datastartcredit", datastartcredit);
        q.setParameter("clientservice", clientservice);
        return (String) q.getSingleResult();
    }

    public static Long findClientservicecreditsByClientserviceAndDatastartcreditBetween(Clientservice clientservice, String datestring) {
        if (clientservice == null) throw new IllegalArgumentException("The clientservice argument is required");
        if (datestring == null) throw new IllegalArgumentException("The minDatastartcredit argument is required");
        //if (Datastopcredit == null) throw new IllegalArgumentException("The maxDatastartcredit argument is required");
        EntityManager em = Clientservicecredit.entityManager();
        Query q = em.createQuery("SELECT count(o.Datastartcredit) FROM Clientservicecredit AS o WHERE o.clientservice = :clientservice AND o.Datastartcredit like (:Datastartcredit) ");
        q.setParameter("clientservice", clientservice);
        q.setParameter("Datastartcredit", "%" + datestring + "%");
        //q.setParameter("Datastopcredit", Datastopcredit);
        return (Long) q.getSingleResult();
    }
    
    public static Clientservice findClientserviceByClientservicecredits(Clientservicecredit clientservicecredit) {
        EntityManager em = Clientservicecredit.entityManager();
        Query q = em.createQuery("SELECT o.clientservice FROM Clientservicecredit AS o WHERE o = :id");
        q.setParameter("id", clientservicecredit);
        return (Clientservice) q.getSingleResult();
    }
}
