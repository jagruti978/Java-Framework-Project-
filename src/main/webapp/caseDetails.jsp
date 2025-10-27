<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.MyApp.Entity.*, org.hibernate.Session, com.MyApp.util.HibernateUtil" %>
<%@ page import="java.util.*" %>
<%
    String caseIdStr = request.getParameter("caseId");
    if(caseIdStr == null) {
        response.sendRedirect("viewCases");
        return;
    }
    int caseId = Integer.parseInt(caseIdStr);
    Session s = HibernateUtil.getSessionFactory().openSession();
    Case c = null;

    try {  c = s.get(Case.class, caseId);
        if(c == null) { request.setAttribute("error", "Case not found.");
            response.sendRedirect("viewCases");
            return;
        }
    } finally {
        s.close();
    }
    String type = c.getClass().getSimpleName();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Case Details</title>
    <style>
        body { font-family: Arial; background:#f2f2f2; padding:20px; }
        .details { background:#fff; padding:20px; border-radius:5px; width:600px; margin:auto; }
        h2 { color:#b37474; }
        p { margin:8px 0; }
        a { text-decoration:none; color:#b37474; }
    </style>
</head>
<body>
    <div class="details">
        <h2>Case Details</h2>
        <p><strong>Case ID:</strong> <%= c.getCaseId() %></p>
        <p><strong>Type:</strong> <%= type %></p>
        <p><strong>Description:</strong> <%= c.getDescription() %></p>
        <p><strong>City:</strong> <%= c.getCity() %></p>
        <p><strong>Status:</strong> <%= c.getStatus() %></p>
        <p><strong>Created At:</strong> <%= c.getCreatedAt() %></p>

        <%
            if(c instanceof DomesticAbuseCase) {
                DomesticAbuseCase dac = (DomesticAbuseCase) c;
        %>
            <h3>Domestic Abuse Details</h3>
            <p><strong>Abuser Relation:</strong> <%= dac.getAbuserRelation() %></p>
            <p><strong>Children Involved:</strong> <%= dac.isChildrenInvolved() ? "Yes" : "No" %></p>
        <%
            } else if(c instanceof WorkplaceHarassmentCase) {
                WorkplaceHarassmentCase whc = (WorkplaceHarassmentCase) c;
        %>
            <h3>Workplace Harassment Details</h3>
            <p><strong>Company Name:</strong> <%= whc.getCompanyName() %></p>
            <p><strong>Harassment Type:</strong> <%= whc.getHarassmentType() %></p>
        <%
            }
        %>

        <p><a href="viewCases">← Back to My Cases</a></p>
    </div>
</body>
</html>
