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
@RooJpaActiveRecord(finders = { "findCommentszayavoksByProverkatahvozm" })
public class Commentszayavok {

    private String comment;

    @OneToOne
    private Manager manager;

    @OneToOne
    private Proverkatahvozm proverkatahvozm;
    
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    private Date datacommenta;
  
}
