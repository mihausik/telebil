package com.mihausik.bil;
import javax.persistence.EntityManager;
import javax.persistence.OneToOne;
import javax.persistence.Query;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import java.util.Date;
import java.util.List;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.format.annotation.DateTimeFormat;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findClientservicephonesByClientservice" })
public class Clientservicephone {

    /* @OneToOne
     public Phone phone;*/
    @OneToOne
    public Clientservice clientservice;

    public String phonenum;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date datavklucheniya;
    
    
    public static int deleteclsp(Clientservice clientservice) {
        return new Clientservicephone().deleteAllTransactional(clientservice);
    }
    
    @Transactional
    public int deleteAllTransactional(Clientservice clientservice) {
        EntityManager em = Clientservicestatus.entityManager();
        Query q = em.createQuery("DELETE from Clientservicephone clsp where clsp.clientservice = :clientservice ");
        System.out.println(clientservice);
        q.setParameter("clientservice", clientservice);
        return q.executeUpdate();
    }
}
