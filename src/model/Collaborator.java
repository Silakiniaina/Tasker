package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;

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

    /* -------------------------------------------------------------------------- */
    /* Constructors */
    /* -------------------------------------------------------------------------- */
    public Collaborator(String name, String email, String idG, String idR, Date birDate) throws Exception {
        this.setName(name);
        this.setEmail(email);
        this.setIdGender(idG);
        this.setIdRole(idR);
        this.setBirthDate(birDate);
    }

    /* -------------------------------------------------------------------------- */
    /* Function to fetch all the Collaborator in the database */
    /* -------------------------------------------------------------------------- */
    public static ArrayList<Collaborator> getAll() throws Exception {
        ArrayList<Collaborator> result = new ArrayList<Collaborator>();
        Connection c = null;
        PreparedStatement prstm = null;
        ResultSet rs = null;
        try {
            c = Database.getConnection();
            prstm = c.prepareStatement("SELECT * FROM collaborator");
            rs = prstm.executeQuery();
            while (rs.next()) {
                Collaborator col = new Collaborator(rs.getString(2), rs.getString(3), rs.getString(7), rs.getString(8),
                        rs.getDate(5));
                col.setId(rs.getString(1));
                col.setPassword(rs.getString(4));
                result.add(col);
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
    /* Function to get an instance of Collaborator by his id in the database */
    /* -------------------------------------------------------------------------- */
    public static Collaborator getById(String id) throws Exception {
        Collaborator result = null;
        Connection c = null;
        PreparedStatement prstm = null;
        ResultSet rs = null;
        try {
            c = Database.getConnection();
            prstm = c.prepareStatement("SELECT * FROM collaborator WHERE id_collaborator = ?");
            prstm.setString(1, id);
            rs = prstm.executeQuery();
            while (rs.next()) {
                result = new Collaborator(rs.getString(2), rs.getString(3), rs.getString(7), rs.getString(8),
                        rs.getDate(5));
                result.setId(rs.getString(1));
                result.setPassword(rs.getString(4));
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
    /* Update the instance calling the function to be like the parameter */
    /* -------------------------------------------------------------------------- */
    public void update(Collaborator col) throws Exception {
        Connection c = null;
        PreparedStatement prstm = null;
        try {
            c = Database.getConnection();
            c.setAutoCommit(false);
            prstm = c.prepareStatement(
                    "UPDATE collaborator SET name = ? , email = ?, id_gender = ? , id_role = ? , date_of_birth = ? WHERE id_collaborator = ?");
            prstm.setString(1, col.getName());
            prstm.setString(2, col.getEmail());
            prstm.setString(3, col.getIdGender());
            prstm.setString(4, col.getIdRole());
            prstm.setDate(5, col.getBirthDate());
            prstm.setString(6, this.getId());
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
    /* Function for the login of a Collaborator */
    /* -------------------------------------------------------------------------- */
    public static Collaborator login(String email, String pwd) throws Exception {
        Collaborator result = null;
        Connection c = null;
        PreparedStatement prstm = null;
        ResultSet rs = null;
        try {
            c = Database.getConnection();
            prstm = c.prepareStatement("SELECT * FROM collaborator WHERE email = ? AND password  = ?");
            prstm.setString(1, email);
            prstm.setString(2, Database.toSHA256(pwd));
            rs = prstm.executeQuery();
            if (rs.next()) {
                result = new Collaborator(rs.getString(2), rs.getString(3), rs.getString(7), rs.getString(8),
                        rs.getDate(5));
                result.setId(rs.getString(1));
                result.setPassword(rs.getString(4));
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
    /* function to insert the instance of Collaborator in the database. */
    /* -------------------------------------------------------------------------- */
    public void insert() throws Exception {
        Connection c = null;
        PreparedStatement prstm = null;
        try {
            c = Database.getConnection();
            c.setAutoCommit(false);
            prstm = c.prepareStatement(
                    "INSERT INTO collaborator(name,email,password,id_gender,id_role,date_of_birth) VALUES(?,?,?,?,?,?)");
            prstm.setString(1, this.getName());
            prstm.setString(2, this.getEmail());
            prstm.setString(3, this.getPassword());
            prstm.setString(4, this.getIdGender());
            prstm.setString(5, this.getIdRole());
            prstm.setDate(6, this.getBirthDate());
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
    /* function to delete the instance of Collaborator in the database */
    /* -------------------------------------------------------------------------- */
    public void delete() throws Exception {
        Connection c = null;
        PreparedStatement prstm = null;
        try {
            c = Database.getConnection();
            c.setAutoCommit(false);
            prstm = c.prepareStatement("DELETE FROM collaborator WHERE id_collaborator = ?");
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
    /* function to filter the list of collaborator */
    /* -------------------------------------------------------------------------- */
    public static ArrayList<Collaborator> search(String name, String email, String gender, String role, Date debut,
            Date fin) throws Exception {
        ArrayList<Collaborator> result = new ArrayList<Collaborator>();
        Connection c = null;
        Statement st = null;
        ResultSet rs = null;
        try {
            String query = "SELECT * FROM collaborator WHERE 1=1 ";
            if (name != null)
                query += " AND name ILIKE \'%" + name + "%\'";
            if (email != null)
                query += " AND email LIKE \'%" + email + "%\'";
            if (gender != null)
                query += " AND id_gender = \'" + gender + "\'";
            if (role != null)
                query += " AND id_role = \'" + role + "\'";
            if (debut != null)
                query += " AND date_of_birth >= \'" + debut.toString() + "\'";
            if (fin != null)
                query += " AND date_of_birth <= \'" + fin.toString() + "\'";
            c = Database.getConnection();
            System.out.println(query);
            st = c.createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                Collaborator col = new Collaborator(rs.getString(2), rs.getString(3), rs.getString(7), rs.getString(8),
                        rs.getDate(5));
                col.setId(rs.getString(1));
                col.setPassword(rs.getString(4));
                result.add(col);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (rs != null)
                rs.close();
            if (st != null)
                st.close();
            if (c != null)
                c.close();
        }
        return result;
    }

    /* -------------------------------------------------------------------------- */
    /* function to fetch the number : total, this year, this month and today */
    /* -------------------------------------------------------------------------- */
    public static HashMap<String, Integer> getNumberCollaborator() throws Exception {
        HashMap<String, Integer> result = new HashMap<>();
        Connection c = null;
        PreparedStatement prstm = null;
        ResultSet rs = null;
        try {
            c = Database.getConnection();
            prstm = c.prepareStatement("SELECT * FROM v_number_collaborator");
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
    /* Getters */
    /* -------------------------------------------------------------------------- */
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

    protected String getPassword() {
        return this.password;
    }

    public Timestamp getInsertDate() {
        return insertDate;
    }

    public Date getBirthDate() {
        return this.birthDate;
    }

    /* -------------------------------------------------------------------------- */
    /* Setters */
    /* -------------------------------------------------------------------------- */
    public void setId(String id) {
        this.id = id;
    }

    public void setName(String name) throws Exception {
        if (name == null || name.trim().equals(""))
            throw new Exception("The name cannot be empty");
        this.name = name;
    }

    public void setEmail(String email) throws Exception {
        if (email == null || email.trim().equals(""))
            throw new Exception("The email cannot be empty");
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

    public void setPassword(String pwd) throws Exception {
        if (pwd == null || pwd.trim().equals(""))
            throw new Exception("The password cannot be empty");
        this.password = Database.toSHA256(pwd);
    }

    public void setBirthDate(Date d) throws Exception {
        if (d == null)
            throw new Exception("The birth date cannot be empty");
        this.birthDate = d;
    }

    /* -------------------------------------------------------------------------- */
    /* Test */
    /* -------------------------------------------------------------------------- */
    public static void main(String[] args) {
        try {
            HashMap<String, Integer> number = Collaborator.getNumberCollaborator();
            System.out.println(new Gson().toJson(number));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}