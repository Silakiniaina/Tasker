package controller;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Collaborator;

public class LoginController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        RequestDispatcher disp = null;
        PrintWriter out = response.getWriter();
        try {
            if (email != null && password != null) {
                Collaborator c = Collaborator.login(email, password);
                if (c != null) {
                    request.getSession().setAttribute("userActive", c);
                    if(c.isAdmin()){
                        response.sendRedirect("dashboard");
                    }else{
                        response.sendRedirect("project");
                    }
                } else {
                    request.setAttribute("error", "The informations provided seems to be not correct, please verify");
                    disp = request.getRequestDispatcher("/WEB-INF/views/collaborator/login.jsp");
                    disp.forward(request, response);
                }
            }
        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
            disp = request.getRequestDispatcher("/WEB-INF/views/collaborator/login.jsp");
            disp.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/collaborator/login.jsp").forward(req, resp);
    }
}
