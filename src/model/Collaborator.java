package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.ArrayList;

import com.google.gson.Gson;

import shared.Database;

public class Collaborator {
    String id;
    String name;
    String email;
    protected String password;
    String idGender;
    String idRole;
    Timestamp insertDate;
    Date birthDate;

    /* Constructor */
    public Collaborator(String name, String email, String idG, String idR,Date birDate){
        this.setName(name);
        this.setEmail(email);
        this.setIdGender(idG);
        this.setIdRole(idR);
        this.setBirthDate(birDate);
    }

    /**
     * A function to get all the collaborator in the database
     * @return an arrayList of Collaborator if there is collaborator in the database else return an empty arrayList
     * @throws Exception
     */
    public static ArrayList<Collaborator> getAll()throws Exception{
        ArrayList<Collaborator> result = new ArrayList<Collaborator>();
        Connection c = null; 
        PreparedStatement prstm = null; 
        ResultSet rs = null; 
        try {
            c = Database.getConnection();
            prstm = c.prepareStatement("SELECT * FROM collaborator");
            rs = prstm.executeQuery();
            while(rs.next()){
                Collaborator col = new Collaborator(rs.getString(2), rs.getString(3), rs.getString(6), rs.getString(7),rs.getDate(5));
                col.setId(rs.getString(1));
                col.setPassword(rs.getString(4));
                result.add(col);
            }
        } catch (Exception e) {
            throw e;
        }finally{
            if(rs != null)rs.close();
            if(prstm != null)prstm.close();
            if(c != null)c.close();
        }
        return result;
    }

    /**
     * A function to get an instance of Collaborator by his id in the database
     * @param id
     * @return An instance of Collaborator corresponding to the id taken as parameter in the table collaborator else null
     * @throws Exception if the operation doesn't pass as expected
     */
    public static Collaborator getById(String id)throws Exception{
        Collaborator result = null;
        Connection c = null; 
        PreparedStatement prstm = null; 
        ResultSet rs = null; 
        try {
            c = Database.getConnection();
            prstm = c.prepareStatement("SELECT * FROM collaborator WHERE id_collaborator = ?");
            prstm.setString(1, id);
            rs = prstm.executeQuery();
            while(rs.next()){
                result = new Collaborator(rs.getString(2), rs.getString(3), rs.getString(6), rs.getString(7),rs.getDate(5));
                result.setId(rs.getString(1));
                result.setPassword(rs.getString(4));
            }
        } catch (Exception e) {
            throw e;
        }finally{
            if(rs != null)rs.close();
            if(prstm != null)prstm.close();
            if(c != null)c.close();
        }
        return result;
    }

    /**
     * Update the information of the instance calling the function to be like the parameter
     * @param col
     * @throws Exception if the operation doesn't pass as expected
     */
    public void update(Collaborator col)throws Exception{
        Connection c = null; 
        PreparedStatement prstm = null; 
        try{
            c = Database.getConnection();
            c.setAutoCommit(false);
            prstm = c.prepareStatement("UPDATE collaborator SET name = ? , email = ? , password = ? , id_gender = ? , id_role = ? , date_of_birth = ? WHERE id_collaborator = ?");
            prstm.setString(1, col.getName());
            prstm.setString(2, col.getEmail());
            prstm.setString(3, col.getPassword());
            prstm.setString(4, col.getIdGender());
            prstm.setString(5, col.getIdRole());
            prstm.setDate(6,col.getBirthDate());
            prstm.setString(7,this.getId());
            System.out.println(prstm.toString());
            prstm.executeUpdate();
            c.commit();
        }catch(Exception e){
            c.rollback();
            throw e;
        }finally{
            if(prstm != null)prstm.close();
            if(c != null)c.close();
        }
    }


