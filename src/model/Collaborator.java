package model;

import java.sql.Timestamp;

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
}