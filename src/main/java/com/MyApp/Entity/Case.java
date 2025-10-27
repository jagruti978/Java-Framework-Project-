package com.MyApp.Entity;

import javax.persistence.*;
import java.util.*;

@Entity
@Table(name="cases")
@Inheritance(strategy = InheritanceType.JOINED) 
@DiscriminatorColumn(name = "case_type", discriminatorType = DiscriminatorType.STRING)
public class Case {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int caseId;
    
    @ManyToOne
    @JoinColumn(name="user_id")
    private User user;
    @Column(columnDefinition="TEXT")
    private String description;
    @Column
    private String city;
    @Column
    private String status = "Open"; 
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdAt = new Date();
    
    public Case() {}

    public Case(User user, String caseType, String description, String city, String status) {
        this.user = user;
        this.description = description;
        this.city = city;
        this.status = status;
        this.createdAt = new Date();
    }
    
    @ManyToMany
    @JoinTable(
        name="case_lawyers",
        joinColumns = @JoinColumn(name="case_id"),
        inverseJoinColumns = @JoinColumn(name="lawyer_id")
    )
    private Set<Lawyer> lawyers = new HashSet<>();

    public int getCaseId() { return caseId; }
    public void setCaseId(int caseId) { this.caseId = caseId; }
    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }
    public Set<Lawyer> getLawyers() { return lawyers; }
    public void setLawyers(Set<Lawyer> lawyers) { this.lawyers = lawyers; }
}