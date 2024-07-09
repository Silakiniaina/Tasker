package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;

import com.google.gson.Gson;

import shared.Database;

public class Project {
    String id; 
    String name;
    String description; 
    Timestamp startDate;
    Timestamp endDate;
    String idResponsable;
    String idCategoryProject;
    String idStatus;

    /* -------------------------------------------------------------------------- */
    /*                                Constructors                                */
    /* -------------------------------------------------------------------------- */
    public Project(String name, String desc, Timestamp start, Timestamp end, String responsable, String category,String status){
        this.setName(name);
        this.setDescription(desc);
        this.setStartDate(start);
        this.setEndDate(end);
        this.setIdResponsable(responsable);
        this.setIdCategoryProject(category);
        this.setIdStatus(status);
    }

    /* -------------------------------------------------------------------------- */
    /*               Function to get all the project in the database              */
    /* -------------------------------------------------------------------------- */
    public static ArrayList<Project> getAll()throws Exception{
        ArrayList<Project> result = new ArrayList<>();
        Connection c = null;
        PreparedStatement prstm = null;
        ResultSet rs = null;
        try {
            c = Database.getConnection();
            prstm = c.prepareStatement("SELECT * FROM project");
            rs = prstm.executeQuery();
            while(rs.next()){
                Project pr = new Project(rs.getString(2), rs.getString(3), rs.getTimestamp(4), rs.getTimestamp(5), rs.getString(7), rs.getString(8),rs.getString(9));
                result.add(pr);
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
    /*                        Function to insert a Project                        */
    /* -------------------------------------------------------------------------- */
    public void insert() throws Exception{
        Connection c = null; 
        PreparedStatement prstm  = null; 
        try {
            c = Database.getConnection();
            c.setAutoCommit(false);
            prstm = c.prepareStatement("INSERT INTO project(name,description,start_date,end_date,id_responsable,id_project_category,id_status) VALUES (?, ?, ?, ?, ?, ?, ?)");
            prstm.setString(1,this.getName());
            prstm.setString(2, this.getDescription());
            prstm.setTimestamp(3, this.getStartDate());
            prstm.setTimestamp(4, this.getEndDate());
            prstm.setString(5, this.getIdResponsable());
            prstm.setString(6, this.getIdCategoryProject());
            prstm.setString(7, this.getIdStatus());
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
    /*                                   Getters                                  */
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
    public Timestamp getStartDate() {
        return startDate;
    }
    public Timestamp getEndDate() {
        return endDate;
    }
    public String getIdResponsable() {
        return idResponsable;
    }
    public String getIdCategoryProject() {
        return idCategoryProject;
    }
    public String getIdStatus(){
        return idStatus;
    }
    
    /* -------------------------------------------------------------------------- */
    /*                                   Setters                                  */
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
    public void setStartDate(Timestamp startDate) {
        this.startDate = startDate;
    }
    public void setEndDate(Timestamp endDate) {
        this.endDate = endDate;
    }
    public void setIdResponsable(String idResponsable) {
        this.idResponsable = idResponsable;
    }
    public void setIdCategoryProject(String idCategoryProject) {
        this.idCategoryProject = idCategoryProject;
    }
    public void setIdStatus(String status){
        this.idStatus = status;
    }

    /* -------------------------------------------------------------------------- */
    /*                                    test                                    */
    /* -------------------------------------------------------------------------- */
    public static void main(String[] args) {
        try {
            Project p = new Project("Project 1","Description 1" , Timestamp.valueOf(LocalDateTime.now()), Timestamp.valueOf(LocalDateTime.now()), "COL2", "PRC2", "STA2");
            p.insert();
            ArrayList<Project> ls = Project.getAll();
            System.out.println(new Gson().toJson(ls));
        } catch (Exception e) {
            e.getMessage();
        }
    }
}
