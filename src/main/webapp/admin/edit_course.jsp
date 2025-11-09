<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
String id = request.getParameter("id");
if (id == null || id.isEmpty()) {
    response.sendRedirect("manage_courses.jsp");
    return;
}

String courseCode = "", courseName = "", instructor = "", grade = "", progress = "";

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/student_portal", "root", "root");

    PreparedStatement ps = con.prepareStatement("SELECT * FROM courses WHERE id=?");
    ps.setInt(1, Integer.parseInt(id));
    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
        courseCode = rs.getString("course_code");
        courseName = rs.getString("course_name");
        instructor = rs.getString("instructor");
        grade = rs.getString("grade");
        progress = rs.getString("progress");
    }
    con.close();
} catch (Exception e) {
    out.println("Error: " + e.getMessage());
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Edit Course | Admin Panel</title>
  <style>
    body {
      background-color: #1e1e1e;
      color: white;
      font-family: Arial, sans-serif;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      flex-direction: column;
    }
    form {
      background: #222;
      padding: 30px;
      border-radius: 10px;
      width: 400px;
      box-shadow: 0px 0px 10px #000;
    }
    input, select {
      width: 100%;
      padding: 8px;
      margin: 8px 0;
      border: none;
      border-radius: 5px;
    }
    button {
      width: 100%;
      padding: 10px;
      background-color: #0077b6;
      color: white;
      border: none;
      border-radius: 5px;
      font-size: 16px;
    }
    button:hover {
      background-color: #00b4d8;
    }
    a {
      color: #00b4d8;
      text-decoration: none;
      display: block;
      text-align: center;
      margin-top: 10px;
    }
  </style>
</head>
<body>
  <h2>Edit Course</h2>
  <form action="../updateCourse" method="post">
    <input type="hidden" name="id" value="<%= id %>">

    <label>Course Code:</label>
    <input type="text" name="courseCode" value="<%= courseCode %>" required>

    <label>Course Name:</label>
    <input type="text" name="courseName" value="<%= courseName %>" required>

    <label>Instructor:</label>
    <input type="text" name="instructor" value="<%= instructor %>" required>

    <label>Grade:</label>
    <input type="text" name="grade" value="<%= grade %>" required>

    <label>Progress:</label>
    <input type="text" name="progress" value="<%= progress %>" required>

    <button type="submit">Update Course</button>
    <a href="manage_courses.jsp">⬅ Back to Course List</a>
  </form>
</body>
</html>
