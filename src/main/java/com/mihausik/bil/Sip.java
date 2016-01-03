package com.mihausik.bil;
import javax.persistence.EntityManager;
import javax.persistence.OneToOne;
import javax.persistence.TypedQuery;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Sip {
	private String callerid;
	private String callgroup;
	private String context; 
	private String defaultuser;
	private String deny ;
	private String dtmfmode;
	private String fullcontact;
	private String host 	;
	private String insecure;
	private String ipaddr 	;
	private String lastms 	;
	private String name 	;
	private String nat 	;
	private String permit 	;
	private String pickupgroup;
	private String port 	;
	private String qualify ;
	private String regseconds;
	private String regserver;
	private String secret 	;
	private String trunk 	;
	private String type 	;
	private String useragent;
	private String username ;
	private String callbackextension;
	private String accountcode;
	
	@OneToOne
	private Clientservice clientservice;
	
	public static TypedQuery<Sip> findSipsByClientservice(Clientservice clientservice) {
        EntityManager em = Payment.entityManager();
        TypedQuery<Sip> q = em.createQuery("SELECT o FROM Sip AS o WHERE o.clientservice = :clientservice", Sip.class);
        q.setParameter("clientservice", clientservice);
        return q;
    }
}
