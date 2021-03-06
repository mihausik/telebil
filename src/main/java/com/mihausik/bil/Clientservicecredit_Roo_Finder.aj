// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mihausik.bil;

import com.mihausik.bil.Clientservice;
import com.mihausik.bil.Clientservicecredit;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect Clientservicecredit_Roo_Finder {
    
    public static Long Clientservicecredit.countFindClientservicecreditsByClientserviceAndDatastartcreditBetween(Clientservice clientservice, String minDatastartcredit, String maxDatastartcredit) {
        if (clientservice == null) throw new IllegalArgumentException("The clientservice argument is required");
        if (minDatastartcredit == null || minDatastartcredit.length() == 0) throw new IllegalArgumentException("The minDatastartcredit argument is required");
        if (maxDatastartcredit == null || maxDatastartcredit.length() == 0) throw new IllegalArgumentException("The maxDatastartcredit argument is required");
        EntityManager em = Clientservicecredit.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM Clientservicecredit AS o WHERE o.clientservice = :clientservice AND o.Datastartcredit BETWEEN :minDatastartcredit AND :maxDatastartcredit", Long.class);
        q.setParameter("clientservice", clientservice);
        q.setParameter("minDatastartcredit", minDatastartcredit);
        q.setParameter("maxDatastartcredit", maxDatastartcredit);
        return ((Long) q.getSingleResult());
    }
    
    public static TypedQuery<Clientservicecredit> Clientservicecredit.findClientservicecreditsByClientserviceAndDatastartcreditBetween(Clientservice clientservice, String minDatastartcredit, String maxDatastartcredit) {
        if (clientservice == null) throw new IllegalArgumentException("The clientservice argument is required");
        if (minDatastartcredit == null || minDatastartcredit.length() == 0) throw new IllegalArgumentException("The minDatastartcredit argument is required");
        if (maxDatastartcredit == null || maxDatastartcredit.length() == 0) throw new IllegalArgumentException("The maxDatastartcredit argument is required");
        EntityManager em = Clientservicecredit.entityManager();
        TypedQuery<Clientservicecredit> q = em.createQuery("SELECT o FROM Clientservicecredit AS o WHERE o.clientservice = :clientservice AND o.Datastartcredit BETWEEN :minDatastartcredit AND :maxDatastartcredit", Clientservicecredit.class);
        q.setParameter("clientservice", clientservice);
        q.setParameter("minDatastartcredit", minDatastartcredit);
        q.setParameter("maxDatastartcredit", maxDatastartcredit);
        return q;
    }
    
    public static TypedQuery<Clientservicecredit> Clientservicecredit.findClientservicecreditsByClientserviceAndDatastartcreditBetween(Clientservice clientservice, String minDatastartcredit, String maxDatastartcredit, String sortFieldName, String sortOrder) {
        if (clientservice == null) throw new IllegalArgumentException("The clientservice argument is required");
        if (minDatastartcredit == null || minDatastartcredit.length() == 0) throw new IllegalArgumentException("The minDatastartcredit argument is required");
        if (maxDatastartcredit == null || maxDatastartcredit.length() == 0) throw new IllegalArgumentException("The maxDatastartcredit argument is required");
        EntityManager em = Clientservicecredit.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM Clientservicecredit AS o WHERE o.clientservice = :clientservice AND o.Datastartcredit BETWEEN :minDatastartcredit AND :maxDatastartcredit");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<Clientservicecredit> q = em.createQuery(queryBuilder.toString(), Clientservicecredit.class);
        q.setParameter("clientservice", clientservice);
        q.setParameter("minDatastartcredit", minDatastartcredit);
        q.setParameter("maxDatastartcredit", maxDatastartcredit);
        return q;
    }
    
}
