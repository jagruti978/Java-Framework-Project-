package com.MyApp.servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/logout")
public class logoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException { handleLogout(request, response);  }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException { handleLogout(request, response); }
    private void handleLogout(HttpServletRequest request, HttpServletResponse response)
            throws IOException { HttpSession session = request.getSession(false);
        if (session != null) { session.invalidate();  }
        response.sendRedirect("login.jsp?logout=true");
    }
}
