package com.mihausik.bil;
import javax.persistence.CascadeType;
import javax.persistence.EntityManager;
import javax.persistence.OneToOne;
import javax.persistence.Query;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.transaction.annotation.Transactional;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findClientservicestatusesByClientservice" })
public class Clientservicestatus {

    @OneToOne(cascade = {CascadeType.ALL})
    private Clientservice clientservice;

    private String status;
    
    public static int deleteclss(Clientservice clientservice) {
        return new Clientservicestatus().deleteAllTransactional(clientservice);
    }
    
    @Transactional
    public int deleteAllTransactional(Clientservice clientservice) {
        EntityManager em = Clientservicestatus.entityManager();
        Query q = em.createQuery("DELETE from Clientservicestatus clss where clss.clientservice = :clientservice ");
        System.out.println(clientservice);
        q.setParameter("clientservice", clientservice);
        return q.executeUpdate();
    }
}
