package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Collaborator;
import model.Dashboard;
import model.Gender;
import model.Project;

public class DashboardController extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProtectionController.verify(request, response);
        RequestDispatcher disp = request.getRequestDispatcher("/WEB-INF/views/dashboard/dash.jsp");
        try {
            HashMap<String, Integer> number = Dashboard.getNumber();
            HashMap<String, Integer> numberProjectByCategory = Project.getNumberByCategory();
            ArrayList<Gender> listGender = Gender.getAll();

            request.setAttribute("number", number);
            request.setAttribute("numberProjectByCategory", numberProjectByCategory);
            request.setAttribute("listGender", listGender);
            request.setAttribute("page", "dashboard");
            request.setAttribute("updated", null);

            disp.forward(request,response);
        } catch (Exception e) {
            // TODO: handle exception
        }

    }
    
    
}
