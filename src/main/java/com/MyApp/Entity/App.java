package com.MyApp.Entity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
public class App {
    public static void main(String[] args) {
        Configuration cfg = new Configuration();
        cfg.configure("hibernate.cfg.xml"); 
        SessionFactory factory = cfg.buildSessionFactory();
        Session session = factory.openSession();
        session.close();
        factory.close();
        System.out.println("Tables created successfully in womens_safety_db");
    }
}