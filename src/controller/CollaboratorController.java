package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;

import com.google.gson.Gson;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Collaborator;
import shared.Database;

public class CollaboratorController extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mode = request.getParameter("mode");
        PrintWriter out = response.getWriter();
        RequestDispatcher disp =  request.getRequestDispatcher("/WEB-INF/views/collaborator/collaborator.jsp");
        try {
            String id = request.getParameter("id");
            if(mode.equals("u")){
                Collaborator updated = Collaborator.getById(id);
                request.setAttribute("updated", updated);
            }else if(mode.equals("d")){
                Collaborator toDelete = Collaborator.getById(id);
                toDelete.delete();
                out.println("Delete done");
            }
            // ArrayList<Collaborator> liste = Collaborator.getAll();
            // request.setAttribute("listeCollaborator", liste);
            //disp.forward(request, response);
        } catch (Exception e) {
            out.println(e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mode = request.getParameter("mode");
        PrintWriter out = response.getWriter();
        RequestDispatcher disp =  request.getRequestDispatcher("/WEB-INF/views/collaborator/collaborator.jsp");
        try {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            Date date_of_birth = request.getParameter("dtn") != null ? Date.valueOf(request.getParameter("dtn")) : null;
            String gender = request.getParameter("gender");
            String role = request.getParameter("role");
            Collaborator c = new Collaborator(name, email, gender, role, date_of_birth);
            c.setPassword(Database.toSHA256(password));
            if(mode.equals("i")){
                c.insert();
                //response.sendRedirect("collaborator?mode=r");
            }else if(mode.equals("u")){
                String id = request.getParameter("id");
                Collaborator old = Collaborator.getById(id);
                old.update(c);
                out.println("Update done");
            }
        } catch (Exception e) {
            out.println(e.getMessage());
        }
    }
    
}
