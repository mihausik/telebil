package com.mihausik.bil;
import javax.persistence.ManyToOne;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Device {
	
	private String devname;
	
	private String serialnum;
	
	@ManyToOne
	private Devicetype devtype;
	
	private Float  price;
	
	
}
