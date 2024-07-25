package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import com.google.gson.Gson;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Collaborator;
import model.Gender;
import model.Project;
import model.Team;

public class TeamController extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProtectionController.verify(request, response);
        PrintWriter out  = response.getWriter();
        RequestDispatcher disp = request.getRequestDispatcher("/WEB-INF/views/project/team.jsp");
        try {
            HashMap<String,ArrayList<String>> listTeam = Team.getAll();
            ArrayList<Project> listProject = Project.getAll();
            ArrayList<Collaborator> listCollaborator = Collaborator.getAll();
            ArrayList<Gender> listGender = Gender.getAll();


            request.setAttribute("listTeam", listTeam);
            request.setAttribute("listGender", listGender);
            request.setAttribute("listProject", listProject);
            request.setAttribute("listCollaborator", listCollaborator);
            request.setAttribute("page", "team");
            disp.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace(out);
        }
    }
}
