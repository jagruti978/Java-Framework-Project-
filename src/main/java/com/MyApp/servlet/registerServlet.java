package com.MyApp.servlet;

import com.MyApp.Entity.User;
import com.MyApp.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/register")
public class registerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {request.getRequestDispatcher("signup.jsp").forward(request, response); }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role"); 
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;

        try { tx = session.beginTransaction();
            User user = new User(username, password, role);
            session.save(user);
            tx.commit();
            response.sendRedirect("login.jsp?registered=true");
        } catch (Exception e) {if (tx != null) tx.rollback(); e.printStackTrace(); response.sendRedirect("signup.jsp?error=true");
        } finally {session.close(); }
    }
} 
