// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.petclinic.service;

import com.springsource.petclinic.domain.AbstractPerson;
import com.springsource.petclinic.service.AbstractPersonService;
import java.util.List;

privileged aspect AbstractPersonService_Roo_Service {
    
    public abstract long AbstractPersonService.countAllAbstractpeople();    
    public abstract void AbstractPersonService.deleteAbstractPerson(AbstractPerson abstractPerson);    
    public abstract AbstractPerson AbstractPersonService.findAbstractPerson(Long id);    
    public abstract List<AbstractPerson> AbstractPersonService.findAllAbstractpeople();    
    public abstract List<AbstractPerson> AbstractPersonService.findAbstractPersonEntries(int firstResult, int maxResults);    
    public abstract void AbstractPersonService.saveAbstractPerson(AbstractPerson abstractPerson);    
    public abstract AbstractPerson AbstractPersonService.updateAbstractPerson(AbstractPerson abstractPerson);    
}
