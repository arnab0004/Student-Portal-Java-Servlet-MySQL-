package com.studentportal;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/student_portal", "root", "root"
            );

            String sql = "SELECT * FROM students WHERE username = ? AND password = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // Login success → create session
                HttpSession session = request.getSession();
                session.setAttribute("username", rs.getString("username"));
                session.setAttribute("name", rs.getString("name"));

                // Redirect to dashboard
                response.sendRedirect("dashboard");
            } else {
                out.println("<script>");
                out.println("alert('Invalid username or password');");
                out.println("window.location.href = 'login.html';");
                out.println("</script>");
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace(out);
        }
    }
}
