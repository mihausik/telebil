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
@RooJpaActiveRecord(finders = { "findCdrsBySourceLikeOrCalltimeBetween" })
public class Cdr {

    private String destination;

    private String duration;

    private String sell;

    private String source;

    private String disposition;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "HH:mm:ss dd-MM-yy")
    private Date calltime;
    
    @OneToOne
    Clientservice clientservice;
    
    public static TypedQuery<Cdr> findCdrsBySourceLikeOrCalltimeBetween(String source, Date minCalltime, Date maxCalltime) {
        if (source == null || source.length() == 0) throw new IllegalArgumentException("The source argument is required");
        source = source.replace('*', '%');
        if (source.charAt(0) != '%') {
            source = "%" + source;
        }
        if (source.charAt(source.length() - 1) != '%') {
            source = source + "%";
        }
        if (minCalltime == null) throw new IllegalArgumentException("The minCalltime argument is required");
        if (maxCalltime == null) throw new IllegalArgumentException("The maxCalltime argument is required");
        EntityManager em = entityManager();
        TypedQuery<Cdr> q = em.createQuery("SELECT o FROM Cdr AS o WHERE LOWER(o.source) LIKE LOWER(:source) and o.calltime BETWEEN :minCalltime AND :maxCalltime", Cdr.class);
        q.setParameter("source", source);
        q.setParameter("minCalltime", minCalltime);
        q.setParameter("maxCalltime", maxCalltime);
        return q;
    }
    
}
