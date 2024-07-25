package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.time.Duration;
import java.util.ArrayList;

import shared.Database;

public class Meeting {
    String id;
    Date dateMeeting;
    Time startTime;
    Time endTime;
    String idCategoryMeeting;
    String idProject;
    String idResponsable;
    String idStatus;
    String idRoom;

    /* -------------------------------------------------------------------------- */
    /*                                 Constructor                                */
    /* -------------------------------------------------------------------------- */
    public Meeting(Date d,Time start, Time end, String categ, String pro, String res,String stat, String rom){
        this.setDateMeeting(d);
        this.setStartTime(start);
        this.setEndTime(end);
        this.setIdCategoryMeeting(categ);
        this.setIdProject(pro);
        this.setIdResponsable(res);
        this.setIdStatus(stat);
        this.setIdRoom(rom);
    }

    /* -------------------------------------------------------------------------- */
    /*                               Funtion get all                              */
    /* -------------------------------------------------------------------------- */
    public static ArrayList<Meeting> getAll() throws Exception{
        ArrayList<Meeting> result = new ArrayList<>();
        Connection c = null;
        PreparedStatement prstm = null;
        ResultSet rs = null;
        try {
            c = Database.getConnection();
            prstm = c.prepareStatement("SELECT * FROM meeting");
            rs = prstm.executeQuery();
            while(rs.next()){
                Meeting m = new Meeting(rs.getDate("date_meeting"),rs.getTime("start_time"), rs.getTime("end_time"), rs.getString("id_meeting_category"), rs.getString("id_project"), rs.getString("id_responsable"),rs.getString("id_status"),rs.getString("id_room"));
                m.setId(rs.getString("id_meeting"));
                result.add(m);
            }
        } catch (Exception e) {
            throw e;
        }finally{
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
    /*                                  Get by id                                 */
    /* -------------------------------------------------------------------------- */
    public static Meeting getById(String id) throws Exception{
        Meeting result = null;
        Connection c = null;
        PreparedStatement prstm = null;
        ResultSet rs = null;
        try {
            c = Database.getConnection();
            prstm = c.prepareStatement("SELECT * FROM meeting WHERE id_meeting = ?");
            prstm.setString(1, id);
            rs = prstm.executeQuery();
            if(rs.next()){
                result = new Meeting(rs.getDate("date_meeting"),rs.getTime("start_time"), rs.getTime("end_time"), rs.getString("id_meeting_category"), rs.getString("id_project"), rs.getString("id_responsable"),rs.getString("id_status"), rs.getString("id_room"));
                result.setId(rs.getString("id_meeting"));
            }
        } catch (Exception e) {
            throw e;
        }finally{
            if(rs != null)rs.close();
            if(prstm != null)prstm.close();
            if(c != null) c.close();
        }
        return result;
    }

    /* -------------------------------------------------------------------------- */
    /*                              Insert a meeting                              */
    /* -------------------------------------------------------------------------- */
    public void insert() throws Exception{
        Connection c = null; 
        PreparedStatement prstm  = null; 
        try {
            c = Database.getConnection();
            c.setAutoCommit(false);
            prstm = c.prepareStatement("INSERT INTO meeting(date_meeting,start_time,end_time,id_meeting_category,id_responsable,id_project,id_status,id_room) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            prstm.setDate(1, this.getDateMeeting());
            prstm.setTime(2, this.getStartTime());
            prstm.setTime(3, this.getEndTime());
            prstm.setString(4, this.getIdCategoryMeeting());
            prstm.setString(5, this.getIdResponsable());
            prstm.setString(6, this.getIdProject());
            prstm.setString(7, this.getIdStatus());
            prstm.setString(8, this.getIdRoom());
            prstm.executeUpdate();
            c.commit();
        } catch (Exception e) {
            c.rollback();
            throw e;
        }finally{
            if(prstm != null) prstm.close();
            if(c != null) c.close();
        }
    }


    /* -------------------------------------------------------------------------- */
    /*                              update a meeting                              */
    /* -------------------------------------------------------------------------- */
    public void update(Meeting m) throws Exception{
        Connection c = null; 
        PreparedStatement prstm  = null; 
        try {
            c = Database.getConnection();
            c.setAutoCommit(false);
            prstm = c.prepareStatement("UPDATE meeting SET date_meeting = ?, start_time = ?, end_time = ? , id_meeting_category = ? , id_responsable = ?, id_project = ?, id_status  = ?, id_room = ? WHERE id_meeting = ?");
            prstm.setDate(1, m.getDateMeeting());
            prstm.setTime(2, m.getStartTime());
            prstm.setTime(3, m.getEndTime());
            prstm.setString(4, m.getIdCategoryMeeting());
            prstm.setString(5, m.getIdResponsable());
            prstm.setString(6, m.getIdProject());
            prstm.setString(7, m.getIdStatus());
            prstm.setString(8, m.getIdRoom());
            prstm.setString(9, this.getId());
            prstm.executeUpdate();
            c.commit();
        } catch (Exception e) {
            c.rollback();
            throw e;
        }finally{
            if(prstm != null) prstm.close();
            if(c != null) c.close();
        }
    }

    /* -------------------------------------------------------------------------- */
    /*                                Delete a meeting                               */
    /* -------------------------------------------------------------------------- */
    public void delete() throws Exception {
        Connection c = null;
        PreparedStatement prstm = null;
        try {
            c = Database.getConnection();
            c.setAutoCommit(false);
            prstm = c.prepareStatement("DELETE FROM meeting WHERE id_meeting = ?");
            prstm.setString(1, this.getId());
            prstm.executeUpdate();
            c.commit();
        } catch (Exception e) {
            c.rollback();
            throw e;
        } finally {
            if (prstm != null)
                prstm.close();
            if (c != null)
                c.close();
        }
    }

    public static ArrayList<Meeting> search(){
        return null;
    }
    
    /* -------------------------------------------------------------------------- */
    /*                                   Getters                                  */
    /* -------------------------------------------------------------------------- */
    public String getId() {
        return id;
    }
    public Time getStartTime() {
        return startTime;
    }
    public Time getEndTime() {
        return endTime;
    }
    public String getIdCategoryMeeting() {
        return idCategoryMeeting;
    }
    public String getIdProject() {
        return idProject;
    }
    public String getIdResponsable() {
        return idResponsable;
    }
    public String getIdRoom(){
        return this.idRoom;
    }
    public String getIdStatus(){
        return this.idStatus;
    } 
    public Date getDateMeeting(){
        return this.dateMeeting;
    } 

    /* -------------------------------------------------------------------------- */
    /*                           Duration of the meeting                          */
    /* -------------------------------------------------------------------------- */
    public Time getDuration(){
        Duration d = Duration.between(this.getStartTime().toLocalTime(),this.getEndTime().toLocalTime());
        return new Time(d.toMillis());
    }
    
    /* -------------------------------------------------------------------------- */
    /*                                   Setters                                  */
    /* -------------------------------------------------------------------------- */
    public void setId(String id) {
        this.id = id;
    }
    public void setStartTime(Time startTime) {
        this.startTime = startTime;
    }
    public void setEndTime(Time endTime) {
        this.endTime = endTime;
    }
    public void setIdCategoryMeeting(String idCategoryMeeting) {
        this.idCategoryMeeting = idCategoryMeeting;
    }
    public void setIdProject(String idProject) {
        this.idProject = idProject;
    }
    public void setIdResponsable(String idResponsable) {
        this.idResponsable = idResponsable;
    }
    public void setIdRoom(String t){
        this.idRoom = t;
    }
    public void setIdStatus(String st){
        this.idStatus = st;
    }
    public void setDateMeeting(Date dt){
        this.dateMeeting = dt;
    }
}
