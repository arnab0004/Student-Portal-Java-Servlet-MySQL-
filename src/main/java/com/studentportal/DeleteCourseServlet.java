package com.studentportal;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/deleteCourse")
public class DeleteCourseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        if (id == null || id.isEmpty()) {
            response.sendRedirect("admin/manage_courses.jsp");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/student_portal", "root", "root");

            PreparedStatement ps = con.prepareStatement("DELETE FROM courses WHERE id=?");
            ps.setInt(1, Integer.parseInt(id));
            ps.executeUpdate();

            con.close();

            response.sendRedirect("admin/manage_courses.jsp");

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
