package shared;

import java.sql.Connection;
import java.sql.DriverManager;

public class Database {
    /**
     * A function for connecting to the local database.
     * @return An instance of a Connection if the connection is valid , else return null.
     * @throws Exception if the connection doesn't pass.
     */
    public static Connection getConnection() throws Exception{
        Connection c = null;
        try{
            Class.forName("org.postgresql.Driver");
            c = DriverManager.getConnection("jdbc:postgresql://localhost/tasker", "sanda", "huhu2005!!");
        }catch(Exception e){
            System.out.println("Erreur");
            e.printStackTrace();
            throw e ;
        }
        return c;
    }
}
