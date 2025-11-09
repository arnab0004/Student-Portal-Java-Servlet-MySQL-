package com.studentportal;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/admission")
public class AdmissionServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String course = request.getParameter("course");
        String message = request.getParameter("message");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/student_portal", "root", "root"
            );

            String sql = "INSERT INTO applications (name, email, phone, course, message) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, course);
            ps.setString(5, message);

            int rows = ps.executeUpdate();
            if (rows > 0) {
                out.println("<script>");
                out.println("alert('Thank you for applying! We will contact you soon.');");
                out.println("window.location.href='admission.html';");
                out.println("</script>");
            } else {
                out.println("<script>");
                out.println("alert('Submission failed. Please try again.');");
                out.println("window.location.href='admission.html';");
                out.println("</script>");
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace(out);
        }
    }
}
