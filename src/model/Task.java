package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.sql.Timestamp;
import java.time.Instant;
import java.time.LocalDateTime;
import java.util.ArrayList;

import com.google.gson.Gson;

import shared.Database;
import shared.Utils;

public class Task {
    private String idTask;
    private String name;
    private String description;
    private Timestamp startDate;
    private Timestamp endDate;
    private String idTaskCategory;
    private String idCollaborator;
    private String idProject;
    private String idStatus;

    // Constructeur
    public Task(String name, String description, Timestamp st, Timestamp en, String categ, String col, String pr,String status) {
        this.setName(name);
        this.setDescription(description);
        this.setStartDate(st);
        this.setEndDate(en);
        this.setIdTaskCategory(categ);
        this.setIdCollaborator(col);
        this.setIdProject(pr);
        this.setIdStatus(status);

    }

    /* -------------------------------------------------------------------------- */
    /*                                Get all tasks                               */
    /* -------------------------------------------------------------------------- */
    public static  ArrayList<Task> getAll() throws Exception {
        ArrayList<Task> tasks = new ArrayList<>();
        Connection c = null;
        PreparedStatement prstm = null;
        ResultSet rs = null;
        try {
            c = Database.getConnection();
            prstm = c.prepareStatement("SELECT * FROM task");
            rs = prstm.executeQuery();
            while (rs.next()) {
                Task t = new Task(rs.getString("name"), rs.getString("description"), rs.getTimestamp("start_date"),
                        rs.getTimestamp("end_date"), rs.getString("id_task_category"), rs.getString("id_collaborator"),
                        rs.getString("id_project"),rs.getString("id_status"));
                t.setId(rs.getString("id_task"));
                tasks.add(t);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (c != null)
                c.close();
            if (prstm != null)
                prstm.close();
            if (rs != null) {
                rs.close();
            }
        }
        return tasks;
    }

    /* -------------------------------------------------------------------------- */
    /*                                Insert a task                               */
    /* -------------------------------------------------------------------------- */
    public void insert() throws Exception{
        Connection c = null; 
        PreparedStatement prstm  = null; 
        try {
            c = Database.getConnection();
            c.setAutoCommit(false);
            prstm = c.prepareStatement("INSERT INTO task(name,description,start_date,end_date,id_task_category,id_collaborator,id_project,id_status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            prstm.setString(1,this.getName());
            prstm.setString(2, this.getDescription());
            prstm.setTimestamp(3, this.getStartDate());
            prstm.setTimestamp(4, this.getEndDate());
            prstm.setString(5, this.getIdTaskCategory());
            prstm.setString(6, this.getIdCollaborator());
            prstm.setString(7, this.getIdProject());
            prstm.setString(8, this.getIdStatus());
            prstm.executeUpdate();
            c.commit();
        } catch (Exception e) {
            c.rollback();
            throw e;
        }finally{
            if(prstm != null) prstm.close();
            if(c != null) c.close();
        }
    }

    /* -------------------------------------------------------------------------- */
    /*                                  Get by id                                 */
    /* -------------------------------------------------------------------------- */
    public static Task getById(String id)throws Exception{
        Task result = null;
        Connection c = null;
        PreparedStatement prstm = null;
        ResultSet rs = null;
        try {
            c = Database.getConnection();
            prstm = c.prepareStatement("SELECT * FROM task WHERE id_task = ?");
            prstm.setString(1, id);
            rs = prstm.executeQuery();
            if(rs.next()){
                result = new Task(rs.getString("name"), rs.getString("description"), rs.getTimestamp("start_date"),
                        rs.getTimestamp("end_date"), rs.getString("id_task_category"), rs.getString("id_collaborator"),
                        rs.getString("id_project"), rs.getString("id_status"));
                result.setId(rs.getString("id_task"));
            }
        } catch (Exception e) {
            throw e;
        }finally{
            if(rs != null)rs.close();
            if(prstm != null)prstm.close();
            if(c != null) c.close();
        }
        return result;
    }
    /* -------------------------------------------------------------------------- */
    /*                                Update a task                               */
    /* -------------------------------------------------------------------------- */
    public void update(Task t)throws Exception{
        Connection c = null;
        PreparedStatement prstm = null;
        try {
            c = Database.getConnection();
            c.setAutoCommit(false);
            prstm = c.prepareStatement(
                "UPDATE task SET name = ? , description = ?, start_date = ? , end_date = ? , id_task_category = ? , id_collaborator = ?, id_project = ?, id_status  = ? WHERE id_task = ?");
                prstm.setString(1,t.getName());
                prstm.setString(2, t.getDescription());
                prstm.setTimestamp(3, t.getStartDate());
                prstm.setTimestamp(4, t.getEndDate());
                prstm.setString(5, t.getIdTaskCategory());
                prstm.setString(6, t.getIdCollaborator());
                prstm.setString(7, t.getIdProject());
                prstm.setString(8, t.getIdStatus());
            prstm.setString(9, this.getId());
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
    /*                                Delete a task                               */
    /* -------------------------------------------------------------------------- */
    public void delete() throws Exception {
        Connection c = null;
        PreparedStatement prstm = null;
        try {
            c = Database.getConnection();
            c.setAutoCommit(false);
            prstm = c.prepareStatement("DELETE FROM task WHERE id_task = ?");
            prstm.setString(1, this.getId());
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
    /*                                   search                                   */
    /* -------------------------------------------------------------------------- */
    public static ArrayList<Task> search(){
        return null;
    }

    /* -------------------------------------------------------------------------- */
    /*                            Duration of the task                            */
    /* -------------------------------------------------------------------------- */
    public int getDurationHours(){
        long time = this.getEndDate().toInstant().toEpochMilli() - this.getStartDate().toInstant().toEpochMilli();
        return Math.round(time/3600000);
    }

    // Getters et setters
    public String getId() {
        return idTask;
    }

    public void setId(String idTask) {
        this.idTask = idTask;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Timestamp getStartDate() {
        return startDate;
    }

    public void setStartDate(Timestamp startDate) {
        this.startDate = startDate;
    }

    public Timestamp getEndDate() {
        return endDate;
    }

    public void setEndDate(Timestamp endDate) {
        this.endDate = endDate;
    }

    public String getIdTaskCategory() {
        return idTaskCategory;
    }

    public void setIdTaskCategory(String idTaskCategory) {
        this.idTaskCategory = idTaskCategory;
    }

    public String getIdCollaborator() {
        return idCollaborator;
    }

    public void setIdCollaborator(String idCollaborator) {
        this.idCollaborator = idCollaborator;
    }

    public String getIdProject() {
        return idProject;
    }

    public void setIdProject(String idProject) {
        this.idProject = idProject;
    }
    
    public String getIdTask() {
        return idTask;
    }

    public void setIdTask(String idTask) {
        this.idTask = idTask;
    }
    

    public static void main(String[] args) {
        try {
            Timestamp t = Timestamp.valueOf(LocalDateTime.now());
            Timestamp t1 = Timestamp.valueOf(LocalDateTime.now().plusHours(5));
            System.out.println("t : "+t.toString()+" - t1 : "+t1.toString());
            long time = t1.toInstant().toEpochMilli() - t.toInstant().toEpochMilli();
            System.out.println(Math.round(time/3600000));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public String getIdStatus() {
        return idStatus;
    }

    public void setIdStatus(String idStatus) {
        this.idStatus = idStatus;
    }
}