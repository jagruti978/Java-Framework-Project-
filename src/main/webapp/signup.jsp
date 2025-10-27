<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> <title>Sign Up - Women Safety Management</title>
    <style>
         body { font-family: Arial, sans-serif; background: #f8f9fa; margin: 0; padding: 0; }
    header { background: #b37474; color: white; padding: 12px; text-align: center; }
    .container { width: 320px; margin: 60px auto; padding: 20px; background: white;
                 border: 1px solid #ddd; border-radius: 6px; }
    h2 { color: #b37474; margin-bottom: 15px; text-align: center; font-size: 20px;}
    label { display: block; margin-top: 8px; font-weight: normal; }
    input[type="text"], input[type="password"], select { width: 95%; padding: 8px; margin-top: 5px; border: 1px solid #ccc; border-radius: 4px;}
    .btn { background: #b37474; color: white; border: none; padding: 8px; width: 100%; margin-top: 15px; border-radius: 4px; cursor: pointer; }
    .btn:hover { background: #944f4f; }
    .link { margin-top: 12px; text-align: center; font-size: 14px;}
    </style>
</head>
<body>
<header><h1>Women Safety Management System</h1></header>
<div class="container"><h2>Sign Up</h2>
    <form action="register" method="post">
      <label>Username</label><input type="text" name="username" required>
      <label>Password</label> <input type="password" name="password" required>
      <label>Role</label><select name="role"><option value="USER">User</option> <option value="ADMIN">Admin</option>  </select>
      <button type="submit" class="btn">Sign Up</button>
    </form>
<div class="link"><p>Already have an account? <a href="login.jsp">Login</a></p></div>
</div></body>
</html>
