package shared;

import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
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

    /**
     * A function to hash a string with the SHA256.
     * @param str The String to hash with SHA256.
     * @return The hashed value of the entered parameter.
     * @throws Exception if the hash doesn't pass.
     */
    public static String toSHA256(String str) throws Exception{
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(str.getBytes(StandardCharsets.UTF_8));
            BigInteger number = new BigInteger(1, hash);
            StringBuilder hexString = new StringBuilder(number.toString(16));
            while (hexString.length() < 64) {
                hexString.insert(0, '0');
            }
            return hexString.toString();
        } catch (Exception e) {
            throw e;
        }
    }
}
