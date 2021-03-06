// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mihausik.bil;

import com.mihausik.bil.Client;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect Client_Roo_Finder {
    
    public static Long Client.countFindClientsByClientnameLike(String clientname) {
        if (clientname == null || clientname.length() == 0) throw new IllegalArgumentException("The clientname argument is required");
        clientname = clientname.replace('*', '%');
        if (clientname.charAt(0) != '%') {
            clientname = "%" + clientname;
        }
        if (clientname.charAt(clientname.length() - 1) != '%') {
            clientname = clientname + "%";
        }
        EntityManager em = Client.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM Client AS o WHERE LOWER(o.clientname) LIKE LOWER(:clientname)", Long.class);
        q.setParameter("clientname", clientname);
        return ((Long) q.getSingleResult());
    }
    
    public static TypedQuery<Client> Client.findClientsByClientnameLike(String clientname) {
        if (clientname == null || clientname.length() == 0) throw new IllegalArgumentException("The clientname argument is required");
        clientname = clientname.replace('*', '%');
        if (clientname.charAt(0) != '%') {
            clientname = "%" + clientname;
        }
        if (clientname.charAt(clientname.length() - 1) != '%') {
            clientname = clientname + "%";
        }
        EntityManager em = Client.entityManager();
        TypedQuery<Client> q = em.createQuery("SELECT o FROM Client AS o WHERE LOWER(o.clientname) LIKE LOWER(:clientname)", Client.class);
        q.setParameter("clientname", clientname);
        return q;
    }
    
    public static TypedQuery<Client> Client.findClientsByClientnameLike(String clientname, String sortFieldName, String sortOrder) {
        if (clientname == null || clientname.length() == 0) throw new IllegalArgumentException("The clientname argument is required");
        clientname = clientname.replace('*', '%');
        if (clientname.charAt(0) != '%') {
            clientname = "%" + clientname;
        }
        if (clientname.charAt(clientname.length() - 1) != '%') {
            clientname = clientname + "%";
        }
        EntityManager em = Client.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM Client AS o WHERE LOWER(o.clientname) LIKE LOWER(:clientname)");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<Client> q = em.createQuery(queryBuilder.toString(), Client.class);
        q.setParameter("clientname", clientname);
        return q;
    }
    
}
