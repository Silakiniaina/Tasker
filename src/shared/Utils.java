package shared;

import java.sql.Timestamp;

public class Utils {
    /* -------------------------------------------------------------------------- */
    /*                 Format the data from the input to timestamp                */
    /* -------------------------------------------------------------------------- */
    public static String formatDate(Timestamp dt){
        String replaced = dt.toString().replace(" ", "T");
        return replaced.substring(0,replaced.indexOf("."));
    }
}
