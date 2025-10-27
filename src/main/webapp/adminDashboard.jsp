<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.MyApp.Entity.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<style>
   body{font-family:Arial;margin:20px;}
 .tabs {overflow:hidden;border-bottom:2px solid #b37474;margin-bottom:10px;}
.tabs button{background:#eee;border:none;padding:10px;cursor:pointer;float:left;margin-right:3px;}
 .tabs button.active{background:#b37474;color:#fff;}
  .tabcontent{display:none;}
  table{border-collapse:collapse;width:100%;margin-bottom:10px;}
 th,td{border:1px solid #ccc;padding:5px;text-align:left;}
 th{background:#f0f0f0;}
 form{display:inline;}
 a{color:#b37474; text-decoration: none;}
 select,input,button{margin:3px;padding:3px;}
</style>
 <script>
function openTab(evt, tabName){
    var i, tabcontent, tablinks;
    tabcontent=document.getElementsByClassName("tabcontent");
    for(i=0;i<tabcontent.length;i++) tabcontent[i].style.display="none";
    tablinks=document.getElementsByClassName("tablinks");
    for(i=0;i<tablinks.length;i++) tablinks[i].className=tablinks[i].className.replace(" active","");
    document.getElementById(tabName).style.display="block";
    evt.currentTarget.className+=" active";
}
window.onload=function(){ document.getElementsByClassName("tablinks")[0].click(); };
</script>
</head>
<body>
<h2>Admin Dashboard</h2>

 <div class="tabs">
    <button class="tablinks" onclick="openTab(event,'Users')">Users</button>
    <button class="tablinks" onclick="openTab(event,'Cases')">Cases</button>
    <button class="tablinks" onclick="openTab(event,'lawFirms')">lawFirms</button>
    <button class="tablinks" onclick="openTab(event,'Lawyers')">Lawyers</button>
    <button class="tablinks" onclick="openTab(event,'Assign')">Assign</button>
    <a href="reportStatistics.jsp">Report</a>   |
    <a href="logout">logout</a>
 </div>

  <% if(request.getAttribute("error")!=null){ %>
   <p style="color:red;"><%=request.getAttribute("error")%></p>
   <% } %>

  <div id="Users" class="tabcontent">
<table>
<tr><th>ID</th><th>Username</th><th>Role</th></tr>
   <%
    List<User> users = (List<User>) request.getAttribute("users");
    if(users != null && !users.isEmpty()){
    for(User u: users){
    %>
   <tr><td><%= u.getUserId() %></td><td><%= u.getUsername() %></td><td><%= u.getRole() %></td></tr>
<% }} else { %><tr><td colspan="3">No users found.</td></tr>
<% } %></table>
</div>

  <div id="Cases" class="tabcontent">
<table>
<tr><th>ID</th><th>User</th><th>City</th><th>Description</th><th>Status</th><th>Update</th></tr>
<%
   List<Case> cases = (List<Case>) request.getAttribute("cases");
    if(cases != null && !cases.isEmpty()){
    for(Case c: cases){
%>
<tr>
   <td><%= c.getCaseId() %></td>
    <td><%= c.getUser()!=null?c.getUser().getUsername():"-" %></td>
    <td><%= c.getCity() %></td>
   <td><%= c.getDescription() %></td>
     <td><%= c.getStatus() %></td>
<td>
 <form action="manageEntity" method="post">
<input type="hidden" name="entityType" value="case"/>
<input type="hidden" name="caseId" value="<%=c.getCaseId()%>"/>
<select name="status">
<option value="Open" <%= "Open".equals(c.getStatus())?"selected":"" %>>Open</option>
<option value="Pending" <%= "Pending".equals(c.getStatus())?"selected":"" %>>Pending</option>
<option value="Closed" <%= "Closed".equals(c.getStatus())?"selected":"" %>>Closed</option>
</select>
<button type="submit">Update</button>
</form>
</td>
</tr>
<% }} else { %>
<tr><td colspan="6">No cases found.</td></tr>
<% } %>
</table>
</div>

<div id="lawFirms" class="tabcontent">
<h4>Add lawfirms</h4>
<form action="manageEntity" method="post">
<input type="hidden" name="entityType" value="lawfirm"/>
Name:<input name="name"/>
Specialization:<input name="specialization"/>
City:<input name="city"/>
Contact:<input name="contactNumber"/>
<button type="submit">Add</button>
</form>

 <table>
<tr><th>ID</th><th>Name</th><th>Specialization</th><th>City</th><th>Contact</th><th>Delete</th></tr>
 <%
List<lawFirm> lawfirms = (List<lawFirm>) request.getAttribute("lawfirms");
if(lawfirms != null && !lawfirms.isEmpty()){
    for(lawFirm n: lawfirms){
%>
<tr>
<td><%=n.getfirmId()%></td>
<td><%=n.getName()%></td>
<td><%=n.getSpecialization()%></td>
<td><%=n.getCity()%></td>
<td><%=n.getContactNumber()%></td>
<td>
<form action="manageEntity" method="post">
<input type="hidden" name="entityType" value="lawfirm"/>
<input type="hidden" name="firmId" value="<%=n.getfirmId()%>"/>
<input type="hidden" name="action" value="delete"/>
<button type="submit">Delete</button>
</form>
</td>
</tr>
<% }} else { %>
<tr><td colspan="6">No lawFirms found.</td></tr>
<% } %>
</table>
</div>

<!-- Lawyers -->
<div id="Lawyers" class="tabcontent">
<h4>Add Lawyer</h4>
<form action="manageEntity" method="post">
<input type="hidden" name="entityType" value="lawyer"/>
Name:<input name="name"/>
Skill:<input name="skill"/>
Phone:<input name="phone"/>
City:<input name="city"/>
lawFirm:<select name="firmId">
<% if(lawfirms != null){ for(lawFirm lawfirm: lawfirms){ %>
<option value="<%=lawfirm.getfirmId()%>"><%=lawfirm.getName()%></option>
<% }} %>
</select>
<button type="submit">Add</button>
</form>

<table>
<tr><th>ID</th><th>Name</th><th>Skill</th><th>City</th><th>lawFirm</th><th>Delete</th></tr>
<%
List<Lawyer> lawyers = (List<Lawyer>) request.getAttribute("lawyers");
if(lawyers != null && !lawyers.isEmpty()){
    for(Lawyer v: lawyers){
%>
<tr>
<td><%=v.getLawyerId()%></td>
<td><%=v.getName()%></td>
<td><%=v.getSkill()%></td>
<td><%=v.getCity()%></td>
<td><%=v.getLawFirm()!=null?v.getLawFirm().getName():"-" %></td>
<td>
<form action="manageEntity" method="post">
<input type="hidden" name="entityType" value="lawyer"/>
<input type="hidden" name="lawyerId" value="<%=v.getLawyerId()%>"/>
<input type="hidden" name="action" value="delete"/>
<button type="submit">Delete</button>
 </form>
 </td>
 </tr>
 <% }} else { %>
 <tr><td colspan="6">No Lawyers found.</td></tr>
 <% } %>
 </table>
 </div>

 <div id="Assign" class="tabcontent">
 <h4>Assign Lawyer to Case</h4>
  <form action="manageEntity" method="post">
  <input type="hidden" name="entityType" value="assign"/>
  Case:<select name="caseId">
 <% if(cases != null){ for(Case c: cases){ %>
  <option value="<%=c.getCaseId()%>"><%=c.getCaseId()%> - <%=c.getDescription()%></option>
  <% }} %>
 </select>
 Lawyer:<select name="lawyerId">
 <% if(lawyers != null){ for(Lawyer v: lawyers){ %>
 <option value="<%=v.getLawyerId()%>"><%=v.getName()%></option>
 <% }} %>
 </select>
 <button type="submit">Assign</button>
 </form>
 </div>

</body>
</html>
