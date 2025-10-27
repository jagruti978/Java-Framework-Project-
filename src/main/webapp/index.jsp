<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.MyApp.Entity.User" %>
<%
    User currentUser = (User) session.getAttribute("currentUser");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Women Safety Management</title>
    <style>
        body, html {margin:0; padding:0; font-family:Arial,sans-serif;}
        header {background:#b37474; color:#fff; padding:15px; text-align:center;}
        #navbar { position:sticky; top:0; background:#b37474; text-align:center; z-index:1000; padding:10px 0; }
         #navbar a {color:#fff; margin:0 15px; font-weight:bold; text-decoration:none;}
        #navbar a:hover {text-decoration:underline;}
         section {  padding:80px 20px 60px;   text-align:center; display:none; }
        #home p { font-family: 'Roboto', sans-serif; font-size: 22px; line-height: 1.6; text-shadow: 1px 1px 3px rgba(0,0,0,0.5);  max-width: 700px;  margin: 0 auto; }
         #home h1 { font-family: 'Montserrat', sans-serif; font-size: 48px; letter-spacing: 1px; margin-bottom: 20px;  text-shadow: 2px 2px 4px rgba(0,0,0,0.5);} 
        #home {display:block; background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)),url('image/womenhero.jpg') no-repeat center/cover;
          color:#fff; height:290px; text-align:center; padding-top:150px;  }
        .service-cards {display:flex; justify-content:center; flex-wrap:wrap; gap:50px; margin-top:20px;}
        .service {background:#fff; padding:15px; border-radius:8px; width:300px;}
          .service img {width:100%;  height: 180px;  border-radius:8px;object-fit: cover;} 
        .btn {background:#b37474; color:#fff; padding:10px 20px; border:none; border-radius:5px; cursor:pointer; margin-top:10px;}
        .btn:hover {background:#944f4f;}
    </style>
</head>
<body>
<header>
    <h1>Women Safety Management System</h1>
</header>

<nav id="navbar">
    <a href="#home">Home</a>
    <a href="#services">Services</a>
    <a href="#contact">Contact</a>
</nav>
<section id="home">
    <h1>Hey, my dear women, you are precious </h1>
    <p>We don’t have to fear. Together we are strong, safe, and unstoppable. Women’s safety is not an option; it’s our right.</p>
</section>

<section id="services">
    <h2>Our Services</h2>
    <div class="service-cards">
        <div class="service">
            <img src="image/service1.jpg" alt="Emergency Alerts">
            <h3>Emergency SOS Alerts</h3>
            <p>Instant help alerting authorities & loved ones.</p>
        </div>
        <div class="service">
            <img src="image/service2.jpg" alt="Lawfirm Support">
            <h3>Lawfirm & Lawyer Support</h3>
            <p>Connect with trusted lawfirm and lawyerss.</p>
        </div>
        <div class="service">
            <img src="image/service3.jpg" alt="Case Tracking">
            <h3>Case Registration & Tracking</h3>
            <p>Register your case & track status in real-time.</p>
        </div>
        <div class="service">
    <img src="image/service4.jpg" alt="Awareness Programs">
    <h3>Awareness Programs</h3>
    <p>Workshops and campaigns to educate about women’s safety.</p>
</div>
<div class="service">
    <img src="image/service5.jpg" alt="Legal Aid">
    <h3>Legal Aid</h3>
    <p>Assistance with filing complaints & legal guidance.</p>
</div>
<div class="service">
    <img src="image/service6.jpg" alt="Counseling Support">
    <h3>Counseling Support</h3>
    <p>Professional counseling for emotional & mental support.</p>
</div>
      
</div>
    
</section>

<section id="contact">
    <h2>Contact & Helplines</h2>
    <b>Women Helpline: 1091 | Police: 100 | NCW: 7827170170 | Childline: 1098 | Fire: 101</b><br/><br/>
    <b>Central Social Welfare Board – Women Helpline: 10920 | Domestic Violence Helpline (Delhi NCR): 1291</b><br/><br/>
    <b>Acid Attack Victim Helpline: 1800-11-4000 | Cyber Crime Helpline: 1930</b><br/><br/>
    <button class="btn" onclick="location.href='login.jsp'">Need Help</button>
</section>

<script>
const sections = document.querySelectorAll('section');
document.querySelectorAll('#navbar a').forEach(a => {
    a.addEventListener('click', e => {
        e.preventDefault();
        sections.forEach(s => s.style.display='none');
        document.querySelector(a.getAttribute('href')).style.display='block';
    });
});
</script>
</body>
</html>
