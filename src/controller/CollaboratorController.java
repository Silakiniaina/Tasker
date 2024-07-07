package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Collaborator;
import model.Gender;
import model.Role;

public class CollaboratorController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String mode = request.getParameter("mode");
        PrintWriter out = response.getWriter();
        ArrayList<Collaborator> liste = null;
        RequestDispatcher disp = request.getRequestDispatcher("/WEB-INF/views/collaborator/collaborator.jsp");
        try {
            String id = request.getParameter("id");
            if(mode.equals("u")) {
                Collaborator updated = Collaborator.getById(id);
                request.setAttribute("updated", updated);
            }else if(mode.equals("d")) {
                Collaborator toDelete = Collaborator.getById(id);
                toDelete.delete();
            }else if(mode.equals("s")) {
                String name = request.getParameter("name") != null && !request.getParameter("name").trim().equals("")
                        ? request.getParameter("name")
                        : null;
                String email = request.getParameter("email") != null && !request.getParameter("email").trim().equals("")
                        ? request.getParameter("email")
                        : null;
                String gender = request.getParameter("gender") != null
                        && !request.getParameter("gender").trim().equals("") ? request.getParameter("gender") : null;
                String role = request.getParameter("role") != null && !request.getParameter("role").trim().equals("")
                        ? request.getParameter("role")
                        : null;
                Date dtn_d = request.getParameter("dtn_d") != null && !request.getParameter("dtn_d").trim().equals("")
                        ? Date.valueOf(request.getParameter("dtn_d"))
                        : null;
                Date dtn_f = request.getParameter("dtn_f") != null && !request.getParameter("dtn_f").trim().equals("")
                        ? Date.valueOf(request.getParameter("dtn_f"))
                        : null;
                liste = Collaborator.search(name, email, gender, role, dtn_d, dtn_f);
                out.println("Search done");
            } else {
                liste = Collaborator.getAll();
            }
            ArrayList<Gender> listGender = Gender.getAll();
            ArrayList<Role> listRole = Role.getAll();
            request.setAttribute("listCollaborator", liste);
            request.setAttribute("listGender", listGender);
            request.setAttribute("listRole", listRole);
            request.setAttribute("page", "collaborator");
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
        String mode = request.getParameter("mode");
        PrintWriter out = response.getWriter();
        RequestDispatcher disp = request.getRequestDispatcher("/WEB-INF/views/collaborator/collaborator.jsp");
        try {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            Date date_of_birth = request.getParameter("dtn") != null && !request.getParameter("dtn").trim().equals("")
                    ? Date.valueOf(request.getParameter("dtn"))
                    : null;
            String gender = request.getParameter("gender");
            String role = request.getParameter("role");
            Collaborator c = new Collaborator(name, email, gender, role, date_of_birth);
            c.setPassword(password);
            if (mode.equals("i")) {
                c.insert();
                response.sendRedirect("collaborator?mode=r");
            } else if (mode.equals("u")) {
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