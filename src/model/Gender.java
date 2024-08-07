package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import shared.Database;

public class Gender {
    String id;
    String label;

    /* -------------------------------------------------------------------------- */
    /*                                 Constructor                                */
    /* -------------------------------------------------------------------------- */
    public Gender(String id, String label){
        this.setId(id);
        this.setLabel(label);
    }


    /* -------------------------------------------------------------------------- */
    /*             Function to fetch all the data in the table gender             */
    /* -------------------------------------------------------------------------- */
    public static ArrayList<Gender> getAll() throws Exception{
        ArrayList<Gender> result = new ArrayList<Gender>();
        Connection c = null;
        PreparedStatement prstm = null;
        ResultSet rs = null;
        try {
            c = Database.getConnection();
            prstm = c.prepareStatement("SELECT * FROM gender");
            rs = prstm.executeQuery();
            while (rs.next()) {
                Gender gen = new Gender(rs.getString(1), rs.getString(2));
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
    /*                                   Getters                                  */
    /* -------------------------------------------------------------------------- */
    public String getId() {
        return id;
    }
    public String getLabel() {
        return label;
    }

    /* -------------------------------------------------------------------------- */
    /*                                   Setters                                  */
    /* -------------------------------------------------------------------------- */
    public void setId(String id) {
        this.id = id;
    }
    public void setLabel(String label) {
        this.label = label;
    }
}
