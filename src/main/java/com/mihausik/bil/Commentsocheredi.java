package com.mihausik.bil;
import javax.persistence.OneToOne;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findCommentsocheredisByOcherednapodkluchenie" })
public class Commentsocheredi {

    private String comment;

    @OneToOne
    private Manager manager;

    @OneToOne
    private Ocherednapodkluchenie ocherednapodkluchenie;
}
