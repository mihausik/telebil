package com.mihausik.bil;
import java.util.Date;
import java.util.List;

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

import javax.persistence.Enumerated;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findProverkatahvozmsByTvexistence", "findProverkatahvozmsByManager", "findProverkatahvozmsByAddrpodclucheniaLike" })
public class Proverkatahvozm {

    private String potencialclient;

    @OneToOne
    private Manager manager;

    private String addrpodcluchenia;

    private String clientcontacts;

    private String stoimostpodkluchenia;

    private String commentsdir;

    private String commentsmanager;

    private String abonplata;

    private String trabovaniakkanalu;

    /*   private String resultat;*/
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    private Date datarazmescheniya;

    private String dostupvzdanie;

    private String srokvkluchenia;

    @Enumerated
    private TVexist tvexistence;
    
    @Enumerated
    private ProvTVstatus provTVstatus;

    @OneToOne
    private Citystreets citystreets;
    
    
    public static List<Proverkatahvozm> findAllProverkatahvozms() {
        return entityManager().createQuery("SELECT o FROM Proverkatahvozm o order by o.datarazmescheniya DESC", Proverkatahvozm.class).getResultList();
    }

    public static List<Proverkatahvozm> findProverkatahvozmEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Proverkatahvozm o order by o.datarazmescheniya DESC", Proverkatahvozm.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }

    public static TypedQuery<Proverkatahvozm> findProverkatahvozmsByManager(Manager manager) {
        if (manager == null) throw new IllegalArgumentException("The manager argument is required");
        EntityManager em = Proverkatahvozm.entityManager();
        TypedQuery<Proverkatahvozm> q = em.createQuery("SELECT o FROM Proverkatahvozm AS o WHERE o.manager = :manager order by o.datarazmescheniya DESC", Proverkatahvozm.class);
        q.setParameter("manager", manager);
        return q;
    }
    
    public static TypedQuery<Proverkatahvozm> findProverkatahvozmsByTvexistence(TVexist tvexistence) {
        if (tvexistence == null) throw new IllegalArgumentException("The tvexistence argument is required");
        EntityManager em = Proverkatahvozm.entityManager();
        TypedQuery<Proverkatahvozm> q = em.createQuery("SELECT o FROM Proverkatahvozm AS o WHERE o.tvexistence = :tvexistence order by o.datarazmescheniya DESC", Proverkatahvozm.class);
        q.setParameter("tvexistence", tvexistence);
        return q;
    }
  /*  
    public static TypedQuery<Proverkatahvozm> findPTVByFullAddress(String addrpodcluchenia) {
        EntityManager em = Proverkatahvozm.entityManager();
        TypedQuery<Proverkatahvozm> q = em.createQuery("SELECT o FROM Proverkatahvozm AS o WHERE LOWER(o.addrpodcluchenia) LIKE LOWER(:addrpodcluchenia)", Proverkatahvozm.class);
        q.setParameter("addrpodcluchenia", addrpodcluchenia);
        return q;
    }
    */
    public static Long findPTVByFullAddress(Citystreets street, String address,Date datap , Date weekago) {
        EntityManager em = Proverkatahvozm.entityManager();
        Query q = em.createQuery("SELECT count(o) FROM Proverkatahvozm AS o WHERE o.addrpodcluchenia = :address AND o.citystreets = :street and o.datarazmescheniya between :weekago and :datap");
        q.setParameter("street", street);
        q.setParameter("address", address);
        q.setParameter("datap", datap);
        q.setParameter("weekago", weekago);
        return (Long) q.getSingleResult();
    }
    
    public static TypedQuery<Proverkatahvozm> findProverkatahvozmsByStreetandAddrpod(Citystreets citystreets) {
        EntityManager em = Proverkatahvozm.entityManager();
        TypedQuery<Proverkatahvozm> q = em.createQuery("SELECT o FROM Proverkatahvozm AS o WHERE o.citystreets =:citystreets", Proverkatahvozm.class);
//        q.setParameter("addrpodcluchenia", addrpodcluchenia);
        q.setParameter("citystreets", citystreets);
        return q;
    }
}
