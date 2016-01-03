package com.mihausik.bil;
import javax.persistence.EntityManager;
import javax.persistence.Enumerated;
import javax.persistence.OneToOne;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.validation.constraints.NotNull;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.transaction.annotation.Transactional;


@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findClientserviceipsByClientservice", "findClientserviceipsByIpLike" })
public class Clientserviceip {

    @OneToOne
    public Clientservice clientservice;

    @NotNull
    private String ip;

    @NotNull
    private String mask;

    private String gateway;

    private String macaddr;
    
    @Enumerated
    private IPtype iptype;

    public static int deleteclsip(Clientservice clientservice) {
        return new Clientserviceip().deleteAllTransactional(clientservice);
    }

    @Transactional
    public int deleteAllTransactional(Clientservice clientservice) {
        EntityManager em = Clientserviceip.entityManager();
        Query q = em.createQuery("DELETE from Clientserviceip clsip where clsip.clientservice = :clientservice ");
        System.out.println(clientservice);
        q.setParameter("clientservice", clientservice);
        return q.executeUpdate();
    }
    
    public static Long findClientserviceipsByIpLike(String ip) {
        if (ip == null || ip.length() == 0) throw new IllegalArgumentException("The ip argument is required");
        ip = ip.replace('*', '%');
        if (ip.charAt(0) != '%') {
            ip = "%" + ip;
        }
        if (ip.charAt(ip.length() - 1) != '%') {
            ip = ip + "%";
        }
        EntityManager em = Clientserviceip.entityManager();
        Query q = em.createQuery("SELECT count(o) FROM Clientserviceip AS o WHERE LOWER(o.ip) LIKE LOWER(:ip)");
        q.setParameter("ip", ip);
        return  (Long) q.getSingleResult();
    }
    
    
    public static Long findClientserviceipsByIp(String ip) {
        if (ip == null || ip.length() == 0) throw new IllegalArgumentException("The ip argument is required");
        EntityManager em = Clientserviceip.entityManager();
        Query q = em.createQuery("SELECT count(o) FROM Clientserviceip AS o WHERE o.ip=:ip ");
        q.setParameter("ip", ip);
        return  (Long) q.getSingleResult();
    }
    
  /*  public static Long findClientservicecreditsByClientserviceAndDatastartcreditBetween(Clientservice clientservice, String datestring) {
        if (clientservice == null) throw new IllegalArgumentException("The clientservice argument is required");
        if (datestring == null) throw new IllegalArgumentException("The minDatastartcredit argument is required");
        //if (Datastopcredit == null) throw new IllegalArgumentException("The maxDatastartcredit argument is required");
        EntityManager em = Clientservicecredit.entityManager();
        Query q = em.createQuery("SELECT count(o.Datastartcredit) FROM Clientservicecredit AS o WHERE o.clientservice = :clientservice AND o.Datastartcredit like (:Datastartcredit) ");
        q.setParameter("clientservice", clientservice);
        q.setParameter("Datastartcredit", "%"+datestring+"%");
        //q.setParameter("Datastopcredit", Datastopcredit);
        return  (Long) q.getSingleResult();
    }*/
}
