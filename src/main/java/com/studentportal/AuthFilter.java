package com.studentportal;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;

@WebFilter({ "/dashboard.jsp"})
public class AuthFilter implements Filter {
    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        HttpSession session = request.getSession(false);
        boolean loggedIn = (session != null && session.getAttribute("username") != null);

        if (!loggedIn) {
            response.sendRedirect("login.html");
            return;
        }
        chain.doFilter(req, res);
    }
}
