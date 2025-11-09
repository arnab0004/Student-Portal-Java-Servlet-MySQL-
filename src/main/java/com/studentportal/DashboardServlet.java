package com.studentportal;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.html");
            return;
        }

        String username = (String) session.getAttribute("username");
        String name = (String) session.getAttribute("name");

        List<Course> courses = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/student_portal", "root", "root"
            );

            String sql = "SELECT * FROM courses";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Course c = new Course(
                    rs.getString("course_code"),
                    rs.getString("course_name"),
                    rs.getString("instructor"),
                    rs.getString("grade"),
                    rs.getInt("progress")
                );
                courses.add(c);
            }

            con.close();

        } catch (Exception e) {
            throw new ServletException(e);
        }

        request.setAttribute("name", name);
        request.setAttribute("username", username);
        request.setAttribute("courses", courses);

        RequestDispatcher rd = request.getRequestDispatcher("/dashboard.jsp");
        rd.forward(request, response);
    }
}
