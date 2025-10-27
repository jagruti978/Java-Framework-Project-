package com.MyApp.Entity;

import javax.persistence.*;
import java.util.*;

@Entity
@Table(name="lawyers")
public class Lawyer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int lawyerId;

    @Column
    private String name;
    @Column
    private String skill; 
    @Column
    private String phone;
    @Column
    private String city;

    public Lawyer() {}
    public Lawyer(String name, String skill, String phone, String city, lawFirm lawfirms) {
        this.name = name;
        this.skill = skill;
        this.phone = phone;
        this.city = city;
        this.lawfirms = lawfirms;
    }
  
    @ManyToOne
    @JoinColumn(name="firm_id")
    private lawFirm lawfirms;

    @ManyToMany(mappedBy="lawyers")
    private Set<Case> cases = new HashSet<>();
   
    public int getLawyerId() { return lawyerId; }
    public void setLawyerId(int lawyerId) { this.lawyerId = lawyerId; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name;}
    public String getSkill() { return skill; }
    public void setSkill(String skill) {this.skill = skill; }
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone;  }
    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }
    public lawFirm getLawFirm() { return lawfirms; }
    public void setLawFirm(lawFirm lawfirms) { this.lawfirms = lawfirms;}
    public Set<Case> getCases() { return cases; }
    public void setCases(Set<Case> cases) { this.cases = cases; }
}
