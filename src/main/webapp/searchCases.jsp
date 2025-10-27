<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Cases</title>
 <style>
    body { font-family: Arial; margin: 15px; }  h2 { margin-bottom: 10px; font-size: 18px; }
    form { margin-bottom: 15px; }  label, input, select, button { margin: 3px; font-size:  13px; }
    button { padding: 3px 8px; background: #b37474; color: #fff; border: none; cursor: pointer; }
    button:hover { background: #9f5f5f; }  table { border-collapse: collapse; width:  100%; font-size: 13px; }
    th, td { border: 1px solid #ccc; padding: 5px; } th { background: #eee;}
    tr:nth-child(even) { background:  #f9f9f9; } tr:hover { background: #f1f1f1; }
    p { margin-top: 10px; font-size: 13px; } p[style*="color:red"] { color: red; font-weight: bold; }
</style>
</head>
<body> <h2>Search Your Cases : to see it's status</h2>
    <form action="searchCase" method="post">
        <label>City:</label> <input type="text" name="city"/>
        <label>Case Type:</label> <select name="caseType">
            <option value="">-- All --</option>
            <option value="DomesticAbuse">Domestic Abuse</option>
            <option value="WorkplaceHarassment">Workplace Harassment</option>
            <option value="Other">Other</option>
        </select><button type="submit">Search</button>
    </form>
    <% if (request.getAttribute("cases") != null) { 
           java.util.List<com.MyApp.Entity.Case> cases = 
               (java.util.List<com.MyApp.Entity.Case>) request.getAttribute("cases");
           if(!cases.isEmpty()) { %>
        <table>
            <tr><th>Case ID</th><th>City</th>
                <th>Type</th><th>Description</th> <th>Status</th>
            </tr>
            <% for(com.MyApp.Entity.Case c : cases) { %>
            <tr><td><%= c.getCaseId() %></td>   <td><%= c.getCity() %></td> <td><%= c.getClass().getSimpleName() %></td>
                <td><%= c.getDescription() %></td> <td><%= c.getStatus() %></td>
            </tr>
            <% } %>
        </table>
    <% } else { %>
        <p>No cases found matching your criteria.</p>
    <% } } %>
    <% if (request.getAttribute("error") != null) { %>
        <p style="color:red;"><%= request.getAttribute("error") %></p>
    <% } %>
    <p><a href="userDashboard.jsp">Back to User Panel</a></p>
</body>
</html>
