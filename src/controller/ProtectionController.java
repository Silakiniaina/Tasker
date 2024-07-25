package controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Collaborator;

public class ProtectionController {
    public  static Collaborator verify(HttpServletRequest request, HttpServletResponse response){
        Collaborator active = null;
        try {
            active = (Collaborator)request.getSession().getAttribute("userActive");
            if(active == null){
                response.sendRedirect("login");
            }
            String userType = "0";
            if(active.isAdmin()){
                userType = "1";
            }
            request.setAttribute("userType", userType);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return active;
    }
}
