<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String admin = (String) session.getAttribute("adminUser");
if (admin == null) {
    response.sendRedirect("admin_login.jsp");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Admin Dashboard | Student Portal</title>
  <link rel="stylesheet" href="../style.css">
  <style>
    body { background-color: var(--bg-color); color: white; text-align: center; }
    .menu { margin-top: 40px; }
    .menu a {
      display:flex
      display: inline-block;
      padding: 12px 40px;
      margin: 30px;
      border-radius: 6px;
      background-color: var(--primary-color);
      color: white;
      text-decoration: none;
      font-weight: bold;
      transition: 0.3s;
    }
    .menu a:hover { background-color: #0f4cff; }
  </style>
</head>
<body>
  <header>
    <h1>Welcome, <%= admin %>!</h1>
  </header>

  <main>
    <section class="menu">
      <h2>Admin Panel</h2>
      <a href="manage_students.jsp">👨‍🎓 Manage Students</a>
      <a href="manage_courses.jsp" class="btn">📚 Manage Courses</a>
      <a href="../logout">🚪 Logout</a>
    </section>
  </main>

  <footer>
    <p>© 2025 Student Portal Admin</p>
  </footer>
</body>
</html>
