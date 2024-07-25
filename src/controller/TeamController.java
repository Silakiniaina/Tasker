package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

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
        String project = request.getParameter("idProject");
        String collaborator = request.getParameter("idCollaborator");
        String mode = request.getParameter("mode");
        try {
            Team t = new Team(project,collaborator);
            if(mode != null && mode.equals("d")){
                t.delete();
            }else if(mode != null && mode.equals("a")){
                ArrayList<String> listCollabo = Team.getIdCollaboratorNotInTeam(project);
                request.setAttribute("listCollabo", listCollabo);
                request.setAttribute("updated", project);
            }

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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProtectionController.verify(request, response);
        PrintWriter out = response.getWriter();
        String[] listCollaborators = request.getParameterValues("collaborators");
        String project = request.getParameter("project");
        try {
            for(int i=0; i<listCollaborators.length; i++){
                String col = listCollaborators[i];
                Team t = new Team(project, col);
                t.insert();
            }
            response.sendRedirect("team");
        } catch (Exception e) {
            e.printStackTrace(out);
        }
    }
}
