package com.mihausik.bil;
import javax.persistence.OneToOne;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Rate {
	private Double buy; 
	
	private String name;
	
	private String prefix;
	
	private Double sell;
	
	private String trunk;
		
	@OneToOne
    private Callplan callplan;
	
	private Integer cutdigits;
	
	private Integer minduration;
	
}
