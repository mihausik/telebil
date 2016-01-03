package com.mihausik.bil;
import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.OneToOne;
import javax.persistence.Query;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.TypedQuery;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.transaction.annotation.Transactional;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findPaymentsByClient" })
public class Payment {

    private Float summa;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    private Date dataplateja;

    @OneToOne
    private Client client;

    @OneToOne
    private Clientservice clientservice;

    private String description;
    
    public static Long getClientbyclientservice(Clientservice clientservice) {
        EntityManager em = Clientservice.entityManager();
        Query q = em.createQuery("SELECT  o.client.id FROM Clientservice AS o WHERE o = :clientservice ");
        q.setParameter("clientservice", clientservice);
        q.setMaxResults(0);
        return  (Long) q.getSingleResult();
    }
    
   

    public static int deletepmnt(Clientservice clientservice) {
        return new Payment().deleteAllTransactional(clientservice);
    }

    @Transactional
    public int deleteAllTransactional(Clientservice clientservice) {
        EntityManager em = Payment.entityManager();
        Query q = em.createQuery("DELETE FROM Payment AS p WHERE p.clientservice = :clientservice ");
        q.setParameter("clientservice", clientservice);
        return q.executeUpdate();
    }
    
    public static TypedQuery<Payment> findPaymentsByClientservice(Clientservice clientservice) {
        if (clientservice == null) throw new IllegalArgumentException("The clientservice argument is required");
        EntityManager em = Payment.entityManager();
        TypedQuery<Payment> q = em.createQuery("SELECT o FROM Payment AS o WHERE o.clientservice = :clientservice", Payment.class);
        q.setParameter("clientservice", clientservice);
        return q;
    }

}
