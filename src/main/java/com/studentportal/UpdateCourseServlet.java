package com.studentportal;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/updateCourse")
public class UpdateCourseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String courseCode = request.getParameter("courseCode");
        String courseName = request.getParameter("courseName");
        String instructor = request.getParameter("instructor");
        String grade = request.getParameter("grade");
        String progress = request.getParameter("progress");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/student_portal", "root", "root");

            PreparedStatement ps = con.prepareStatement(
                "UPDATE courses SET course_code=?, course_name=?, instructor=?, grade=?, progress=? WHERE id=?");
            ps.setString(1, courseCode);
            ps.setString(2, courseName);
            ps.setString(3, instructor);
            ps.setString(4, grade);
            ps.setString(5, progress);
            ps.setInt(6, Integer.parseInt(id));

            ps.executeUpdate();
            con.close();

            response.sendRedirect("admin/manage_courses.jsp");

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
