package com.mihausik.bil;
import javax.persistence.Enumerated;
import javax.persistence.ManyToOne;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Wish {
	
	private String wishname;
	
	 @ManyToOne
	 private Manager manager;
	 
	 @Enumerated
	 private Result resultat;
	 
	 @Enumerated
	 private Priority prioritet;
}
