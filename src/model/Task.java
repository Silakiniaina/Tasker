package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;

import com.google.gson.Gson;

import shared.Database;

public class Task {
    private String idTask;
    private String name;
    private String description;
    private Timestamp startDate;
    private Timestamp endDate;
    private String idTaskCategory;
    private String idCollaborator;
    private String idProject;
    private double progress;
    private String status;

    // Constructeur
    public Task(String name, String description, Timestamp st, Timestamp en, String categ, String col, String pr,double progress) {
        this.setName(name);
        this.setDescription(description);
        this.setStartDate(st);
        this.setEndDate(en);
        this.setIdTaskCategory(categ);
        this.setIdCollaborator(col);
        this.setIdProject(pr);
        this.setProgress(progress);

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
            prstm = c.prepareStatement("SELECT * FROM v_task");
            rs = prstm.executeQuery();
            while (rs.next()) {
                Task t = new Task(rs.getString("name"), rs.getString("description"), rs.getTimestamp("start_date"),
                        rs.getTimestamp("end_date"), rs.getString("id_task_category"), rs.getString("id_collaborator"),
                        rs.getString("id_project"),rs.getDouble("progress"));
                t.setId(rs.getString("id_task"));
                t.setStatus(rs.getString("status"));
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
            prstm = c.prepareStatement("INSERT INTO task(name,description,start_date,end_date,id_task_category,id_collaborator,id_project,progress) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            prstm.setString(1,this.getName());
            prstm.setString(2, this.getDescription());
            prstm.setTimestamp(3, this.getStartDate());
            prstm.setTimestamp(4, this.getEndDate());
            prstm.setString(5, this.getIdTaskCategory());
            prstm.setString(6, this.getIdCollaborator());
            prstm.setString(7, this.getIdProject());
            prstm.setDouble(8, this.getProgress());
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
            prstm = c.prepareStatement("SELECT * FROM v_task WHERE id_task = ?");
            prstm.setString(1, id);
            rs = prstm.executeQuery();
            if(rs.next()){
                result = new Task(rs.getString("name"), rs.getString("description"), rs.getTimestamp("start_date"),
                        rs.getTimestamp("end_date"), rs.getString("id_task_category"), rs.getString("id_collaborator"),
                        rs.getString("id_project"), rs.getDouble("progress"));
                result.setId(rs.getString("id_task"));
                result.setStatus(rs.getString("status"));
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
                "UPDATE task SET name = ? , description = ?, start_date = ? , end_date = ? , id_task_category = ? , id_collaborator = ?, id_project = ?, progress  = ? WHERE id_task = ?");
                prstm.setString(1,t.getName());
                prstm.setString(2, t.getDescription());
                prstm.setTimestamp(3, t.getStartDate());
                prstm.setTimestamp(4, t.getEndDate());
                prstm.setString(5, t.getIdTaskCategory());
                prstm.setString(6, t.getIdCollaborator());
                prstm.setString(7, t.getIdProject());
                prstm.setDouble(8, t.getProgress());
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

    /* -------------------------------------------------------------------------- */
    /*                               Task by id project and status                               */
    /* -------------------------------------------------------------------------- */
    public static ArrayList<Task> getListTaskByIdProject(String id_project,String status) throws Exception{
        ArrayList<Task> tasks = new ArrayList<>();
        Connection c = null;
        PreparedStatement prstm = null;
        ResultSet rs = null;
        try {
            c = Database.getConnection();
            prstm = c.prepareStatement("SELECT * FROM v_task WHERE id_project = ? AND status = ?");
            prstm.setString(1, id_project);
            prstm.setString(2, status);
            rs = prstm.executeQuery();
            while (rs.next()) {
                Task t = new Task(rs.getString("name"), rs.getString("description"), rs.getTimestamp("start_date"),
                        rs.getTimestamp("end_date"), rs.getString("id_task_category"), rs.getString("id_collaborator"),
                        rs.getString("id_project"),rs.getDouble("progress"));
                t.setId(rs.getString("id_task"));
                t.setStatus(rs.getString("status"));
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
    /*                       List of all task of all status                       */
    /* -------------------------------------------------------------------------- */
    public static HashMap<String, ArrayList<Task>> getTasksByStatus(String id_project) throws Exception{
        HashMap<String, ArrayList<Task>> result = new HashMap<>();
        ArrayList<Status> listStatus = Status.getAll();
        for(Status st : listStatus){
            result.put(st.getLabel().toLowerCase(),Task.getListTaskByIdProject(id_project, st.getLabel().toLowerCase()));
        }
        return result;
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

    public void setProgress(double d){
        this.progress = d;
    }

    public double getProgress(){
        return this.progress;
    }

    public String getStatus(){
        return this.status;
    }
    
    public void setStatus(String str){
        this.status = str;
    }

    public static void main(String[] args) {
        try {
            HashMap<String, ArrayList<Task>> ls = Task.getTasksByStatus("PRO1");
            System.out.println(new Gson().toJson(ls));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}