<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Victim Dashboard</title>
<style>
   body{font-family:Arial,sans-serif;background:#f9f6f6;margin:0}
   header{background:#b37474;color:#fff;text-align:center;padding:20px}
  header h1{margin:0;font-size:28px}
   header p{margin:5px 0 0;font-size:16px}
   main{text-align:center;padding:40px 20px}
   main h2{color:#444;margin:0 0 20px}
   main p{margin:0 auto 25px;max-width:700px;color:#555}
   .actions a{display:inline-block;margin:10px;padding:12px 20px;background:#b37474;color:#fff;border-radius:8px;text-decoration:none;font-weight:700;transition:.2s}
   .actions a:hover{background:#8c5a5a}
footer{margin-top:40px;text-align:center;color:#777;font-size:13px;padding:15px}
</style>
</head>
<body>
<header><h1>Welcome, Dear Woman</h1><p>We deeply care about your safety and dignity</p></header>
<main><h2>How can we support you today?</h2>
  <p>Our mission is to stand beside every woman, hear her voice, and ensure justice. Please choose an action below : we are here to help.</p>
  <div class="actions">
    <a href="registerCase.jsp">Register New Case</a> <a href="viewCases">View My Cases</a>
    <a href="searchCases.jsp">Search Cases</a>  <a href="login.jsp">Logout</a>
  </div>
</main>
<footer>Together, we will try to resolve your cases and give you justice.</footer>
</body></html>
