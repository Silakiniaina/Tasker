package shared;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class Database {
    /**
     * A function for connecting to the local database.
     * @return An instance of a Connection if the connection is valid , else return null.
     * @throws Exception if the connection doesn't pass.
     */
    public static Connection getConnection() throws Exception{
        Connection c = null;
        ArrayList<String> conf = Database.readDatabaseConfig("/home/sanda/IT/S4/Web Dynamique/Tasker/src/shared/db.conf");
        try{
            Class.forName("org.postgresql.Driver");
            c = DriverManager.getConnection("jdbc:postgresql://localhost/"+conf.get(0), conf.get(1), conf.get(2));
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

    public static ArrayList<String> readDatabaseConfig(String filePath) {
        Map<String, String> configMap = new HashMap<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                line = line.trim();
                if (!line.isEmpty() && !line.startsWith("#")) {
                    String[] parts = line.split(":", 2);
                    if (parts.length == 2) {
                        String key = parts[0].trim().toLowerCase();
                        String value = parts[1].trim();
                        configMap.put(key, value);
                    }
                }
            }
        } catch (IOException e) {
            System.err.println("Erreur lors de la lecture du fichier de configuration : " + e.getMessage());
            e.printStackTrace();
        }

        ArrayList<String> configInfo = new ArrayList<>();
        configInfo.add(configMap.getOrDefault("dbname", ""));
        configInfo.add(configMap.getOrDefault("user", ""));
        configInfo.add(configMap.getOrDefault("pwd", ""));

        // Vérification que nous avons bien les 3 informations nécessaires
        if (configInfo.stream().anyMatch(String::isEmpty)) {
            System.err.println("Le fichier de configuration ne contient pas toutes les informations nécessaires.");
            return new ArrayList<>(); // Retourne une liste vide en cas d'erreur
        }

        return configInfo;
    }

}