    /**
     * A function for the login of a Collaborator.
     * @param email The email of the Collaborator.
     * @param pwd The password of the Collaborator.
     * @return An instance of a Collaborator corresponding to the email and the password, else null.
     * @throws Exception if the function doesn't pass as expected.
     */
    public static Collaborator login(String email, String pwd) throws Exception{
        Collaborator result = null; 
        Connection c = null; 
        PreparedStatement prstm = null; 
        ResultSet rs = null; 
        try{
            c = Database.getConnection();
            prstm = c.prepareStatement("SELECT * FROM collaborator WHERE email = ? AND password  = ?");
            prstm.setString(1, email);
            prstm.setString(2, Database.toSHA256(pwd));
            rs = prstm.executeQuery();
            if(rs.next()){
                result = new Collaborator(rs.getString(2), rs.getString(3), rs.getString(6), rs.getString(7),rs.getDate(5));
                result.setId(rs.getString(1));
                result.setPassword(rs.getString(4));
            }
        }catch(Exception e){
            throw e;
        }finally{
            if(rs != null)rs.close();
            if(prstm != null) prstm.close();
            if(c != null)c.close();
        }
        return result;
    }

    /**
     * A function to insert the instance of Collaborator in the database.
     * @throws Exception if the operation doesn't pass as expected.
     */
    public void insert()throws Exception{
        Connection c = null; 
        PreparedStatement prstm = null; 
        try{
            c = Database.getConnection();
            c.setAutoCommit(false);
            prstm = c.prepareStatement("INSERT INTO collaborator(name,email,password,id_gender,id_role,date_of_birth) VALUES(?,?,?,?,?,?)");
            prstm.setString(1, this.getName());
            prstm.setString(2, this.getEmail());
            prstm.setString(3, this.getPassword());
            prstm.setString(4, this.getIdGender());
            prstm.setString(5, this.getIdRole());
            prstm.setDate(6,this.getBirthDate());
            prstm.executeUpdate();
            c.commit();
        }catch(Exception e){
            c.rollback();
            throw e;
        }finally{
            if(prstm != null)prstm.close();
            if(c != null)c.close();
        }
    }

    /**
     * A function to delete the instance of Collaborator in the database
     * @throws Exception if the operation doesn't pass as expected
     */
    public void delete()throws Exception{
        Connection c = null; 
        PreparedStatement prstm = null; 
        try{
            c = Database.getConnection();
            c.setAutoCommit(false);
            prstm = c.prepareStatement("DELETE FROM collaborator WHERE id_collaborator = ?");
            prstm.setString(1, this.getId());
            prstm.executeUpdate();
            c.commit();
        }catch(Exception e){
            c.rollback();
            throw e;
        }finally{
            if(prstm != null)prstm.close();
            if(c != null)c.close();
        }
    }
    
    /* Getters */
    public String getId() {
        return id;
    }
    public String getName() {
        return name;
    }
    public String getEmail() {
        return email;
    }
    public String getIdGender() {
        return idGender;
    }
    public String getIdRole() {
        return idRole;
    }
    protected String getPassword(){
        return this.password;
    }
    public Timestamp getInsertDate() {
        return insertDate;
    }
    public Date getBirthDate(){
        return this.birthDate;
    }
    
    /* Setters */
    public void setId(String id) {
        this.id = id;
    }
    public void setName(String name) {
        this.name = name;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public void setIdGender(String idGender) {
        this.idGender = idGender;
    }
    public void setIdRole(String idRole) {
        this.idRole = idRole;
    }
    public void setInsertDate(Timestamp insertDate) {
        this.insertDate = insertDate;
    } 
    public void setPassword(String pwd){
        this.password = pwd;
    }
    public void setBirthDate(Date d){
        this.birthDate = d;
    }

    /* Test */
    public static void main(String[] args) {
        try{
            Collaborator c = Collaborator.getById("COL3");
            Collaborator c1 = Collaborator.getById("COL4");
            c.update(c1);
            System.out.println(new Gson().toJson(c));
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}