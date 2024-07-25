package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import com.google.gson.Gson;

import shared.Database;

public class Team {
    String idProject;
    String idCollaborator;
    int assignedTask;
    double percentage;

    /* -------------------------------------------------------------------------- */
    /* Constructor */
    /* -------------------------------------------------------------------------- */
    public Team(String idp, String idc) {
        this.setIdProject(idp);
        this.setIdCollaborator(idc);
    }

    /* -------------------------------------------------------------------------- */
    /* Getting all the team with assignedTask and percentage */
    /* -------------------------------------------------------------------------- */
    public static ArrayList<Team> getAllByProjectId(String projectId) throws Exception {
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
                Team t = new Team(
                        rs.getString("id_project"),
                        rs.getString("id_collaborator"));
                t.setAssignedTask(rs.getInt("assigned"));
                t.setPercentage(rs.getDouble("percentage"));
                result.add(t);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (rs != null)
                rs.close();
            if (prstm != null)
                prstm.close();
            if (c != null)
                c.close();
        }
        return result;
    }

    /* -------------------------------------------------------------------------- */
    /* Getting all the collaborator by id project   */
    /* -------------------------------------------------------------------------- */
    public static ArrayList<String> getIdCollaboratorByIdProject(String idProject) throws Exception {
        ArrayList<String> result = new ArrayList<>();
        Connection c = null;
        PreparedStatement prstm = null;
        ResultSet rs = null;
        try {
            c = Database.getConnection();
            prstm = c.prepareStatement("SELECT id_collaborator FROM v_all_team WHERE id_project = ? ");
            prstm.setString(1, idProject);
            rs = prstm.executeQuery();
            while (rs.next()) {
                result.add(rs.getString("id_collaborator"));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (rs != null)
                rs.close();
            if (prstm != null)
                prstm.close();
            if (c != null)
                c.close();
        }
        return result;
    }

    /* -------------------------------------------------------------------------- */
    /*                    List of collaborator not in the team                    */
    /* -------------------------------------------------------------------------- */
    public static ArrayList<String> getIdCollaboratorNotInTeam(String idProject) throws Exception {
        ArrayList<String> result = new ArrayList<>();
        Connection c = null;
        PreparedStatement prstm = null;
        ResultSet rs = null;
        try {
            c = Database.getConnection();
            prstm = c.prepareStatement(
                "SELECT id_collaborator FROM collaborator WHERE id_collaborator NOT IN (SELECT COALESCE(id_collaborator,'NEANT') AS id_collaborator  FROM v_all_team WHERE id_project = ?) ");
            prstm.setString(1, idProject);
            rs = prstm.executeQuery();
            while (rs.next()) {
                result.add(rs.getString("id_collaborator"));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (rs != null)
                rs.close();
            if (prstm != null)
                prstm.close();
            if (c != null)
                c.close();
        }
        return result;
    }

    /* -------------------------------------------------------------------------- */
    /*                         Insert a collaborator team                         */
    /* -------------------------------------------------------------------------- */
    public void insert() throws Exception{
        Connection c = null;
        PreparedStatement prstm = null;
        try {
            c = Database.getConnection();
            c.setAutoCommit(false);
            prstm = c.prepareStatement(
                    "INSERT INTO team(id_project,id_collaborator) VALUES (?, ?)");
            prstm.setString(1, this.getIdProject());
            prstm.setString(2, this.getIdCollaborator());
            prstm.executeUpdate();
            c.commit();
        } catch (Exception e) {
            c.rollback();
            throw e;
        } finally {
            if (prstm != null)
                prstm.close();
            if (c != null)
                c.close();
        }
    }

    /* -------------------------------------------------------------------------- */
    /*                              list of all team                              */
    /* -------------------------------------------------------------------------- */
    public static HashMap<String,ArrayList<String>> getAll() throws Exception{
        HashMap<String,ArrayList<String>> result = new HashMap<>();
        Connection c = null; 
        PreparedStatement prstm = null; 
        ResultSet rs = null; 
        try {
            c = Database.getConnection();
            prstm = c.prepareStatement("SELECT id_project FROM project");
            rs = prstm.executeQuery();
            while (rs.next()) {
                String id_project = rs.getString("id_project");
                result.put(id_project, Team.getIdCollaboratorByIdProject(id_project));
            }
        } catch (Exception e) {
            throw e;
        }finally {
            if (rs != null)
                rs.close();
            if (prstm != null)
                prstm.close();
            if (c != null)
                c.close();
        }
        return result;
    }

    /* -------------------------------------------------------------------------- */
    /*                                Delete a team                               */
    /* -------------------------------------------------------------------------- */
    public void delete() throws Exception{
        Connection c = null;
        PreparedStatement prstm = null;
        try {
            c = Database.getConnection();
            c.setAutoCommit(false);
            prstm = c.prepareStatement(
                "DELETE FROM team WHERE id_project = ? AND  id_collaborator = ?");
            prstm.setString(1, this.getIdProject());
            prstm.setString(2, this.getIdCollaborator());
            prstm.executeUpdate();
            c.commit();
        } catch (Exception e) {
            c.rollback();
            throw e;
        } finally {
            if (prstm != null)
                prstm.close();
            if (c != null)
                c.close();
        }
    }

    /* -------------------------------------------------------------------------- */
    /* Getters */
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
    /* Setters */
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
            System.out.println(Math.round(100.0));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
