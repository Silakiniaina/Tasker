package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Collaborator;
import model.Gender;
import model.Project;
import model.Task;
import model.TaskCategory;
import shared.Utils;

public class TaskController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProtectionController.verify(request, response);
        String mode = request.getParameter("mode");
        String type = request.getParameter("type");
        PrintWriter out = response.getWriter();
        ArrayList<Task> liste = null;
        RequestDispatcher disp = request.getRequestDispatcher("/WEB-INF/views/task/task.jsp");
        try {
            String id = request.getParameter("id");
            if (mode != null && mode.equals("u")) {
                Task updated = Task.getById(id);
                request.setAttribute("updated", updated);
            } else if (mode != null && mode.equals("d")) {
                Task toDelete = Task.getById(id);
                toDelete.delete();
            }
            if (type != null && type.equals("s")) {
                String name = request.getParameter("name") != null && !request.getParameter("name").trim().equals("")
                        ? request.getParameter("name")
                        : null;
                String category = request.getParameter("category") != null
                        && !request.getParameter("category").trim().equals("")
                                ? request.getParameter("category")
                                : null;
                String responsable = request.getParameter("responsable") != null
                        && !request.getParameter("responsable").trim().equals("") ? request.getParameter("responsable")
                                : null;
                String status = request.getParameter("status") != null
                        && !request.getParameter("status").trim().equals("")
                                ? request.getParameter("status")
                                : null;
                Date startDateDebut = request.getParameter("startDateDebut") != null
                        && !request.getParameter("startDateDebut").trim().equals("")
                                ? Date.valueOf(request.getParameter("startDateDebut"))
                                : null;
                Date startDateEnd = request.getParameter("startDateEnd") != null
                        && !request.getParameter("startDateEnd").trim().equals("")
                                ? Date.valueOf(request.getParameter("startDateEnd"))
                                : null;
                Date deadlineDebut = request.getParameter("deadlineDebut") != null
                        && !request.getParameter("deadlineDebut").trim().equals("")
                                ? Date.valueOf(request.getParameter("deadlineDebut"))
                                : null;
                Date deadlineEnd = request.getParameter("deadlineEnd") != null
                        && !request.getParameter("deadlineEnd").trim().equals("")
                                ? Date.valueOf(request.getParameter("deadlineEnd"))
                                : null;
                liste = Task.search();
            } else {
                liste = Task.getAll();
            }
            ArrayList<Gender> listGender = Gender.getAll();
            ArrayList<TaskCategory> listTaskCategory = TaskCategory.getAll();
            ArrayList<Collaborator> listeCollaborator = Collaborator.getAll();
            ArrayList<Project> listProject = Project.getAll();

            request.setAttribute("listTask", liste);
            request.setAttribute("listProject", listProject);
            request.setAttribute("listGender", listGender);
            request.setAttribute("listTaskCategory", listTaskCategory);
            request.setAttribute("listCollaborator", listeCollaborator);

            request.setAttribute("page", "task");
            disp.forward(request, response);
        } catch (Exception e) {
            out.println(e.getMessage());
            request.setAttribute("error", e.getMessage());
        } finally {
            if (out != null) {
                out.close();
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProtectionController.verify(request, response);
        PrintWriter out = response.getWriter();

        /* ------------------------ Request paremeters values ----------------------- */
        String mode = request.getParameter("mode");
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String startDateStr = request.getParameter("startDate");
        String duration = request.getParameter("duration");
        String project = request.getParameter("project");
        String description = request.getParameter("description");
        String progress_str = request.getParameter("progress");
        String collaborator = request.getParameter("collaborator");

        try {
            Timestamp startDate = startDateStr != null && !startDateStr.trim().equals("")
                    ? Utils.format(startDateStr)
                    : null;
            Timestamp deadline = duration != null && startDate != null
                    ? Utils.getDeadline(startDate, Integer.valueOf(duration))
                    : null;
            collaborator = collaborator != null && !collaborator.trim().equals("") 
                    ? collaborator 
                    : null;
            /* ------------------------------ task progress ----------------------------- */
            double progress = progress_str != null
                    ? Double.parseDouble(progress_str)
                    : null;

            Task p = new Task(name, description, startDate, deadline, category, collaborator, project, progress);
            if (mode.equals("i")) {
                p.insert();
            } else if (mode.equals("u")) {
                String id = request.getParameter("id");
                Task old = Task.getById(id);
                old.update(p);
            }
            response.sendRedirect("task");
        } catch (Exception e) {
            out.println(e.getMessage());
        }
    }
}
