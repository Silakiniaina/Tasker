package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.google.gson.Gson;

import shared.Database;

public class Team {
    String idProject;
    String idCollaborator;
    int assignedTask;
    double percentage;

    /* -------------------------------------------------------------------------- */
    /*                                 Constructor                                */
    /* -------------------------------------------------------------------------- */
    public Team(String idp, String idc){
        this.setIdProject(idp);
        this.setIdCollaborator(idc);
    }

    /* -------------------------------------------------------------------------- */
    /*            Getting all the team with assignedTask and percentage           */
    /* -------------------------------------------------------------------------- */
    public static ArrayList<Team> getAllByProjectId(String projectId) throws Exception{
        ArrayList<Team> result = new ArrayList<>();
        Connection c = null; 
        PreparedStatement prstm = null; 
        ResultSet rs = null; 
        try {
            c = Database.getConnection();
            prstm = c.prepareStatement("SELECT * FROM v_team WHERE id_project = ?");
            prstm.setString(1, projectId);
            rs = prstm.executeQuery();
            while (rs.next()) {
                Team t =  new Team(
                    rs.getString("id_project"),
                    rs.getString("id_collaborator") 
                    );
                t.setAssignedTask(rs.getInt("assigned"));
                t.setPercentage(rs.getDouble("percentage"));
                result.add(t);
            }
            
        } catch (Exception e) {
            throw e;
        } finally{
            if(rs != null) rs.close();
            if(prstm != null) prstm.close();
            if( c != null) c.close();
        }
        return result;
    }
    
    /* -------------------------------------------------------------------------- */
    /*                                   Getters                                  */
    /* -------------------------------------------------------------------------- */
    public String getIdProject() {
        return idProject;
    }
    public String getIdCollaborator() {
        return idCollaborator;
    }
    public int getAssignedTask() {
        return assignedTask;
    }
    public double getPercentage() {
        return percentage;
    }
    
    /* -------------------------------------------------------------------------- */
    /*                                   Setters                                  */
    /* -------------------------------------------------------------------------- */
    public void setIdProject(String idProject) {
        this.idProject = idProject;
    }
    public void setIdCollaborator(String idCollaborator) {
        this.idCollaborator = idCollaborator;
    }
    public void setAssignedTask(int assignedTask) {
        this.assignedTask = assignedTask;
    }
    public void setPercentage(double percentage) {
        this.percentage = percentage;
    }

    public static void main(String[] args) {
        try {
            ArrayList<Team> ls = Team.getAllByProjectId("PRO1");
            System.out.println(new Gson().toJson(ls));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
