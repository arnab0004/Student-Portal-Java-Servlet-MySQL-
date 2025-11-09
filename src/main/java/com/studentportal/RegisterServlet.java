package com.studentportal;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/student_portal", "root", "root"
            );

            String sql = "INSERT INTO students (name, email, username, password) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, username);
            ps.setString(4, password);

            int rows = ps.executeUpdate();
            if (rows > 0) {
                out.println("<script>");
                out.println("alert('Registration successful! Please log in now.');");
                out.println("window.location.href='login.html';");
                out.println("</script>");
            } else {
                out.println("<script>");
                out.println("alert('Registration failed. Please try again.');");
                out.println("window.location.href='register.html';");
                out.println("</script>");
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace(out);
        }
    }
}
