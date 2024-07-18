package controller;

import java.io.IOException;
import java.util.HashMap;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Collaborator;
import model.Project;

public class DashboardController extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProtectionController.verify(request, response);
        RequestDispatcher disp = request.getRequestDispatcher("/WEB-INF/views/dashboard/dashboard.jsp");
        try {
            HashMap<String, Integer> number = Collaborator.getNumberCollaborator();
            HashMap<String, Integer> project = Project.getNumberProject();

            request.setAttribute("numberCollaborator", number);
            request.setAttribute("numberProject", project);
            request.setAttribute("page", "dashboard");

            disp.forward(request,response);
        } catch (Exception e) {
            // TODO: handle exception
        }

    }
    
    
}
