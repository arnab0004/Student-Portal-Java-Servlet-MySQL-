package com.studentportal;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/student_portal", "root", "root")) {

                String sql = "SELECT 1 FROM admins WHERE username=? AND password=?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, username);
                ps.setString(2, password);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    HttpSession session = request.getSession();
                    session.setAttribute("adminUser", username);
                    response.sendRedirect("admin/admin_dashboard.jsp");
                } else {
                    request.setAttribute("error", "Invalid credentials!");
                    RequestDispatcher rd = request.getRequestDispatcher("admin/admin_login.jsp");
                    rd.forward(request, response);
                }
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
