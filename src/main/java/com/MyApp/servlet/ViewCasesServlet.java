package com.MyApp.servlet;

import com.MyApp.Entity.Case;
import com.MyApp.Entity.User;
import com.MyApp.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.query.Query;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/viewCases")
public class ViewCasesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession httpSession = request.getSession(false);
        User user = (User) (httpSession != null ? httpSession.getAttribute("currentUser") : null);
        if (user == null) { request.setAttribute("error", "Please log in first.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        Session session = HibernateUtil.getSessionFactory().openSession();
        try { String hql = "FROM Case c WHERE c.user.userId = :userId ORDER BY c.createdAt DESC";
            Query<Case> query = session.createQuery(hql, Case.class);
            query.setParameter("userId", user.getUserId());
            List<Case> cases = query.getResultList();
            request.setAttribute("cases", cases);
            request.getRequestDispatcher("viewCases.jsp").forward(request, response);
        } catch (Exception e) {  e.printStackTrace();
            request.setAttribute("error", "failed to fetch cases: " + e.getMessage());
            request.getRequestDispatcher("userDashboard.jsp").forward(request, response);
        } finally { session.close();}
    }
}
