package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.google.gson.Gson;

import shared.Database;

public class Priority {
        String id;
    String label;

    /* -------------------------------------------------------------------------- */
    /*                                 Constructor                                */
    /* -------------------------------------------------------------------------- */
    public Priority(String id, String label){
        this.setId(id);
        this.setLabel(label);
    }


    /* -------------------------------------------------------------------------- */
    /*             Function to fetch all the data in the table Priority             */
    /* -------------------------------------------------------------------------- */
    public static ArrayList<Priority> getAll() throws Exception{
        ArrayList<Priority> result = new ArrayList<Priority>();
        Connection c = null;
        PreparedStatement prstm = null;
        ResultSet rs = null;
        try {
            c = Database.getConnection();
            prstm = c.prepareStatement("SELECT * FROM priority");
            rs = prstm.executeQuery();
            while (rs.next()) {
                Priority gen = new Priority(rs.getString(1), rs.getString(2));
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

    public static void main(String[] args) {
        try {
            ArrayList<Priority> ls = Priority.getAll();
            System.out.println(new Gson().toJson(ls));
        } catch (Exception e) {
            // TODO: handle exception
        }
    }
}
