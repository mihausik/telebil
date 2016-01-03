package com.mihausik.bil;
import javax.persistence.OneToOne;
import javax.validation.constraints.AssertFalse;
import javax.validation.constraints.NotNull;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import java.util.Date;
import java.util.List;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.beans.factory.annotation.Value;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Ocherednapodkluchenie {

    @OneToOne
    private Client client;

    @OneToOne
    private Manager manager;

    @NotNull
    @OneToOne
    private Clientservice clientservice;

    @NotNull
    @OneToOne
    private Supplier supplier;
    
    private Boolean arhiv;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    private Date datapodkluchenia;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    private Date deadlinedate;

    public static List<Ocherednapodkluchenie> findAllArhivOcherednapodkluchenies() {
        return entityManager().createQuery("SELECT o FROM Ocherednapodkluchenie o where o.arhiv='1' order by o.datapodkluchenia desc", Ocherednapodkluchenie.class).getResultList();
    }

    public static List<Ocherednapodkluchenie> findAllOcherednapodkluchenies() {
        return entityManager().createQuery("SELECT o FROM Ocherednapodkluchenie o where o.arhiv='null' or o.arhiv IS NULL  order by o.datapodkluchenia desc", Ocherednapodkluchenie.class).getResultList();
    }

    public static List<Ocherednapodkluchenie> findOcherednapodkluchenieEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Ocherednapodkluchenie o where o.arhiv='null' or o.arhiv IS NULL   order by o.datapodkluchenia desc", Ocherednapodkluchenie.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }

    
    
}
