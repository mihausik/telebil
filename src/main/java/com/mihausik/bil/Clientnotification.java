package com.mihausik.bil;

import javax.persistence.EntityManager;
import javax.persistence.Enumerated;
import javax.persistence.OneToOne;
import javax.persistence.TypedQuery;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Clientnotification {
	
	@Enumerated
	private Notiftype notiftype;
	
	private String contact;
		
	private String notificationsum; 

	@OneToOne
	private Client client;
	
	@OneToOne
	private Clientservice clientservice;
	
	 public static TypedQuery<Clientnotification> findnotifByClient(Client client) {
	        EntityManager em = Clientdata.entityManager();
	        TypedQuery<Clientnotification> q = em.createQuery("SELECT o FROM Clientnotification AS o WHERE o.client = :client", Clientnotification.class);
	        q.setParameter("client", client);
	        return q;
	    }
}
