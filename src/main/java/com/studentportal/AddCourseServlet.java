package com.studentportal;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/addCourse")
public class AddCourseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
                "INSERT INTO courses (course_code, course_name, instructor, grade, progress) VALUES (?, ?, ?, ?, ?)");
            ps.setString(1, courseCode);
            ps.setString(2, courseName);
            ps.setString(3, instructor);
            ps.setString(4, grade);
            ps.setString(5, progress);

            ps.executeUpdate();
            con.close();

            response.sendRedirect("admin/manage_courses.jsp");

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
