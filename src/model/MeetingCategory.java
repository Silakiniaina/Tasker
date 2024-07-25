package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.google.gson.Gson;

import shared.Database;

public class MeetingCategory {
        String id;
    String label;

    /* -------------------------------------------------------------------------- */
    /*                                 Constructor                                */
    /* -------------------------------------------------------------------------- */
    public MeetingCategory(String id, String label){
        this.setId(id);
        this.setLabel(label);
    }


    /* -------------------------------------------------------------------------- */
    /*             Function to fetch all the data in the table MeetingCategory             */
    /* -------------------------------------------------------------------------- */
    public static ArrayList<MeetingCategory> getAll() throws Exception{
        ArrayList<MeetingCategory> result = new ArrayList<MeetingCategory>();
        Connection c = null;
        PreparedStatement prstm = null;
        ResultSet rs = null;
        try {
            c = Database.getConnection();
            prstm = c.prepareStatement("SELECT * FROM meetingCategory");
            rs = prstm.executeQuery();
            while (rs.next()) {
                MeetingCategory gen = new MeetingCategory(rs.getString(1), rs.getString(2));
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
            ArrayList<MeetingCategory> ls = MeetingCategory.getAll();
            System.out.println(new Gson().toJson(ls));
        } catch (Exception e) {
            // TODO: handle exception
        }
    }
}
