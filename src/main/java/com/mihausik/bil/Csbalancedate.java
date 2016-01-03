package com.mihausik.bil;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.OneToOne;
import javax.persistence.Query;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.TypedQuery;

import org.springframework.format.annotation.DateTimeFormat;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Csbalancedate {

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date date;

    @OneToOne
    private Clientservice clientservice;

    private Float balance;
    
    
    /*public static void deletecsb(Clientservice clientservice) {
    	        EntityManager em = Clientserviceip.entityManager();
    	        Query q = em.createQuery("DELETE from  Csbalancedate csb where csb.clientservice = :clientservice ");
    	        q.setParameter("clientservice", clientservice);
    	        q.executeUpdate();
    	    }
    */
    public static int deletecsb(Clientservice clientservice) {
        return new Csbalancedate().deleteAllTransactional(clientservice);
    }

    @Transactional
    public int deleteAllTransactional(Clientservice clientservice) {
        EntityManager em = Csbalancedate.entityManager();
        Query q = em.createQuery("DELETE from  Csbalancedate csb where csb.clientservice = :clientservice ");
        q.setParameter("clientservice", clientservice);
        return q.executeUpdate();
    }
    
    public static TypedQuery<Csbalancedate> findCsbalancedatesByDateBetween(Date minDate, Date maxDate) {
        if (minDate == null) throw new IllegalArgumentException("The minDate argument is required");
        if (maxDate == null) throw new IllegalArgumentException("The maxDate argument is required");
        EntityManager em = Csbalancedate.entityManager();
        TypedQuery<Csbalancedate> q = em.createQuery("SELECT o FROM Csbalancedate AS o WHERE o.date BETWEEN :minDate AND :maxDate", Csbalancedate.class);
        q.setParameter("minDate", minDate);
        q.setParameter("maxDate", maxDate);
        return q;
    }
    
    public static TypedQuery<Csbalancedate> findCsbalancedatesByDateBetweenAndClientservice(Date minDate, Date maxDate, Clientservice clientservice) {
        if (minDate == null) throw new IllegalArgumentException("The minDate argument is required");
        if (maxDate == null) throw new IllegalArgumentException("The maxDate argument is required");
        if (clientservice == null) throw new IllegalArgumentException("The clientservice argument is required");
        EntityManager em = Csbalancedate.entityManager();
        TypedQuery<Csbalancedate> q = em.createQuery("SELECT o FROM Csbalancedate AS o WHERE o.date BETWEEN :minDate AND :maxDate  AND o.clientservice = :clientservice", Csbalancedate.class);
        q.setParameter("minDate", minDate);
        q.setParameter("maxDate", maxDate);
        q.setParameter("clientservice", clientservice);
        return q;
    }
}
