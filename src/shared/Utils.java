package shared;

import java.sql.Timestamp;
import java.time.Instant;

public class Utils {
    /* -------------------------------------------------------------------------- */
    /*                 Format the data from the input to timestamp                */
    /* -------------------------------------------------------------------------- */
    public static String formatDate(Timestamp dt, boolean isReverse){
        String replaced = "";
        if(isReverse){
            replaced = dt.toString().replace(" ", "T");
        }else{
            replaced = dt.toString();
        }
        return replaced.substring(0,replaced.indexOf("."));
    }

    /* -------------------------------------------------------------------------- */
    /*                      Format a string to be a Timestamp                     */
    /* -------------------------------------------------------------------------- */
    public static Timestamp format(String str){
        return Timestamp.valueOf(str.replace("T", " "));
    }

    /* -------------------------------------------------------------------------- */
    /*             Function to get the difference between two datetime            */
    /* -------------------------------------------------------------------------- */
    public static int getDifference(Timestamp t1, Timestamp t2){
        long time = t1.getNanos() - t2.getTime();
        System.out.println(time);
        return 0;
    }

    /* -------------------------------------------------------------------------- */
    /*   Getting the deadline date according to the duration and the start date   */
    /* -------------------------------------------------------------------------- */
    public static Timestamp getDeadline(Timestamp startDate ,int duration){
        long timestamp = startDate.toInstant().toEpochMilli() + (duration*3600000);
        return Timestamp.from(Instant.ofEpochMilli(timestamp));
    }
}
