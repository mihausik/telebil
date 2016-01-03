package com.mihausik.bil;
import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.TypedQuery;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord 
public class Abonstatistics {

    @OneToOne
    private Supplier supplier;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    private Date date;

    private Integer abonquantitypodkl;

    private Integer abonquantityotkl;
    
    public static TypedQuery<Abonstatistics> findAbonstatisticsesByDateBetween(Date minDate, Date maxDate) {
        EntityManager em = Abonstatistics.entityManager();
        TypedQuery<Abonstatistics> q = em.createQuery("SELECT count(o) FROM Clientservice AS o WHERE o.date BETWEEN :minDate AND :maxDate", Abonstatistics.class);
        q.setParameter("minDate", minDate);
        q.setParameter("maxDate", maxDate);
        return q;
    }
}
