package com.mihausik.bil;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import javax.persistence.Column;
import javax.persistence.OneToOne;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Phone {

	
	public static List<Phone> findAllPhonesinuse() {
        return entityManager().createQuery("SELECT o FROM Phone o where o.inuse !='1'", Phone.class).getResultList();
    }
    /**
     */
    @Column(unique = true)
    private Integer phonenumber;
    
    /**
     */
    @Value("false")
    private Boolean inuse;
    
    }
