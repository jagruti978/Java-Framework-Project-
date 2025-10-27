package com.MyApp.Entity;
import javax.persistence.*;
@Entity
@Table(name = "domestic_abuse_cases")
@DiscriminatorValue("DomesticAbuse")
public class DomesticAbuseCase extends Case {

    @Column
    private String abuserRelation; 

    @Column
    private boolean childrenInvolved;
    
    public DomesticAbuseCase() {}

    public String getAbuserRelation() { return abuserRelation; }
    public void setAbuserRelation(String abuserRelation) { this.abuserRelation = abuserRelation; }

    public boolean isChildrenInvolved() { return childrenInvolved; }
    public void setChildrenInvolved(boolean childrenInvolved) { this.childrenInvolved = childrenInvolved; }
}
