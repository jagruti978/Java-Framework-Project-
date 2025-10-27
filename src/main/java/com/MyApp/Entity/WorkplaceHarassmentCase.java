package com.MyApp.Entity;
import javax.persistence.*;
@Entity
@Table(name = "workplace_harassment_cases")
@DiscriminatorValue("WorkplaceHarassment")
public class WorkplaceHarassmentCase extends Case {

    @Column
    private String companyName;

    @Column
    private String harassmentType; 
    
    public WorkplaceHarassmentCase() {} 

    public String getCompanyName() { return companyName; }
    public void setCompanyName(String companyName) { this.companyName = companyName; }

    public String getHarassmentType() { return harassmentType; }
    public void setHarassmentType(String harassmentType) { this.harassmentType = harassmentType; }
}

