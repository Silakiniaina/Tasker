package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Collaborator;
import model.Gender;
import model.Meeting;
import model.MeetingCategory;
import model.Project;
import model.Room;
import model.Status;
import model.Task;
import shared.Utils;

public class MeetingController extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProtectionController.verify(request, response);
        String mode = request.getParameter("mode");
        String type = request.getParameter("type");
        PrintWriter out = response.getWriter();
        ArrayList<Meeting> liste = null;
        RequestDispatcher disp = request.getRequestDispatcher("/WEB-INF/views/collaborator/meeting.jsp");
        try {
            String id = request.getParameter("id");
            if (mode != null && mode.equals("u")) {
                Meeting updated = Meeting.getById(id);
                request.setAttribute("updated", updated);
            } else if (mode != null && mode.equals("d")) {
                Meeting toDelete = Meeting.getById(id);
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
                liste = Meeting.search();
            } else {
                liste = Meeting.getAll();
            }

            /* ------------------ Fetching all data that the view need ------------------ */
            ArrayList<Status> listStatus = Status.getAll();
            ArrayList<Gender> listGender = Gender.getAll();
            ArrayList<MeetingCategory> listMeetingCategory = MeetingCategory.getAll();
            ArrayList<Collaborator> listeCollaborator = Collaborator.getAll();
            ArrayList<Project> listProject = Project.getAll();
            ArrayList<Room> listRoom = Room.getAll();

            /* ------------------------ sending data to the view ------------------------ */
            request.setAttribute("listMeeting", liste);
            request.setAttribute("listProject", listProject);
            request.setAttribute("listStatus", listStatus);
            request.setAttribute("listGender", listGender);
            request.setAttribute("listMeetingCategory", listMeetingCategory);
            request.setAttribute("listCollaborator", listeCollaborator);
            request.setAttribute("listRoom", listRoom);
            request.setAttribute("page", "meeting");

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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProtectionController.verify(request, response);
        PrintWriter out = response.getWriter();

        /* ------------------------ Request paremeters values ----------------------- */
        String mode = request.getParameter("mode");
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String date = request.getParameter("date");
        String start_time_str = request.getParameter("start_time");
        String end_time_str = request.getParameter("end_time");
        String project = request.getParameter("project");
        String room = request.getParameter("room");
        String status = request.getParameter("status");
        String responsable = request.getParameter("responsable");

        try {
            Date dateMeeting = date != null && !date.trim().equals("")
                    ? Date.valueOf(date)
                    : null;
            Time start_time = start_time_str != null 
                    ? Time.valueOf(start_time_str)
                    : null;
            Time end_time = end_time_str != null
                    ? Time.valueOf(end_time_str)
                    : null;

            Meeting p = new Meeting(dateMeeting, start_time, end_time, category, project, responsable, status, room);
            if (mode.equals("i")) {
                p.insert();
            } else if (mode.equals("u")) {
                String id = request.getParameter("id");
                Meeting old = Meeting.getById(id);
                old.update(p);
            }
            response.sendRedirect("task");
        } catch (Exception e) {
            out.println(e.getMessage());
        }
    }

    
}
