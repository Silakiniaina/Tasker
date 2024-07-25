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
import model.Priority;
import model.Project;
import model.ProjectCategory;
import model.Task;
import model.TaskCategory;
import model.Role; 

public class BacklogController extends HttpServlet{
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        PrintWriter out  = response.getWriter();
        RequestDispatcher disp = request.getRequestDispatcher("/WEB-INF/views/project/backlog.jsp");
        try {
            Project project = Project.getById(id);
            HashMap<String, ArrayList<Task>> listTasks = Task.getTasksByStatus(id);
            ArrayList<Collaborator> listCollaborator = Collaborator.getAll();
            ArrayList<Gender> listGender = Gender.getAll();
            ArrayList<Priority> listPriority = Priority.getAll();
            ArrayList<Role> listRole = Role.getAll();
            ArrayList<ProjectCategory> listProjectCategory = ProjectCategory.getAll();
            ArrayList<TaskCategory> listTaskCategories = TaskCategory.getAll();


            request.setAttribute("listTasks", listTasks);
            request.setAttribute("listRole", listRole);
            request.setAttribute("listProjectCategory", listProjectCategory);
            request.setAttribute("listTaskCategory", listTaskCategories);
            request.setAttribute("listGender", listGender);
            request.setAttribute("listPriority", listPriority);
            request.setAttribute("project", project);
            request.setAttribute("listCollaborator", listCollaborator);
            request.setAttribute("page", "backlog");
            disp.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace(out);
        }
    }
}
