<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.hibernate.*, org.hibernate.cfg.*, java.util.*" %>

<%// hibernate Session
    SessionFactory factory = new Configuration().configure().buildSessionFactory();
    Session session1 = factory.openSession();
    Long userCount = (Long) session1.createQuery("select count(u.id) from User u").uniqueResult();
    Long firmCount = (Long) session1.createQuery("select count(f.id) from lawFirm f").uniqueResult();
    Long lawyerCount = (Long) session1.createQuery("select count(l.id) from Lawyer l").uniqueResult();
    Long caseCount = (Long) session1.createQuery("select count(c.id) from Case c").uniqueResult();
    session1.close();
    factory.close();%>
<!DOCTYPE html>
<html>
<head> <title>Report Statistics</title>
    <style>body { font-family: Arial; background-color: #f2f2f2; }
        .container { width: 80%; margin: auto; padding: 20px; }
        .card { background: white; padding: 20px; margin: 15px 0; border-radius: 10px;   }
        h2 { color: #b37474; }
    </style></head>
<body><div class="container">
        <h1>Report Statistics</h1>
        <div class="card"> <h2>Total Users: <%= userCount %></h2>  </div>
        <div class="card"><h2>Total Firms: <%= firmCount %></h2></div>
        <div class="card"><h2>Total Lawyers: <%= lawyerCount %></h2></div>
        <div class="card"> <h2>Total Cases: <%= caseCount %></h2></div>
        <a href="adminDashboard.jsp">⬅ Back to Dashboard</a>
    </div>
</body></html>
