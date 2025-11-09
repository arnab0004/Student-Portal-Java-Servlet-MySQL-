<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

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
<title>Manage Students | Admin Panel</title>
<link rel="stylesheet" href="../style.css">
<style>
  body {
    background-color: var(--bg-color, #1e1e1e);
    color: white;
    font-family: Arial, sans-serif;
  }

  header {
    text-align: center;
    padding: 20px;
    background-color: #111;
  }

  h1 {
    margin: 0;
    color: #4ea8de;
  }

  nav {
    margin-top: 10px;
  }

  nav a.btn {
    margin: 5px;
    display: inline-block;
    background-color: #4ea8de;
    color: white;
    padding: 8px 14px;
    border-radius: 6px;
    text-decoration: none;
    font-weight: bold;
  }

  nav a.btn:hover {
    background-color: #3b82f6;
  }

  table {
    width: 90%;
    margin: 40px auto;
    border-collapse: collapse;
    background-color: #222;
    border-radius: 8px;
    overflow: hidden;
  }

  th {
    background-color: #333;
    color: #00b4d8;
    text-transform: uppercase;
    letter-spacing: 0.5px;
  }

  th, td {
    padding: 12px 16px;
    border-bottom: 1px solid #444;
    text-align: center;
  }

  tr:hover {
    background-color: #2a2a2a;
  }

  a.btn {
    background: #00b4d8;
    color: white;
    padding: 6px 12px;
    border-radius: 4px;
    text-decoration: none;
    transition: 0.2s;
  }

  a.btn:hover {
    background: #0096c7;
  }

  a.btn.delete {
    background: #e63946;
  }

  a.btn.delete:hover {
    background: #d62828;
  }
</style>

</head>
<body>

	<header>
		<h1>Student Management</h1>
		<nav>
			<a href="admin_dashboard.jsp" class="btn">🏠 Dashboard</a> <a
				href="../logout" class="btn">🚪 Logout</a>
		</nav>
	</header>

	<main>
		<table>
			<tr>
				<th>ID</th>
				<th>Username</th>
				<th>Name</th>
				<th>Email</th>
				<th>Actions</th>

			</tr>

			<%
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_portal", "root", "root");

				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("SELECT * FROM students");

				while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getInt("id")%></td>
				<td><%=rs.getString("username")%></td>
				<td><%=rs.getString("name")%></td>
				<td><%=rs.getString("email")%></td>

				<td><a href="edit_student.jsp?id=<%=rs.getInt("id")%>"
					class="btn">✏️ Edit</a> 
					<a href="../deleteStudent?id=<%= rs.getInt("id") %>" class="btn delete">🗑️ Delete</a>
</td>
			</tr>
			<%
			}
			con.close();
			} catch (Exception e) {
			out.println("<tr><td colspan='5'>Error: " + e.getMessage() + "</td></tr>");
			}
			%>
		</table>
	</main>

</body>
</html>
