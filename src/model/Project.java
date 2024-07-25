package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import com.google.gson.Gson;

import shared.Database;

public class Project {
    String id;
    String name;
    String description;
    Date startDate;
    Date endDate;
    String idResponsable;
    String idProjectCategory;
    String idPriority;
    double progress;

    /* -------------------------------------------------------------------------- */
    /* Constructors */
    /* -------------------------------------------------------------------------- */
    public Project(String name, String desc, Date start, Date end, String responsable, String category,
            double progress) {
        this.setName(name);
        this.setDescription(desc);
        this.setStartDate(start);
        this.setEndDate(end);
        this.setIdResponsable(responsable);
        this.setIdProjectCategory(category);
        this.setProgress(progress);
    }

    public Project(String name, String desc, Date start, Date end, String responsable, String category, String priority) {
        this.setName(name);
        this.setDescription(desc);
        this.setStartDate(start);
        this.setEndDate(end);
        this.setIdResponsable(responsable);
        this.setIdProjectCategory(category);
        this.setIdPriority(priority);
    }

    /* -------------------------------------------------------------------------- */
    /* Function to get all the project in the database */
    /* -------------------------------------------------------------------------- */
    public static ArrayList<Project> getAll() throws Exception {
        ArrayList<Project> result = new ArrayList<>();
        Connection c = null;
        PreparedStatement prstm = null;
        ResultSet rs = null;
        try {
            c = Database.getConnection();
            prstm = c.prepareStatement("SELECT * FROM v_project");
            rs = prstm.executeQuery();
            while (rs.next()) {
                Project pr = new Project(
                        rs.getString("name"), 
                        rs.getString("description"), 
                        rs.getDate("start_date"),
                        rs.getDate("end_date"), 
                        rs.getString("id_responsable"), 
                        rs.getString("id_project_category"),
                        rs.getDouble("progress"));
                pr.setId(rs.getString("id_project"));
                pr.setIdPriority(rs.getString("id_priority"));
                result.add(pr);
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
    /* Function to get a project by his id */
    /* -------------------------------------------------------------------------- */
    public static Project getById(String id) throws Exception {
        Project result = null;
        Connection c = null;
        PreparedStatement prstm = null;
        ResultSet rs = null;
        try {
            c = Database.getConnection();
            prstm = c.prepareStatement("SELECT * FROM v_project WHERE id_project = ?");
            prstm.setString(1, id);
            rs = prstm.executeQuery();
            if (rs.next()) {
                result = new Project(
                    rs.getString("name"), 
                    rs.getString("description"), 
                    rs.getDate("start_date"),
                    rs.getDate("end_date"), 
                    rs.getString("id_responsable"), 
                    rs.getString("id_project_category"),
                    rs.getDouble("progress"));
                result.setId(rs.getString("id_project"));
                result.setIdPriority(rs.getString("id_priority"));
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
    /* Function to insert a Project */
    /* -------------------------------------------------------------------------- */
    public void insert() throws Exception {
        Connection c = null;
        PreparedStatement prstm = null;
        try {
            c = Database.getConnection();
            c.setAutoCommit(false);
            prstm = c.prepareStatement(
                    "INSERT INTO project(name,description,start_date,end_date,id_responsable,id_project_category,id_priority) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            prstm.setString(1, this.getName());
            prstm.setString(2, this.getDescription());
            prstm.setDate(3, this.getStartDate());
            prstm.setDate(4, this.getEndDate());
            prstm.setString(5, this.getIdResponsable());
            prstm.setString(6, this.getIdProjectCategory());
            prstm.setString(7, this.getIdPriority());
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
    /* Function to update a project */
    /* -------------------------------------------------------------------------- */
    public void update(Project p) throws Exception {
        Connection c = null;
        PreparedStatement prstm = null;
        try {
            c = Database.getConnection();
            c.setAutoCommit(false);
            prstm = c.prepareStatement(
                    "UPDATE project SET name = ? , description = ?, start_date = ? , end_date = ? , id_responsable = ? , id_project_category = ?, id_priority = ? WHERE id_project = ?");
            prstm.setString(1, p.getName());
            prstm.setString(2, p.getDescription());
            prstm.setDate(3, p.getStartDate());
            prstm.setDate(4, p.getEndDate());
            prstm.setString(5, p.getIdResponsable());
            prstm.setString(6, p.getIdProjectCategory());
            prstm.setString(7, p.getIdPriority());
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
    /* Function to delete project */
    /* -------------------------------------------------------------------------- */
    public void delete() throws Exception {
        Connection c = null;
        PreparedStatement prstm = null;
        try {
            c = Database.getConnection();
            c.setAutoCommit(false);
            prstm = c.prepareStatement("DELETE FROM project WHERE id_project = ?");
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
    /* Function to search */
    /* -------------------------------------------------------------------------- */
    public static ArrayList<Project> search() throws Exception {
        return Project.getAll();
    }

    /* -------------------------------------------------------------------------- */
    /* Project number */
    /* -------------------------------------------------------------------------- */
    public static HashMap<String, Integer> getNumberProject() throws Exception {
        HashMap<String, Integer> result = new HashMap<>();
        Connection c = null;
        PreparedStatement prstm = null;
        ResultSet rs = null;
        try {
            c = Database.getConnection();
            prstm = c.prepareStatement("SELECT * FROM v_number_project");
            rs = prstm.executeQuery();
            ResultSetMetaData meta = rs.getMetaData();
            if (rs.next()) {
                for (int i = 0; i < meta.getColumnCount(); i++)
                    result.put(meta.getColumnLabel(i + 1), Integer.valueOf(rs.getString(i + 1)));
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
    /*                                  Task stat                                 */
    /* -------------------------------------------------------------------------- */
    public HashMap<String,Integer> getTaskStatistic() throws Exception{
        HashMap<String, Integer> result = new HashMap<>();
        Connection c = null; 
        PreparedStatement prstm = null; 
        ResultSet rs = null;
        try {
            c = Database.getConnection();
            prstm = c.prepareStatement("SELECT sheduled,finished,progressing,blocked FROM v_project_task_stat WHERE id_project = ?");
            prstm.setString(1, this.getId());
            rs = prstm.executeQuery();
            ResultSetMetaData meta = rs.getMetaData();
            if (rs.next()) {
                for (int i = 0; i < meta.getColumnCount(); i++)
                    result.put(meta.getColumnLabel(i + 1), Integer.valueOf(rs.getString(i + 1)));
            }
        } catch (Exception e) {
            throw e;
        }finally{
            if(rs != null) rs.close();
            if(prstm != null) prstm.close();
            if(c != null) c.close();
        }
        return result;
    }

    /* -------------------------------------------------------------------------- */
    /* Getters */
    /* -------------------------------------------------------------------------- */
    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public Date getStartDate() {
        return startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public String getIdResponsable() {
        return idResponsable;
    }

    public String getIdProjectCategory() {
        return idProjectCategory;
    }

    public double getProgress(){
        return this.progress;
    }

    public String getIdPriority(){
        return this.idPriority;
    }

    /* -------------------------------------------------------------------------- */
    /* Setters */
    /* -------------------------------------------------------------------------- */
    public void setId(String id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public void setIdResponsable(String idResponsable) {
        this.idResponsable = idResponsable;
    }

    public void setIdProjectCategory(String idProjectCategory) {
        this.idProjectCategory = idProjectCategory;
    }

    public void setProgress(double d){
        this.progress = d;
    }

    public void setIdPriority(String str){
        this.idPriority = str;
    }

    public static void main(String[] args) {
        try {
            Project p = Project.getById("PRO1");
            HashMap<String, Integer> stat = p.getTaskStatistic();
            System.out.println(new Gson().toJson(stat));
        } catch (Exception e) {
            // TODO: handle exception
        }
    }
}
