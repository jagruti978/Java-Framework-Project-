<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.MyApp.Entity.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Cases</title>
    <style>
        body { font-family: Arial; background:#f2f2f2; padding:20px; }
        table { width:100%; border-collapse: collapse; margin-top:20px; }
        th, td { border:1px solid #ccc; padding:8px; text-align:left; }
        th { background:#b37474; color:#fff; }
        tr:nth-child(even) { background:#f9f9f9; }
        a { text-decoration:none; color:#b37474; }
    </style>
</head>
<body><h2>My Registered Cases</h2>

    <% if(request.getAttribute("error") != null) { %>
        <p style="color:red;"><%= request.getAttribute("error") %></p>
    <% } %>
    <%
        List<Case> cases = (List<Case>) request.getAttribute("cases");
        if (cases == null || cases.isEmpty()) {
    %>
        <p>No cases registered yet.</p>
    <% } else { %>
        <table>
            <tr><th>Case ID</th> <th>Type</th>
                <th>Description</th>
                <th>City</th>
                <th>Status</th>
                <th>Created At</th>
                <th>Details</th>
            </tr>
            <%for(Case c : cases) {  String type = c.getClass().getSimpleName(); %>
            <tr> <td><%= c.getCaseId() %></td>
                <td><%= type %></td>
                <td><%= c.getDescription() %></td>
                <td><%= c.getCity() %></td>
                <td><%= c.getStatus() %></td>
                <td><%= c.getCreatedAt() %></td>
                <td><a href="caseDetails.jsp?caseId=<%= c.getCaseId() %>">View</a></td>
            </tr>
            <% } %>
        </table>
    <% } %>
    <p><a href="userDashboard.jsp">Back to User Panel</a></p>
</body>
</html>
