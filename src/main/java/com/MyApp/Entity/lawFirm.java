package com.MyApp.Entity;

import javax.persistence.*;
import java.util.Set;
import java.util.HashSet;

@Entity
@Table(name="lawfirms")
public class lawFirm {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int firmId;

    @Column
    private String name;
    @Column
    private String specialization; 
    @Column
    private String city;
    @Column
    private String contactNumber;
    
    public lawFirm() {}

    public lawFirm(String name, String specialization, String city, String contactNumber) {
        this.name = name;
        this.specialization = specialization;
        this.city = city;
        this.contactNumber = contactNumber;
    }

    @OneToMany(mappedBy="lawfirms", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<Lawyer> lawyers = new HashSet<>();
    public int getfirmId() { return firmId; }
    public void setfirmId(int firmId) { this.firmId = firmId; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getSpecialization() { return specialization; }
    public void setSpecialization(String specialization) { this.specialization = specialization; }
    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }
    public String getContactNumber() { return contactNumber; }
    public void setContactNumber(String contactNumber) { this.contactNumber = contactNumber; }
    public Set<Lawyer> getLawyers() { return lawyers; }
    public void setLawyers(Set<Lawyer> lawyers) { this.lawyers = lawyers; }
}
