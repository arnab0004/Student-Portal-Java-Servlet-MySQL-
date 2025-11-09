<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Admin Login | Student Portal</title>
  <link rel="stylesheet" href="../style.css">
</head>
<body style="background-color: var(--bg-color);">
  <header><h1>Admin Panel</h1></header>

  <main>
    <section class="preview" style="max-width:420px;margin:auto;">
      <h2>Admin Login</h2>
      <form action="../adminLogin" method="post">
        <label>Username:</label>
        <input type="text" name="username" required>
        <label>Password:</label>
        <input type="password" name="password" required>
        <button type="submit" class="btn" style="width:100%;">Login</button>
      </form>
      <p style="color:red;margin-top:8px;">${error}</p>
    </section>
  </main>
</body>
</html>
