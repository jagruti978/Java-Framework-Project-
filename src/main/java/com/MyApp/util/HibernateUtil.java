package com.MyApp.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.MyApp.Entity.*;

public class HibernateUtil {
    private static final SessionFactory sessionFactory;
    static {
        try {
            sessionFactory = new Configuration()
                    .configure("hibernate.cfg.xml")
                    .addAnnotatedClass(User.class)
                    .addAnnotatedClass(Case.class)
                    .addAnnotatedClass(lawFirm.class)
                    .addAnnotatedClass(Lawyer.class)
                    .buildSessionFactory(); } catch (Throwable ex) {
            System.err.println("Initial SessionFactory creation failed: " + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }
    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    public static void shutdown() {
        getSessionFactory().close();
    }
}