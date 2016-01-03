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
public class Tempblock {

    @OneToOne
    private Clientservice clientservice;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    private Date startblock;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    private Date stopblock;
    
    
    public static int deleteblocks(Clientservice clientservice) {
        return new Tempblock().deleteAllTransactional(clientservice);
    }

    @Transactional
    public int deleteAllTransactional(Clientservice clientservice) {
        EntityManager em = Payment.entityManager();
        Query q = em.createQuery("DELETE FROM Tempblock AS p WHERE p.clientservice = :clientservice ");
        q.setParameter("clientservice", clientservice);
        return q.executeUpdate();
    }
    
    public static TypedQuery<Tempblock> findTempblocksByClientservice(Clientservice clientservice) {
        if (clientservice == null) throw new IllegalArgumentException("The clientservice argument is required");
        EntityManager em = Tempblock.entityManager();
        TypedQuery<Tempblock> q = em.createQuery("SELECT o FROM Tempblock AS o WHERE o.clientservice = :clientservice", Tempblock.class);
        q.setParameter("clientservice", clientservice);
        return q;
    }

}
