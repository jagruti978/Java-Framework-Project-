package com.MyApp.servlet;

import com.MyApp.Entity.Case;
import com.MyApp.Entity.*;
import com.MyApp.Entity.User;
import com.MyApp.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.query.Query;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/searchCase")
public class SearchCaseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException { HttpSession httpSession = request.getSession(false);
        User user = (User) (httpSession != null ? httpSession.getAttribute("currentUser") : null);
        if(user == null){ request.setAttribute("error", "please log in first.");
            request.getRequestDispatcher("searchCases.jsp").forward(request, response);
            return;
        }
        String city = request.getParameter("city");  String caseType = request.getParameter("caseType");
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {String hql = "FROM Case c WHERE c.user = :user";
            if(city != null && !city.isEmpty()) {hql += " AND c.city = :city"; }

            if(caseType != null && !caseType.isEmpty() && !"Other".equals(caseType)) {
                if(caseType.equals("DomesticAbuse")) {hql += " AND TYPE(c) = DomesticAbuseCase"; }
                else if(caseType.equals("WorkplaceHarassment")) {hql += " AND TYPE(c) = WorkplaceHarassmentCase"; }
            }
            Query<Case> query = session.createQuery(hql, Case.class);
            query.setParameter("user", user);
            if(city != null && !city.isEmpty()) query.setParameter("city", city);
            List<Case> cases = query.list();
            request.setAttribute("cases", cases);
            request.getRequestDispatcher("searchCases.jsp").forward(request, response);
        } catch (Exception e) { e.printStackTrace();  request.setAttribute("error", "error searching cases: " + e.getMessage());
            request.getRequestDispatcher("searchCases.jsp").forward(request, response);
        } finally { session.close();}
    }
}
