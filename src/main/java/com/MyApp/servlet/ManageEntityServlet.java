
package com.MyApp.servlet;

import com.MyApp.Entity.*;
import com.MyApp.util.HibernateUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.hibernate.Session;
import org.hibernate.Transaction;
import java.io.IOException;
import java.util.List;

@WebServlet("/manageEntity")
public class ManageEntityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    Session session = HibernateUtil.getSessionFactory().openSession();
	    try {List<User> users = session.createQuery("FROM User", User.class).list();
	        List<Case> cases = session.createQuery("FROM Case", Case.class).list();
	         List<lawFirm> lawfirms = session.createQuery("FROM lawFirm", lawFirm.class).list();
	        List<Lawyer> lawyers = session.createQuery("FROM Lawyer", Lawyer.class).list();
	        req.setAttribute("users", users); req.setAttribute("cases", cases);
	        req.setAttribute("lawfirms", lawfirms);req.setAttribute("lawyers", lawyers);
	    } catch (Exception e) {e.printStackTrace();} finally {session.close();}
	    req.getRequestDispatcher("adminDashboard.jsp").forward(req, resp);}
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String entityType = req.getParameter("entityType");
        String action = req.getParameter("action");
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {tx = session.beginTransaction();
            switch (entityType) { case "case": { int caseId = Integer.parseInt(req.getParameter("caseId"));
                    Case c = session.get(Case.class, caseId);
                    c.setStatus(req.getParameter("status"));
                    session.update(c);
                    break;  }
                case "lawfirm": { if ("delete".equals(action)) {
                        int lawfirmId = Integer.parseInt(req.getParameter("firmId"));
                        lawFirm lf = session.get(lawFirm.class, lawfirmId);
                        session.delete(lf);
                    } else {
                        lawFirm lf = new lawFirm();
                        lf.setName(req.getParameter("name"));
                        lf.setSpecialization(req.getParameter("specialization"));
                        lf.setCity(req.getParameter("city"));
                        lf.setContactNumber(req.getParameter("contactNumber"));
                        session.save(lf);
                    }
                    break;
                }
                case "lawyer": {
                    if ("delete".equals(action)) {
                        int lid = Integer.parseInt(req.getParameter("lawyerId"));
                        Lawyer l = session.get(Lawyer.class, lid);
                        session.delete(l);
                    } else {
                        Lawyer l = new Lawyer();
                        l.setName(req.getParameter("name"));
                        l.setSkill(req.getParameter("skill"));
                        l.setPhone(req.getParameter("phone"));
                        l.setCity(req.getParameter("city"));  
                        int firmId = Integer.parseInt(req.getParameter("firmId"));
                        lawFirm lawfirm = session.get(lawFirm.class, firmId);
                        l.setLawFirm(lawfirm); 
                        session.save(l);}
                    break;}
                case "assign": {
                    int caseId = Integer.parseInt(req.getParameter("caseId"));
                    int lawyerId = Integer.parseInt(req.getParameter("lawyerId"));
                    Case c = session.get(Case.class, caseId);
                    Lawyer l = session.get(Lawyer.class, lawyerId);
                    c.getLawyers().add(l);
                    session.update(c);
                    break;  }
            }tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
            req.setAttribute("error", "Error: " + e.getMessage());
        } finally {session.close();  }
   resp.sendRedirect("manageEntity");
    }
}
