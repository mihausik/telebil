package com.mihausik.bil;

import java.math.BigDecimal;

import javax.persistence.OneToOne;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class ClientAdditionalService {
	
	private BigDecimal balance;
	@OneToOne
	private Service service;
	@OneToOne
	private Clientservice clientservice;
	
	public Clientservice getClientService(){
		return clientservice;
	}
	
	public void setClientService(Clientservice clientservice){
		this.clientservice=clientservice;
	}
	
	public BigDecimal getBalance(){
		return balance;
	}
	
	public Service getService(){
		return service;
	}
}
