package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.HashMap;

import shared.Database;

public class Dashboard {
    
    /* -------------------------------------------------------------------------- */
    /*         Getting the number of project,task,collaborator and meeting        */
    /* -------------------------------------------------------------------------- */
        public static HashMap<String, Integer> getNumber() throws Exception {
        HashMap<String, Integer> result = new HashMap<>();
        Connection c = null;
        PreparedStatement prstm = null;
        ResultSet rs = null;
        try {
            c = Database.getConnection();
            prstm = c.prepareStatement("SELECT * FROM v_number_dashboard");
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
}
