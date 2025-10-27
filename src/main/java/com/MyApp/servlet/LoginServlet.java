package com.MyApp.servlet;
import com.MyApp.Entity.User;
import com.MyApp.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        handleLogin(request, response); }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException { handleLogin(request, response); }
    
    private void handleLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        User user = null;
        try {tx = session.beginTransaction(); Query<User> query = session.createQuery(
        		"FROM User WHERE username = :username AND password = :password",
                    User.class);
            query.setParameter("username", username); query.setParameter("password", password);
            user = query.uniqueResult();
            tx.commit();
        } catch (Exception e) {  if (tx != null) tx.rollback(); e.printStackTrace(); } finally {
            session.close();
        }
        if (user != null) { HttpSession httpSession = request.getSession();
            httpSession.setAttribute("currentUser", user);
            httpSession.setAttribute("userId", user.getUserId()); 
            if ("ADMIN".equalsIgnoreCase(user.getRole())) { response.sendRedirect(request.getContextPath() + "/adminDashboard.jsp");
            } else {response.sendRedirect(request.getContextPath() + "/userDashboard.jsp");
            }
        } else {response.sendRedirect("login.jsp?error=true"); }
    }
}
