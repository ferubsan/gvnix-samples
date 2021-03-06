// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.petclinic.domain;

import com.mysema.query.BooleanBuilder;
import com.mysema.query.jpa.impl.JPAQuery;
import com.mysema.query.types.path.PathBuilder;
import com.springsource.petclinic.domain.Visit;
import com.springsource.petclinic.domain.VisitBatchService;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import org.springframework.transaction.annotation.Transactional;

privileged aspect VisitBatchService_Roo_GvNIXJpaBatch {
    
    public Class VisitBatchService.getEntity() {
        return Visit.class;
    }
    
    public EntityManager VisitBatchService.entityManager() {
        return Visit.entityManager();
    }
    
    @Transactional
    public int VisitBatchService.deleteAll() {
        TypedQuery<Visit> query = entityManager().createQuery("Select o FROM Visit o", Visit.class);
        List<Visit> visits = query.getResultList();
        delete(visits);
        return visits.size();
    }
    
    @Transactional
    public int VisitBatchService.deleteIn(List<Long> ids) {
        TypedQuery<Visit> query = entityManager().createQuery("SELECT o FROM Visit o WHERE o.id IN (:idList)", Visit.class);
        query.setParameter("idList", ids);
        List<Visit> visits = query.getResultList();
        delete(visits);
        return visits.size();
    }
    
    @Transactional
    public int VisitBatchService.deleteNotIn(List<Long> ids) {
        TypedQuery<Visit> query = entityManager().createQuery("SELECT o FROM Visit o WHERE o.id NOT IN (:idList)", Visit.class);
        query.setParameter("idList", ids);
        List<Visit> visits = query.getResultList();
        delete(visits);
        return visits.size();
    }
    
    @Transactional
    public void VisitBatchService.create(List<Visit> visits) {
        for( Visit visit : visits) {
            visit.persist();
        }
    }
    
    @Transactional
    public List<Visit> VisitBatchService.update(List<Visit> visits) {
        List<Visit> merged = new ArrayList<Visit>();
        for( Visit visit : visits) {
            merged.add( visit.merge() );
        }
        return merged;
    }
    
    public List<Visit> VisitBatchService.findByValues(Map<String, Object> propertyValues) {
        
        // if there is a filter
        if (propertyValues != null && !propertyValues.isEmpty()) {
            // Prepare a predicate
            BooleanBuilder baseFilterPredicate = new BooleanBuilder();
            
            // Base filter. Using BooleanBuilder, a cascading builder for
            // Predicate expressions
            PathBuilder<Visit> entity = new PathBuilder<Visit>(Visit.class, "entity");
            
            // Build base filter
            for (String key : propertyValues.keySet()) {
                baseFilterPredicate.and(entity.get(key).eq(propertyValues.get(key)));
            }
            
            // Create a query with filter
            JPAQuery query = new JPAQuery(Visit.entityManager());
            query = query.from(entity);
            
            // execute query
            return query.where(baseFilterPredicate).list(entity);
        }
        
        // no filter: return all elements
        return Visit.findAllVisits();
    }
    
    @Transactional
    public long VisitBatchService.deleteByValues(Map<String, Object> propertyValues) {
        List<Visit> visits = findByValues(propertyValues);
        delete(visits);
        return (long)visits.size();
    }
    
    @Transactional
    public void VisitBatchService.delete(List<Visit> visits) {
        for( Visit visit : visits) {
            visit.remove();
        }
    }
    
}
