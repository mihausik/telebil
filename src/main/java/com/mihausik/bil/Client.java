package com.mihausik.bil;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Query;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.TypedQuery;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = {  "findClientsByClientnameLike" })
public class Client {

    public static List<Client> findAllClients() {
        return entityManager().createQuery("SELECT o FROM Client o order by o.clientname ", Client.class).getResultList();
    }
    
    public static Object[] getSumBalanceclient() {
       
       return entityManager().createQuery("select c.id,c.clientname,ROUND(sum(cs.balance),2) from Clientservice cs,Client c where"
      + " cs.client = c.id   group by cs.client order by c.clientname asc",Client.class).getResultList().toArray();
        
        }
    
   
    	
    	
    public static List<Client> findClientEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Client o where o.arkhiv='null' or o.arkhiv IS NULL order by o.clientname ", Client.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }

    private String clientname;

   

    private String numberraschscheta;

    private String bank;

    private String mfo;

    private String yuredrpou;

    private String yurnumbersvidplatnds;

    private String yurindividnagkod;

    @ManyToOne
    private Manager manager;

    @OneToOne
    private Statuslica statuslica;

    @OneToOne
    private Supplier supplier;

    @OneToOne
    private Yurstatus yurstatus;

    private String yurcity;

    private String yurpostindex;

    private String yurhousenum;

    private String yurofficenum;

    private String fizcity;

    private String fizpostindex;

    private String fizhousenum;

    private String fizofficenum;

    private String fizedrpou;

    private String fiznumbersvidplatnds;

    /**
     */
    private String fizindividnagkod;

    private String fizclientname;

    
    
    private String fiodirector;

    
    private String yurstreet;

    private String fizstreet;

    public static TypedQuery<Client> findClientsByAll(String parameter) {
        if (parameter == null || parameter.length() == 0) throw new IllegalArgumentException("The parameter argument is required");
        parameter = parameter.replace('*', '%');
        if (parameter.charAt(0) != '%') {
            parameter = "%" + parameter;
        }
        if (parameter.charAt(parameter.length() - 1) != '%') {
            parameter = parameter + "%";
        }
        EntityManager em = Client.entityManager();
        TypedQuery<Client> q = em.createQuery("SELECT distinct o FROM Client AS o,Clientservice As cs WHERE LOWER(o.clientname) LIKE LOWER(:parameter) " 
        + "or LOWER(o.numberraschscheta) LIKE LOWER(:parameter) or LOWER(o.bank) LIKE LOWER(:parameter) or LOWER(o.mfo) LIKE LOWER(:parameter) "
    	+ "or LOWER(o.yuredrpou) LIKE LOWER(:parameter) or LOWER(o.yurnumbersvidplatnds) LIKE LOWER(:parameter) or LOWER(o.yurindividnagkod) LIKE LOWER(:parameter) "
        + "or LOWER(o.yurcity) LIKE LOWER(:parameter) or LOWER(o.yurpostindex) LIKE LOWER(:parameter) or LOWER(o.yurhousenum) LIKE LOWER(:parameter) " 
    	+ "or LOWER(o.yurofficenum) LIKE LOWER(:parameter) or LOWER(o.fizcity) LIKE LOWER(:parameter) or LOWER(o.fizpostindex) LIKE LOWER(:parameter) " 
        + "or LOWER(o.fizhousenum) LIKE LOWER(:parameter) or LOWER(o.fizofficenum) LIKE LOWER(:parameter) or LOWER(o.fizedrpou) LIKE LOWER(:parameter) "
    	+ "or LOWER(o.fiznumbersvidplatnds) LIKE LOWER(:parameter) or LOWER(o.fizindividnagkod) LIKE LOWER(:parameter) or LOWER(o.fizclientname) LIKE LOWER(:parameter) " 
        + "or LOWER(o.fiodirector) LIKE LOWER(:parameter) or LOWER(o.yurstreet) LIKE LOWER(:parameter) or LOWER(o.fizstreet) LIKE LOWER(:parameter) "
        + "or Lower(cs.addresspreduslugi) like lower(:parameter) and cs.client=o.id", Client.class);
        q.setParameter("parameter", parameter);
        return q;
    }

   
    private String clientweblogin;
    
    private String clientwebpass;
    
    private Boolean clientwebenable;
    
    private Float balancesumarniy;
    
    private Boolean arkhiv;
    
    @Value("ROLE_ADMIN")
    private String authority;
    
    public static TypedQuery<Client> findClientsBySupplier(Supplier supplier) {
        if (supplier == null) throw new IllegalArgumentException("The supplier argument is required");
        EntityManager em = Client.entityManager();
        TypedQuery<Client> q = em.createQuery("SELECT o FROM Client AS o WHERE o.supplier = :supplier and o.arkhiv='null' or o.supplier = :supplier and o.arkhiv IS NULL order by o.clientname", Client.class);
        q.setParameter("supplier", supplier);
        return q;
    }
    
    public static TypedQuery<Client> findClientsByService(Service service) {
        if (service == null) throw new IllegalArgumentException("The service argument is required");
        EntityManager em = Client.entityManager();
        TypedQuery<Client> q = em.createQuery("SELECT distinct c FROM Client AS c,Clientservice as cs,Service as s WHERE "
        		+ "cs.service = :service and cs.client=c.id order by c.clientname", Client.class);
        q.setParameter("service", service);
        return q;
    }
    
    public static TypedQuery<Client> findClientsByIP(String parameter) {
        if (parameter == null || parameter.length() == 0) throw new IllegalArgumentException("The parameter argument is required");
        parameter = parameter.replace('*', '%');
        if (parameter.charAt(0) != '%') {
            parameter = "%" + parameter;
        }
        if (parameter.charAt(parameter.length() - 1) != '%') {
            parameter = parameter + "%";
        }
        EntityManager em = Client.entityManager();
        TypedQuery<Client> q = em.createQuery("SELECT distinct c FROM Client AS c,Clientservice As cs,Clientserviceip As csip WHERE "
        		+ " csip.ip like :parameter and cs.id=csip.clientservice and cs.client=c.id", Client.class);
        q.setParameter("parameter", parameter);
        return q;
    }
    
    public static TypedQuery<Client> findClientsByDog(String parameter) {
        if (parameter == null || parameter.length() == 0) throw new IllegalArgumentException("The parameter argument is required");
        parameter = parameter.replace('*', '%');
        if (parameter.charAt(0) != '%') {
            parameter = "%" + parameter;
        }
        if (parameter.charAt(parameter.length() - 1) != '%') {
            parameter = parameter + "%";
        }
        EntityManager em = Client.entityManager();
        TypedQuery<Client> q = em.createQuery("SELECT distinct c FROM Client AS c,Clientnumdog As csnd WHERE "
        		+ " csnd.nomerdogovora like :parameter and c.id=csnd.client", Client.class);
        q.setParameter("parameter", parameter);
        return q;
    }
    /*
    public static TypedQuery<Client> findClientsBySupplier(Supplier supplier,int firstResult, int maxResults) {
    	if (supplier == null) throw new IllegalArgumentException("The supplier argument is required");
        EntityManager em = Client.entityManager();
        TypedQuery<Client> q = em.createQuery("SELECT o FROM Client AS o WHERE o.supplier = :supplier order by o.clientname", Client.class).setFirstResult(firstResult).setMaxResults(maxResults);
        q.setParameter("supplier", supplier);
        return q;
    }*/

    public static List<Client> findAllArhivClients() {
        return entityManager().createQuery("SELECT o FROM Client o where o.arkhiv='1' ", Client.class).getResultList();
    }

    
}
