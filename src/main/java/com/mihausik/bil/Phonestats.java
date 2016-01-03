package com.mihausik.bil;
import java.util.Date;

import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Phonestats {
	
	@OneToOne
	private Clientservice clientservice;
	
	private Float payments;
	
	private Float permonth;
	
	private String month;
	
	private Float atlast;
	
	private Float atfirst;
	
}
