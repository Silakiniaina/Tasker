package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import shared.Database;

public class Role {
    String id;
    String label;

    /* -------------------------------------------------------------------------- */
    /* Constructor */
    /* -------------------------------------------------------------------------- */
    public Role(String id, String label) {
        this.setId(id);
        this.setLabel(label);
    }

    /* -------------------------------------------------------------------------- */
    /* Function to fetch all the data in the table Role */
    /* -------------------------------------------------------------------------- */
    public static ArrayList<Role> getAll() throws Exception {
        ArrayList<Role> result = new ArrayList<Role>();
        Connection c = null;
        PreparedStatement prstm = null;
        ResultSet rs = null;
        try {
            c = Database.getConnection();
            prstm = c.prepareStatement("SELECT * FROM role");
            rs = prstm.executeQuery();
            while (rs.next()) {
                Role gen = new Role(rs.getString(1), rs.getString(2));
                result.add(gen);
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

    public String getLabel() {
        return label;
    }

    /* -------------------------------------------------------------------------- */
    /* Setters */
    /* -------------------------------------------------------------------------- */
    public void setId(String id) {
        this.id = id;
    }

    public void setLabel(String label) {
        this.label = label;
    }
}
