<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

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
  <title>Manage Courses | Admin Panel</title>
  <link rel="stylesheet" href="../style.css">
  <style>
    body { background-color: #1e1e1e; color: white; font-family: Arial, sans-serif; text-align: center; }
    table {
      width: 90%;
      margin: 20px auto;
      border-collapse: collapse;
      background: #222;
      border-radius: 10px;
      overflow: hidden;
    }
    th, td {
      padding: 12px;
      border-bottom: 1px solid #333;
    }
    th { background-color: #0077b6; }
    a.btn {
      padding: 6px 10px;
      border-radius: 6px;
      text-decoration: none;
      background-color: #00b4d8;
      color: white;
      margin: 0 4px;
    }
    a.delete { background-color: #e63946; }
    a.btn:hover { opacity: 0.8; }
    h1 { margin-top: 30px; }
  </style>
</head>
<body>
  <h1>Manage Courses</h1>
  <a href="add_course.jsp" class="btn">➕ Add New Course</a>
  <table>
    <tr>
      <th>ID</th>
      <th>Course Code</th>
      <th>Course Name</th>
      <th>Instructor</th>
      <th>Grade</th>
      <th>Progress</th>
      <th>Actions</th>
    </tr>

    <%
      try {
          Class.forName("com.mysql.cj.jdbc.Driver");
          Connection con = DriverManager.getConnection(
              "jdbc:mysql://localhost:3306/student_portal", "root", "root");

          Statement st = con.createStatement();
          ResultSet rs = st.executeQuery("SELECT * FROM courses");

          while (rs.next()) {
    %>
            <tr>
              <td><%= rs.getInt("id") %></td>
              <td><%= rs.getString("course_code") %></td>
              <td><%= rs.getString("course_name") %></td>
              <td><%= rs.getString("instructor") %></td>
              <td><%= rs.getString("grade") %></td>
              <td><%= rs.getString("progress") %></td>
              <td>
                <a href="edit_course.jsp?id=<%= rs.getInt("id") %>" class="btn">✏️ Edit</a>
                <a href="../deleteCourse?id=<%= rs.getInt("id") %>" class="btn delete">🗑️ Delete</a>
              </td>
            </tr>
    <%
          }
          con.close();
      } catch (Exception e) {
          out.println("<tr><td colspan='7'>Error: " + e.getMessage() + "</td></tr>");
      }
    %>
  </table>
</body>
</html>
