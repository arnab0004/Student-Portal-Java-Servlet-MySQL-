package com.studentportal;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/updateStudent")
public class UpdateStudentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/student_portal", "root", "root");

            String sql = "UPDATE students SET name=?, email=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setInt(3, Integer.parseInt(id));

            ps.executeUpdate();
            con.close();

            // Redirect back to student list
            response.sendRedirect("admin/manage_students.jsp");

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
