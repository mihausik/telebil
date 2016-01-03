package com.mihausik.bil;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.OneToOne;
import javax.persistence.Query;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Clientservicestreet {
	
	@OneToOne
	private Citystreets citystreets;
	
	@OneToOne
	private Clientservice clientservice;
	
	private String housenum;
	
	private String city;
	
	private String appartment;
	
	public static List findStreetByClientservice(Clientservice clientservice) {
	       EntityManager em = Clientservice.entityManager();
	       Query q = em.createQuery("SELECT o FROM Clientservicestreet AS o WHERE o.clientservice = :clientservice");
	       q.setParameter("clientservice", clientservice);
	       return (List) q.getResultList();
	   }
}
