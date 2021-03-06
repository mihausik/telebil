// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mihausik.bil;

import com.mihausik.bil.Commentsocheredi;
import com.mihausik.bil.Ocherednapodkluchenie;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect Commentsocheredi_Roo_Finder {
    
    public static Long Commentsocheredi.countFindCommentsocheredisByOcherednapodkluchenie(Ocherednapodkluchenie ocherednapodkluchenie) {
        if (ocherednapodkluchenie == null) throw new IllegalArgumentException("The ocherednapodkluchenie argument is required");
        EntityManager em = Commentsocheredi.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM Commentsocheredi AS o WHERE o.ocherednapodkluchenie = :ocherednapodkluchenie", Long.class);
        q.setParameter("ocherednapodkluchenie", ocherednapodkluchenie);
        return ((Long) q.getSingleResult());
    }
    
    public static TypedQuery<Commentsocheredi> Commentsocheredi.findCommentsocheredisByOcherednapodkluchenie(Ocherednapodkluchenie ocherednapodkluchenie) {
        if (ocherednapodkluchenie == null) throw new IllegalArgumentException("The ocherednapodkluchenie argument is required");
        EntityManager em = Commentsocheredi.entityManager();
        TypedQuery<Commentsocheredi> q = em.createQuery("SELECT o FROM Commentsocheredi AS o WHERE o.ocherednapodkluchenie = :ocherednapodkluchenie", Commentsocheredi.class);
        q.setParameter("ocherednapodkluchenie", ocherednapodkluchenie);
        return q;
    }
    
    public static TypedQuery<Commentsocheredi> Commentsocheredi.findCommentsocheredisByOcherednapodkluchenie(Ocherednapodkluchenie ocherednapodkluchenie, String sortFieldName, String sortOrder) {
        if (ocherednapodkluchenie == null) throw new IllegalArgumentException("The ocherednapodkluchenie argument is required");
        EntityManager em = Commentsocheredi.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM Commentsocheredi AS o WHERE o.ocherednapodkluchenie = :ocherednapodkluchenie");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<Commentsocheredi> q = em.createQuery(queryBuilder.toString(), Commentsocheredi.class);
        q.setParameter("ocherednapodkluchenie", ocherednapodkluchenie);
        return q;
    }
    
}
