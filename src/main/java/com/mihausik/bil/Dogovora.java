package com.mihausik.bil;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import java.util.Date;

import javax.persistence.Enumerated;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Dogovora {

    private String nomerdogovora;
    
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date datadogovora;
    
    private String contragent;
    
    private String nazvaniedog;
    
    private String soderjaniedogovora;
    
    private String predmetdogovora;
    
    private String promechaniya;
    
    private String otvetstvennuychel;
    
    @Enumerated
    private  Viddogovora viddogovora;
    
    @OneToOne
    private Supplier supplier;
		

}