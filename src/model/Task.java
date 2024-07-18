package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.google.gson.Gson;

import shared.Database;

public class Task {
    private String idTask;
    private String name;
    private String description;
    private Date startDate;
    private Date endDate;
    private String idTaskCategory;
    private String idCollaborator;
    private String idProject;

    // Constructeur
    public Task(String name, String description, Date st, Date en, String categ, String col, String pr) {
        this.setName(name);
        this.setDescription(description);
        this.setStartDate(st);
        this.setEndDate(en);
        this.setIdTaskCategory(categ);
        this.setIdCollaborator(col);
        this.setIdProject(pr);

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
                Task t = new Task(rs.getString("name"), rs.getString("description"), rs.getDate("start_date"),
                        rs.getDate("end_date"), rs.getString("id_task_category"), rs.getString("id_collaborator"),
                        rs.getString("id_project"));
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
            prstm = c.prepareStatement("INSERT INTO task(name,description,start_date,end_date,id_task_category,id_collaborator,id_project) VALUES (?, ?, ?, ?, ?, ?, ?)");
            prstm.setString(1,this.getName());
            prstm.setString(2, this.getDescription());
            prstm.setDate(3, this.getStartDate());
            prstm.setDate(4, this.getEndDate());
            prstm.setString(5, this.getIdTaskCategory());
            prstm.setString(6, this.getIdCollaborator());
            prstm.setString(7, this.getIdProject());
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
                result = new Task(rs.getString("name"), rs.getString("description"), rs.getDate("start_date"),
                        rs.getDate("end_date"), rs.getString("id_task_category"), rs.getString("id_collaborator"),
                        rs.getString("id_project"));
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
                "UPDATE task SET name = ? , description = ?, start_date = ? , end_date = ? , id_task_category = ? , id_collaborator = ?, id_project = ? WHERE id_task = ?");
                prstm.setString(1,t.getName());
                prstm.setString(2, t.getDescription());
                prstm.setDate(3, t.getStartDate());
                prstm.setDate(4, t.getEndDate());
                prstm.setString(5, t.getIdTaskCategory());
                prstm.setString(6, t.getIdCollaborator());
                prstm.setString(7, t.getIdProject());
            prstm.setString(8, this.getId());
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

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
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

    public static void main(String[] args) {
        try {
            // ArrayList<Task> ls = Task.getAll();
            // System.out.println(new Gson().toJson(ls));
            // // Task t = new Task("creation", "Creation formulaire login1", Date.valueOf("2024-07-19"), Date.valueOf("2024-07-29"), "TAC1","COL1", "PRO1");
            // // t.insert();
            // Task t1 =  Task.getById("TAS2");
            // Task t2 = Task.getById("TAS3");
            // t1.update(t2);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}