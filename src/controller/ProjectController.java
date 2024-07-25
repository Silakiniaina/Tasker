package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import com.google.gson.Gson;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Collaborator;
import model.Gender;
import model.Project;
import model.ProjectCategory;
import model.Status;

public class ProjectController extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProtectionController.verify(request, response);
        String mode = request.getParameter("mode");
        String type = request.getParameter("type");
        PrintWriter out = response.getWriter();
        ArrayList<Project> liste = null;
        RequestDispatcher disp = request.getRequestDispatcher("/WEB-INF/views/project/project.jsp");
        try {
            String id = request.getParameter("id");
            if(mode != null && mode.equals("u")) {
                Project updated = Project.getById(id);
                request.setAttribute("updated", updated);
            }else if(mode != null && mode.equals("d")) {
                Project toDelete = Project.getById(id);
                toDelete.delete();
            }
            if(type != null && type.equals("s")){
                String name = request.getParameter("name") != null && !request.getParameter("name").trim().equals("")
                        ? request.getParameter("name")
                        : null;
                String category = request.getParameter("category") != null && !request.getParameter("category").trim().equals("")
                        ? request.getParameter("category")
                        : null;
                String responsable = request.getParameter("responsable") != null
                        && !request.getParameter("responsable").trim().equals("") ? request.getParameter("responsable") : null;
                String status = request.getParameter("status") != null && !request.getParameter("status").trim().equals("")
                        ? request.getParameter("status")
                        : null;
                Date startDateDebut = request.getParameter("startDateDebut") != null && !request.getParameter("startDateDebut").trim().equals("")
                        ? Date.valueOf(request.getParameter("startDateDebut"))
                        : null;
                Date startDateEnd = request.getParameter("startDateEnd") != null && !request.getParameter("startDateEnd").trim().equals("")
                        ? Date.valueOf(request.getParameter("startDateEnd"))
                        : null;
                Date deadlineDebut = request.getParameter("deadlineDebut") != null && !request.getParameter("deadlineDebut").trim().equals("")
                        ? Date.valueOf(request.getParameter("deadlineDebut"))
                        : null;
                Date deadlineEnd = request.getParameter("deadlineEnd") != null && !request.getParameter("deadlineEnd").trim().equals("")
                        ? Date.valueOf(request.getParameter("deadlineEnd"))
                        : null;
                liste = Project.search();
            }else{
                liste = Project.getAll();
            }
            ArrayList<Status> listStatus = Status.getAll();
            ArrayList<Gender> listGender = Gender.getAll();
            ArrayList<ProjectCategory> listProjectCategory = ProjectCategory.getAll();
            ArrayList<Collaborator> listeCollaborator = Collaborator.getAll();

            request.setAttribute("listProject", liste);
            request.setAttribute("listStatus", listStatus);
            request.setAttribute("listGender", listGender);
            request.setAttribute("listProjectCategory", listProjectCategory);
            request.setAttribute("listCollaborator", listeCollaborator);
            request.setAttribute("page", "project");
            disp.forward(request, response);
        }catch (Exception e) {
            out.println(e.getMessage());
            request.setAttribute("error", e.getMessage());
        }finally {
            if (out != null){
                out.close();
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProtectionController.verify(request, response);
        String mode = request.getParameter("mode");
        PrintWriter out = response.getWriter();
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String responsable = request.getParameter("responsable");
        String description = request.getParameter("description");
        try {
            Date startDate = request.getParameter("startDate") != null && !request.getParameter("startDate").trim().equals("")
                ? Date.valueOf(request.getParameter("startDate"))
                : null;
            Date deadline = request.getParameter("deadline") != null && !request.getParameter("deadline").trim().equals("")
                ? Date.valueOf(request.getParameter("deadline"))
                : null;
            Project p = new Project(name, description, startDate, deadline, responsable, category);
            if (mode.equals("i")) {
                p.insert();
            } else if (mode.equals("u")) {
                String id = request.getParameter("id");
                Project old = Project.getById(id);
                old.update(p);
            }
            response.sendRedirect("project");
        } catch (Exception e) {
            out.println(e.getMessage());
        }
    }
}
