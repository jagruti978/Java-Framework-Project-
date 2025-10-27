package com.MyApp.servlet;
import com.MyApp.Entity.Case;
import com.MyApp.Entity.User;
import com.MyApp.Entity.*;
import com.MyApp.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/registerCase")
public class RegisterCaseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {request.getRequestDispatcher("registerCase.jsp").forward(request, response); }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String description = request.getParameter("description");
        String city = request.getParameter("city");
        String caseType = request.getParameter("caseType");
        HttpSession httpSession = request.getSession(false);
        User user = (User) (httpSession != null ? httpSession.getAttribute("currentUser") : null);

        if (user == null) { request.setAttribute("error", "please log in first.");
            request.getRequestDispatcher("registerCase.jsp").forward(request, response);
            return;
        }
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;

        try {tx = session.beginTransaction();
            Case c;
            switch (caseType) {
                case "DomesticAbuse":
                    DomesticAbuseCase dac = new DomesticAbuseCase();
                    dac.setDescription(description);
                    dac.setCity(city);
                    dac.setUser(user);
                    dac.setStatus("Pending");
                    dac.setAbuserRelation(request.getParameter("abuserRelation"));
                    dac.setChildrenInvolved("true".equals(request.getParameter("childrenInvolved")));
                    c = dac;
                    break;
                case "WorkplaceHarassment":
                	WorkplaceHarassmentCase whc = new WorkplaceHarassmentCase();
                    whc.setDescription(description);
                    whc.setCity(city);
                    whc.setUser(user);
                    whc.setStatus("Pending");
                    whc.setCompanyName(request.getParameter("companyName"));
                    whc.setHarassmentType(request.getParameter("harassmentType"));
                    c = whc;
                    break;
                default:
                    Case gc = new Case();
                    gc.setDescription(description);
                    gc.setCity(city);
                    gc.setUser(user);
                    gc.setStatus("Pending");
                    c = gc;
            }
            session.save(c);
            tx.commit();
            response.sendRedirect("viewCases");
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
            request.setAttribute("error", "Failed to register case: " + e.getMessage());
            request.getRequestDispatcher("registerCase.jsp").forward(request, response);
        } finally {
            session.close();
        }
    }
}
