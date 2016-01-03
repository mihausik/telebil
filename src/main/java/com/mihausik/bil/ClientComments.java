package com.mihausik.bil;

import javax.persistence.EntityManager;
import javax.persistence.OneToOne;
import javax.persistence.TypedQuery;
import javax.validation.constraints.NotNull;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class ClientComments {
	
	private String comment;
	
	@OneToOne
	@NotNull
	private Client client;
	
	  public static TypedQuery<ClientComments> findcommentsByClient(Client client) {
	        if (client == null) throw new IllegalArgumentException("The client argument is required");
	        EntityManager em = ClientComments.entityManager();
	        TypedQuery<ClientComments> q = em.createQuery("SELECT o FROM ClientComments AS o WHERE o.client = :client", ClientComments.class);
	        q.setParameter("client", client);
	        return q;
	    }

}
