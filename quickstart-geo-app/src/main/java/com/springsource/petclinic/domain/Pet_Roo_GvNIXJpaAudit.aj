// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.petclinic.domain;

import com.springsource.petclinic.domain.Pet;
import java.util.Calendar;
import org.springframework.format.annotation.DateTimeFormat;

privileged aspect Pet_Roo_GvNIXJpaAudit {
    
    @DateTimeFormat(style = "MM")
    private Calendar Pet.auditCreation;
    
    private String Pet.auditCreatedBy;
    
    @DateTimeFormat(style = "MM")
    private Calendar Pet.auditLastUpdate;
    
    private String Pet.auditLastUpdatedBy;
    
    public Calendar Pet.getAuditCreation() {
        return this.auditCreation;
    }
    
    public void Pet.setAuditCreation(Calendar auditCreation) {
        this.auditCreation = auditCreation;
    }
    
    public String Pet.getAuditCreatedBy() {
        return this.auditCreatedBy;
    }
    
    public void Pet.setAuditCreatedBy(String auditCreatedBy) {
        this.auditCreatedBy = auditCreatedBy;
    }
    
    public Calendar Pet.getAuditLastUpdate() {
        return this.auditLastUpdate;
    }
    
    public void Pet.setAuditLastUpdate(Calendar auditLastUpdate) {
        this.auditLastUpdate = auditLastUpdate;
    }
    
    public String Pet.getAuditLastUpdatedBy() {
        return this.auditLastUpdatedBy;
    }
    
    public void Pet.setAuditLastUpdatedBy(String auditLastUpdatedBy) {
        this.auditLastUpdatedBy = auditLastUpdatedBy;
    }
    
}
