package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Project;

public class ProjectController extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        ArrayList<Project> liste = null;
        //RequestDispatcher disp = request.getRequestDispatcher("/WEB-INF/views/collaborator/collaborator.jsp");
        try {
            liste = Project.getAll();
            out.println(new Gson().toJson(liste));
        }catch (Exception e) {
            out.println(e.getMessage());
            request.setAttribute("error", e.getMessage());
        }finally {
            if (out != null){
                out.close();
            }
        }
    }
}
