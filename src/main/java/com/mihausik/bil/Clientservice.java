package com.mihausik.bil;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Enumerated;
import javax.persistence.Lob;
import javax.persistence.OneToOne;
import javax.persistence.Query;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.TypedQuery;
import javax.validation.constraints.NotNull;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findClientservicesByClient" })
public class Clientservice {

    /**
     */
    @OneToOne
    private Client client;

    @OneToOne
    private Commutator commutator;

    @OneToOne
    private Callplan callplan;
    
    @OneToOne
    private Service service;
    
    private Float balance;

    @NotNull
    private String addresspreduslugi;
  
    private String ip;
    
    private String speed; 
    
    private String mask;
    
    private String gateway;

    private String vlan;
   
    private String connectionpoint;
    
    private Boolean statususlugi;

    @Value(value = "0")
    private String phonecreditblock;
    
    @Enumerated
    private Connectiontype connectiontype;
    
    private String gatewayswitch;
    
    private String tranzop; 
    
        
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date datapodkluchenia;
    
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date dataotkluchenia;
    
//picture 
    
    @Lob
    private byte[] schemapodk;

    private String contentType;

//   

    private Integer numberofbnlinij;
    
    private Integer numberofnlinij;
    
    
    public static Number getSumBalance(Client client) {
        EntityManager em = Clientservice.entityManager();
        Query q = em.createQuery("SELECT ROUND(SUM(o.balance), 2) FROM Clientservice AS o where o.client = :client");
        q.setParameter("client", client);
        return (Number) q.getSingleResult();
    }

    public static Long getClientService(Client client, Service service) {
        EntityManager em = Clientservice.entityManager();
        Query q = em.createQuery("SELECT o.id FROM Clientservice AS o WHERE o.client = :client AND o.service = :service");
        q.setParameter("client", client);
        q.setParameter("service", service);
        return (Long) q.getSingleResult();
    }

    public static Long getClientsService(Client client) {
        EntityManager em = Clientservice.entityManager();
        Query q = em.createQuery("SELECT o.id FROM Clientservice AS o WHERE o.client = :client ");
        q.setParameter("client", client);
        return (Long) q.getSingleResult();
    }

    public static Long findClservwithaddress(Client client, Service service, String address) {
        EntityManager em = Clientservice.entityManager();
        Query q = em.createQuery("SELECT o.id FROM Clientservice AS o WHERE o.client = :client AND o.service = :service AND o.address = :addresspreduslugi");
        q.setParameter("client", client);
        q.setParameter("service", service);
        q.setParameter("address", address);
        return (Long) q.getSingleResult();
    }
    
    public String getCurrentcredit(Clientservice clientservice) {
        EntityManager em = Clientservice.entityManager();
        Query q = em.createQuery("SELECT o.phonecreditblock FROM Clientservice AS o WHERE o = :clientservice ");
        q.setParameter("clientservice", clientservice);
        return (String) q.getSingleResult();
    }
    
   public Boolean ismailsent;
   
   public String creditdate;
   
   public String whogavecredit;
   
   
   public static List findClientservicesByDatapodkl(Date minDate, Date maxDate) {
       EntityManager em = Clientservice.entityManager();
       Query q = em.createQuery("SELECT o.client,count(o.datapodkluchenia) FROM Clientservice AS o WHERE o.datapodkluchenia BETWEEN :minDate AND :maxDate group by o.client.supplier");
       q.setParameter("minDate", minDate);
       q.setParameter("maxDate", maxDate);
       return (List) q.getResultList();
   }
   
   public static List findClientservicesByDataotkl(Date minDate, Date maxDate) {
       EntityManager em = Clientservice.entityManager();
       Query q = em.createQuery("SELECT o.client,count(o.dataotkluchenia) FROM Clientservice AS o WHERE o.dataotkluchenia BETWEEN :minDate AND :maxDate group by o.client.supplier");
       q.setParameter("minDate", minDate);
       q.setParameter("maxDate", maxDate);
       return (List) q.getResultList();
   }
   
   public static List findServicesByDatapodkl(Date minDate, Date maxDate) {
       EntityManager em = Clientservice.entityManager();
       Query q = em.createQuery("SELECT o.service,o.client,o.id FROM Clientservice AS o WHERE o.datapodkluchenia BETWEEN :minDate AND :maxDate group by o.client.supplier,o.service,o.client");
       q.setParameter("minDate", minDate);
       q.setParameter("maxDate", maxDate);
       return (List) q.getResultList();
   }
   
   public static List findServicesByDataotkl(Date minDate, Date maxDate) {
       EntityManager em = Clientservice.entityManager();
       Query q = em.createQuery("SELECT o.service,o.client,o.id FROM Clientservice AS o WHERE o.dataotkluchenia BETWEEN :minDate AND :maxDate group by o.client.supplier,o.service,o.client");
       q.setParameter("minDate", minDate);
       q.setParameter("maxDate", maxDate);
       return (List) q.getResultList();
   }
   
   
   
/**  
   public static Long countbydatapodkl(Date minDate, Date maxDate) {
       EntityManager em = Clientservice.entityManager();
       Query q = em.createQuery("SELECT count(o) FROM Clientservice AS o WHERE o.datapodkluchenia BETWEEN :minDate AND :maxDate");
       q.setParameter("minDate", minDate);
       q.setParameter("maxDate", maxDate);
       return (Long) q.getSingleResult();
   }
   
   public static Long countbydatapotkl(Date minDate, Date maxDate) {
       EntityManager em = Clientservice.entityManager();
       Query q = em.createQuery("SELECT count(o) FROM Clientservice AS o WHERE o.dataotkluchenia BETWEEN :minDate AND :maxDate");
       q.setParameter("minDate", minDate);
       q.setParameter("maxDate", maxDate);
       return (Long) q.getSingleResult();
   }
   **/

}
