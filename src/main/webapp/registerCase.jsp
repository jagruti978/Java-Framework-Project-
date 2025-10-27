<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> <meta charset="UTF-8">
    <title>Register Case</title>
    <script>
        function toggleExtraFields() {let type = document.getElementById("caseType").value;
         document.getElementById("domesticFields").style.display = (type === "DomesticAbuse") ? "block" : "none";
          document.getElementById("workplaceFields").style.display = (type === "WorkplaceHarassment") ? "block" : "none"; }
    </script>
    <style>
     body{font-family:Arial,sans-serif;background:#f9f9f9;color:#333;padding:20px;}
      form{max-width:500px;margin:auto;padding:20px;background:#fff;border-radius:6px;box-shadow:0 2px 5px rgba(0,0,0,0.1);}
      h2,h4{color:#444;margin:5px 0;}  label{display:block;margin:8px 0 3px;font-weight:600;}
      input,textarea,select{width:100%;padding:6px;border:1px solid #ccc;border-radius:4px;box-sizing:border-box;}
    button{margin-top:12px;padding:8px 16px;background:#b37474;color:#fff;border:none;border-radius:4px;cursor:pointer;}
   button:hover{background:#8c5a5a;}
    p{margin:8px 0;color:red;}
</style>   
</head>
<body><h2>Register a New Case</h2>
    <form action="registerCase" method="post">
        <label>Case Type:</label>
        <select name="caseType" id="caseType" onchange="toggleExtraFields()" required>
            <option value="">-- Select Case Type --</option>
            <option value="DomesticAbuse">Domestic Abuse</option>
            <option value="WorkplaceHarassment">Workplace Harassment</option>
            <option value="Other">Other</option>
        </select>
        <br/><br/>
        <label>Description:</label><br/>
        <textarea name="description" rows="4" cols="50" required></textarea><br/><br/>
        <label>City:</label>
        <input type="text" name="city" required/><br/><br/>
        <div id="domesticFields" style="display:none;">
            <h4>Domestic Abuse Details</h4>
            <label>Abuser Relation:</label>
            <input type="text" name="abuserRelation"/><br/><br/>
            <label>Children Involved:</label>
            <select name="childrenInvolved"><option value="no">No</option>
                <option value="yes">Yes</option></select><br/><br/>
        </div>
        <div id="workplaceFields" style="display:none;">
            <h4>Workplace Harassment Details</h4>
            <label>Company Name:</label><input type="text" name="companyName"/><br/><br/>
            <label>Harassment Type:</label><input type="text" name="harassmentType"/><br/><br/>
        </div>
        <button type="submit">Register Case</button>
    </form>
    <% if (request.getAttribute("error") != null) { %>
        <p style="color:red;"><%= request.getAttribute("error") %></p>
    <% } %>
     <p><a href="userDashboard.jsp">Back to User Panel</a></p>
</body>
</html>
