<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
String admin = (String) session.getAttribute("adminUser");
if (admin == null) {
    response.sendRedirect("admin_login.jsp");
    return;
}

String id = request.getParameter("id");
if (id == null || id.isEmpty()) {
    response.sendRedirect("manage_students.jsp");
    return;
}

String username = "", name = "", email = "";
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/student_portal", "root", "root");

    PreparedStatement ps = con.prepareStatement("SELECT * FROM students WHERE id=?");
    ps.setInt(1, Integer.parseInt(id));
    ResultSet rs = ps.executeQuery();
    if (rs.next()) {
        username = rs.getString("username");
        name = rs.getString("name");
        email = rs.getString("email");
    }
    con.close();
} catch (Exception e) {
    out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Edit Student | Admin Panel</title>
  <link rel="stylesheet" href="../style.css">
  <style>
    body { background-color: var(--bg-color, #1e1e1e); color: white; text-align: center; }
    form {
      width: 400px;
      margin: 40px auto;
      background: #222;
      padding: 25px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.3);
    }
    input {
      width: 90%;
      padding: 10px;
      margin: 8px 0;
      border: none;
      border-radius: 6px;
    }
    button {
      background-color: #00b4d8;
      color: white;
      border: none;
      padding: 10px 20px;
      border-radius: 6px;
      cursor: pointer;
      font-weight: bold;
    }
    button:hover { background-color: #0096c7; }
  </style>
</head>
<body>
  <h1>Edit Student Details</h1>
  <form action="../updateStudent" method="post">
    <input type="hidden" name="id" value="<%= id %>">

    <label>Username:</label><br>
    <input type="text" name="username" value="<%= username %>" readonly><br>

    <label>Full Name:</label><br>
    <input type="text" name="name" value="<%= name %>" required><br>

    <label>Email:</label><br>
    <input type="email" name="email" value="<%= email %>" required><br>

    <button type="submit">Update Student</button>
  </form>
</body>
</html>
