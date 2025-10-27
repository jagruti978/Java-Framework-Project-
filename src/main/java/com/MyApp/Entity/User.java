package com.MyApp.Entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int userId;
    @Column
    private String username;
    @Column
    private String password;
    @Column
    private String role; 
    
    public User() { }
    public User(String username, String password, String role) {
        this.username = username;
        this.password = password;
        this.role = role;
    }

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private List<Case> cases;

    public int getUserId() { return userId;}
    public void setUserId(int userId) { this.userId = userId; }
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username;  }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public String getRole() { return role; }
    public void setRole(String role) { this.role = role;}
    public List<Case> getCases() { return cases; }
    public void setCases(List<Case> cases) { this.cases = cases;}
}
