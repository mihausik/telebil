package com.mihausik.bil;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Commutator {

    /**
     */
    private String comname;

    /**
     */
    private String kolportov;

    /**
     */
    private String description;
}
