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
@RooJpaActiveRecord
public class Clientservicerecount {

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    private Date datastartrecount;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    private Date datastoprecount;

    @OneToOne
    private Clientservice clientservice;

    private String status;

    private Long numdays;
    
    public static int deleteclsr(Clientservice clientservice) {
        return new Clientservicerecount().deleteAllTransactional(clientservice);
    }
    
    @Transactional
    public int deleteAllTransactional(Clientservice clientservice) {
        EntityManager em = Clientservicestatus.entityManager();
        Query q = em.createQuery("DELETE from Clientservicerecount clsr where clsr.clientservice = :clientservice ");
        System.out.println(clientservice);
        q.setParameter("clientservice", clientservice);
        return q.executeUpdate();
    }
    
    public static TypedQuery<Clientservicerecount> findClientservicerecountsByClientservice(Clientservice clientservice) {
        if (clientservice == null) throw new IllegalArgumentException("The clientservice argument is required");
        EntityManager em = Clientservicerecount.entityManager();
        TypedQuery<Clientservicerecount> q = em.createQuery("SELECT o FROM Clientservicerecount AS o WHERE o.clientservice = :clientservice", Clientservicerecount.class);
        q.setParameter("clientservice", clientservice);
        return q;
    }

}
