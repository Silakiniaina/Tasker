package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

import shared.Database;

public class Collaborator {
    String id;
    String name;
    String email;
    String idGender;
    String idRole;
    Timestamp insertDate;

    /* Constructor */
    public Collaborator(String name, String email, String idG, String idR){
        this.setName(name);
        this.setEmail(email);
        this.setIdGender(idG);
        this.setIdRole(idR);
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
                result = new Collaborator(rs.getString(2), rs.getString(3), rs.getString(6), rs.getString(7));
                result.setId(rs.getString(1));
            }
        }catch(Exception e){
            if(rs != null)rs.close();
            if(prstm != null) prstm.close();
            if(c != null)c.close();
        }
        return result;
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
    public Timestamp getInsertDate() {
        return insertDate;
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

    /* Test */
    public static void main(String[] args) {
        try{
            Collaborator c = Collaborator.login("sandasilakiniaina4@gmail.com", "1235");
            if(c != null){
                System.out.println("Connected");
            }else {
                System.out.println("Not connected");
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}