package com.mihausik.bil;
import javax.persistence.OneToOne;
import javax.persistence.Transient;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Schet {
	
	 @OneToOne
	    private Client client;
	 
	 @Transient
	    private byte[] schet;
	 
	   private String contentType;
	   
	   private Long filesize ;
		
	   private String filepath;
	   
	   private  String filename; 
		
}
