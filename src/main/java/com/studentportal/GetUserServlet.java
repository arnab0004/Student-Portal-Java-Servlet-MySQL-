package com.studentportal;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/getUser")
public class GetUserServlet extends HttpServlet {

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        response.setContentType("application/json;charset=UTF-8");

        if (session == null || session.getAttribute("name") == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED); // 401
            response.getWriter().write("{\"error\":\"not_logged_in\"}");
            return;
        }

        String name = (String) session.getAttribute("name");

        // Simple JSON without external libs:
        String json = "{\"name\":\"" + escapeJson(name) + "\"}";
        response.setStatus(HttpServletResponse.SC_OK);
        response.getWriter().write(json);
    }

    // minimal JSON escaper
    private String escapeJson(String s) {
        if (s == null) return "";
        return s.replace("\\", "\\\\").replace("\"", "\\\"")
                .replace("\n", "\\n").replace("\r", "\\r");
    }
}
