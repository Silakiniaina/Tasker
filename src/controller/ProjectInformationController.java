package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Project;
import model.Task;

public class ProjectInformationController extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        PrintWriter out  = response.getWriter();
        try {
            Project project = Project.getById(id);
            HashMap<String, ArrayList<Task>> listTasks = Task.getTasksByStatus(id);

            out.println(new Gson().toJson(listTasks));
        } catch (Exception e) {
            e.printStackTrace(out);
        }
    }
}
